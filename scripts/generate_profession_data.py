#!/usr/bin/env python3
"""Generate Smart Deposit profession categories from the MoP Classic client.

The MoP client uses broad item classes for many profession objects. Pigments,
inks, engineering parts, dyes, oils, and other supplies cannot be classified
reliably from Item.ClassID and Item.SubclassID alone. This generator joins the
client's profession skill lines, spell reagents, spell-created items, item
metadata, and specialized-bag flags into one deterministic category per item.
"""

from __future__ import annotations

import argparse
import csv
import subprocess
import tempfile
from collections import Counter, defaultdict
from dataclasses import dataclass, field
from pathlib import Path

try:
    from scripts.profession_taxonomy import (
        CURATED_CATEGORY_BY_ITEM,
        EXCLUDED_ITEM_REASONS,
        SHARED_ITEM_IDS,
    )
except ModuleNotFoundError:
    from profession_taxonomy import (
        CURATED_CATEGORY_BY_ITEM,
        EXCLUDED_ITEM_REASONS,
        SHARED_ITEM_IDS,
    )


SOURCE_BUILD = "5.5.4.68806"
SOURCE_TABLES = (
    "Item",
    "ItemSparse",
    "SkillLineAbility",
    "SpellReagents",
    "SpellEffect",
)
SOURCE_URL = "https://wago.tools/db2/{table}/csv?build={build}"

PROFESSION_SKILL_LINES = {
    129: "first_aid",
    164: "blacksmithing",
    165: "leatherworking",
    171: "alchemy",
    182: "herbalism",
    185: "cooking",
    186: "mining",
    197: "tailoring",
    202: "engineering",
    333: "enchanting",
    356: "fishing",
    393: "skinning",
    755: "jewelcrafting",
    773: "inscription",
    794: "archaeology",
}

# Public categories deliberately keep raw materials separate from the
# professions that consume them. For example, ore stays Ore rather than being
# duplicated across Blacksmithing, Engineering, and Jewelcrafting.
PUBLIC_CATEGORY = {
    "archaeology": "archaeology",
    "alchemy": "alchemy",
    "blacksmithing": "blacksmithing",
    "cooking": "fish",
    "enchanting": "enchanting",
    "engineering": "engineering",
    "first_aid": "first_aid",
    "fishing": "fish",
    "herbalism": "herbs",
    "inscription": "inscription",
    "jewelcrafting": "jewels",
    "leatherworking": "leatherworking",
    "mining": "ore",
    "skinning": "leather",
    "tailoring": "tailoring",
}

CATEGORY_NAMES = {
    "alchemy": "Alchemy",
    "armor": "Armor",
    "archaeology": "Archaeology",
    "bags": "Bags",
    "battle_pets": "Battle Pets",
    "blacksmithing": "Blacksmithing",
    "cloth": "Cloth",
    "elemental": "Elemental",
    "enchanting": "Enchanting",
    "engineering": "Engineering",
    "first_aid": "First Aid",
    "fish": "Fish & Cooking",
    "food": "Food",
    "herbs": "Herbs",
    "inscription": "Inscription",
    "jewels": "Jewels",
    "leather": "Leather",
    "leatherworking": "Leatherworking",
    "lockboxes": "Lockboxes",
    "ore": "Ore, Bars & Stone",
    "profession_supplies": "Shared Profession Supplies",
    "tailoring": "Tailoring",
    "trinkets": "Trinkets",
    "weapons": "Weapons",
}

ITEM_CLASS = {
    "consumable": 0,
    "container": 1,
    "weapon": 2,
    "gem": 3,
    "armor": 4,
    "trade_goods": 7,
    "legacy_item_enhancement": 8,
    "recipe": 9,
    "quest": 12,
    "miscellaneous": 15,
    "glyph": 16,
    "battle_pet": 17,
}

RECIPE_CATEGORY = {
    1: "leatherworking",
    2: "tailoring",
    3: "engineering",
    4: "blacksmithing",
    5: "fish",
    6: "alchemy",
    7: "first_aid",
    8: "enchanting",
    9: "fish",
    10: "jewels",
    11: "inscription",
}

LOCKBOX_ITEM_IDS = {
    4632, 4633, 4634, 4636, 5758, 5759, 5760, 6354, 6355, 13875,
    16882, 29569, 31952, 43622, 43624, 45986, 68729, 88567,
}

# SpellEffect values observed for profession spells that materialize an item.
CREATE_ITEM_EFFECTS = {24, 53, 157}
ITEM_FLAG_CONJURED = 0x00000002

# Archaeology fragments are currencies in normal play, but the keystones are
# bankable item objects. Archaeology does not expose them through the ordinary
# reagent graph, so the client descriptions are the authoritative signal.
ARCHAEOLOGY_ITEM_IDS = {
    52843, 60740, 63127, 63128, 64392, 64394, 64395, 64396, 64397,
    79868, 79869, 95373, 95508,
}

# Specialized bag-family bits. These are supporting evidence, never sufficient
# by themselves when the recipe graph contradicts them (Crystal Vial is the
# canonical example: family 16, but used by Alchemy and Enchanting).
BAG_FAMILY_CATEGORY = {
    8: ("leatherworking", {"leatherworking"}),
    16: ("inscription", {"inscription"}),
    32: ("herbs", {"herbalism"}),
    64: ("enchanting", {"enchanting"}),
    128: ("engineering", {"engineering"}),
    512: ("jewels", {"jewelcrafting"}),
    1024: ("ore", {"mining", "blacksmithing"}),
    32768: ("fish", set()),
    65536: ("fish", {"cooking"}),
}


@dataclass
class Roles:
    reagent: set[str] = field(default_factory=set)
    product: set[str] = field(default_factory=set)


@dataclass(frozen=True)
class GeneratedCategory:
    category: str
    reason: str
    owners: tuple[str, ...]


def apply_taxonomy_policy(
    item_id: int,
    generated: GeneratedCategory,
) -> GeneratedCategory | None:
    if item_id in EXCLUDED_ITEM_REASONS:
        return None
    curated = CURATED_CATEGORY_BY_ITEM.get(item_id)
    if curated:
        return GeneratedCategory(
            curated,
            "curated player-facing category",
            generated.owners,
        )
    if item_id in SHARED_ITEM_IDS:
        return GeneratedCategory(
            "profession_supplies",
            "curated shared crafting reagent",
            generated.owners,
        )
    if generated.category == "profession_supplies":
        raise RuntimeError(
            f"multi-owner item {item_id} requires a curated category, "
            "Shared allowlist entry, or exclusion"
        )
    return generated


def integer(row: dict[str, str], key: str) -> int:
    return int(row.get(key) or 0)


def download(table: str, destination: Path) -> None:
    subprocess.run(
        [
            "curl",
            "--location",
            "--fail",
            "--silent",
            "--show-error",
            "--max-time",
            "120",
            SOURCE_URL.format(table=table, build=SOURCE_BUILD),
            "--output",
            str(destination),
        ],
        check=True,
    )


def read_rows(path: Path) -> list[dict[str, str]]:
    with path.open(newline="", encoding="utf-8-sig") as handle:
        return list(csv.DictReader(handle))


def load_sources(source_dir: Path) -> dict[str, list[dict[str, str]]]:
    sources = {}
    for table in SOURCE_TABLES:
        path = source_dir / f"{table}.csv"
        if not path.is_file():
            raise FileNotFoundError(f"missing source table: {path}")
        sources[table] = read_rows(path)
    return sources


def intrinsic_category(item_id: int, item: dict[str, str]) -> str | None:
    class_id = integer(item, "ClassID")
    subclass_id = integer(item, "SubclassID")
    inventory_type = integer(item, "InventoryType")

    if inventory_type == 12:
        return "trinkets"
    if class_id == ITEM_CLASS["armor"]:
        return "armor"
    if class_id == ITEM_CLASS["weapon"]:
        return "weapons"
    if class_id == ITEM_CLASS["trade_goods"] and subclass_id == 10:
        return "elemental"
    if class_id == ITEM_CLASS["battle_pet"] or (
        class_id == ITEM_CLASS["miscellaneous"] and subclass_id == 2
    ):
        return "battle_pets"
    if item_id in LOCKBOX_ITEM_IDS:
        return "lockboxes"
    if class_id == ITEM_CLASS["container"]:
        return "bags"
    if class_id == ITEM_CLASS["trade_goods"] and subclass_id == 5:
        return "cloth"
    if (
        class_id == ITEM_CLASS["trade_goods"] and subclass_id in {12, 14}
    ) or (
        class_id == ITEM_CLASS["consumable"] and subclass_id == 6
    ) or class_id == ITEM_CLASS["legacy_item_enhancement"]:
        return "enchanting"
    if class_id == ITEM_CLASS["consumable"] and subclass_id == 5:
        return "food"
    if class_id == ITEM_CLASS["trade_goods"] and subclass_id == 8:
        return "fish"
    if class_id == ITEM_CLASS["trade_goods"] and subclass_id == 9:
        return "herbs"
    if class_id == ITEM_CLASS["consumable"] and subclass_id in {1, 2, 3}:
        return "alchemy"
    if class_id == ITEM_CLASS["gem"] or (
        class_id == ITEM_CLASS["trade_goods"] and subclass_id == 4
    ):
        return "jewels"
    if class_id == ITEM_CLASS["trade_goods"] and subclass_id == 7:
        return "ore"
    if class_id == ITEM_CLASS["glyph"]:
        return "inscription"
    if class_id == ITEM_CLASS["trade_goods"] and subclass_id == 6:
        return "leather"
    if class_id == ITEM_CLASS["consumable"] and subclass_id == 7:
        return "first_aid"
    if class_id == ITEM_CLASS["recipe"]:
        return RECIPE_CATEGORY.get(subclass_id)
    return None


def bag_family_category(
    bag_family: int,
    owners: set[str],
) -> str | None:
    candidates = []
    for bit, (category, supporting_professions) in BAG_FAMILY_CATEGORY.items():
        if bag_family & bit and (
            not owners
            or not supporting_professions
            or owners & supporting_professions
        ):
            candidates.append(category)
    unique = set(candidates)
    return next(iter(unique)) if len(unique) == 1 else None


def generated_category(
    item_sparse: dict[str, str],
    roles: Roles,
) -> GeneratedCategory:
    owners = roles.reagent | roles.product
    family_category = bag_family_category(
        integer(item_sparse, "BagFamily"),
        owners,
    )
    if family_category and len(owners) <= 1:
        return GeneratedCategory(
            family_category,
            "specialized bag and profession data",
            tuple(sorted(owners)),
        )

    product_categories = {PUBLIC_CATEGORY[value] for value in roles.product}
    if len(product_categories) == 1:
        return GeneratedCategory(
            next(iter(product_categories)),
            "single crafted-product category",
            tuple(sorted(owners)),
        )

    owner_categories = {PUBLIC_CATEGORY[value] for value in owners}
    if len(owner_categories) == 1:
        return GeneratedCategory(
            next(iter(owner_categories)),
            "single profession category",
            tuple(sorted(owners)),
        )

    return GeneratedCategory(
        "profession_supplies",
        "shared by multiple professions",
        tuple(sorted(owners)),
    )


def is_statically_bank_eligible(
    item: dict[str, str],
    item_sparse: dict[str, str],
) -> tuple[bool, str | None]:
    # The live bag binding flag remains authoritative. These static exclusions
    # remove records a guild bank cannot accept before coverage is calculated.
    bonding = integer(item_sparse, "Bonding")
    if bonding == 1:
        return False, "binds when picked up"
    if bonding == 4:
        return False, "quest-bound"
    if integer(item, "ClassID") == ITEM_CLASS["quest"]:
        return False, "quest item class"
    if integer(item_sparse, "Flags_0") & ITEM_FLAG_CONJURED:
        return False, "conjured"
    return True, None


def has_direct_profession_metadata(item: dict[str, str]) -> bool:
    class_id = integer(item, "ClassID")
    subclass_id = integer(item, "SubclassID")
    if class_id == ITEM_CLASS["trade_goods"] and subclass_id in {
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 14,
    }:
        return True
    if class_id in {
        ITEM_CLASS["gem"],
        ITEM_CLASS["legacy_item_enhancement"],
        ITEM_CLASS["glyph"],
    }:
        return True
    if class_id == ITEM_CLASS["recipe"] and subclass_id in RECIPE_CATEGORY:
        return True
    return class_id == ITEM_CLASS["consumable"] and 1 <= subclass_id <= 7


def build_catalog(sources: dict[str, list[dict[str, str]]]):
    items = {integer(row, "ID"): row for row in sources["Item"]}
    sparse = {integer(row, "ID"): row for row in sources["ItemSparse"]}

    spell_professions: dict[int, set[str]] = defaultdict(set)
    for row in sources["SkillLineAbility"]:
        profession = PROFESSION_SKILL_LINES.get(integer(row, "SkillLine"))
        if profession:
            spell_professions[integer(row, "Spell")].add(profession)

    roles: dict[int, Roles] = defaultdict(Roles)
    for row in sources["SpellReagents"]:
        professions = spell_professions.get(integer(row, "SpellID"), set())
        for index in range(8):
            item_id = integer(row, f"Reagent_{index}")
            if item_id and professions:
                roles[item_id].reagent.update(professions)

    for row in sources["SpellEffect"]:
        if integer(row, "Effect") not in CREATE_ITEM_EFFECTS:
            continue
        professions = spell_professions.get(integer(row, "SpellID"), set())
        item_id = integer(row, "EffectItemType")
        if item_id and professions:
            roles[item_id].product.update(professions)

    connected_count = len(roles)
    candidate_item_ids = set(roles)
    candidate_item_ids.update(
        item_id for item_id, item in items.items()
        if has_direct_profession_metadata(item)
    )
    candidate_item_ids.update(ARCHAEOLOGY_ITEM_IDS)
    profession_bag_mask = sum(BAG_FAMILY_CATEGORY)
    candidate_item_ids.update(
        item_id for item_id, item_sparse in sparse.items()
        if item_id in items
        and integer(items[item_id], "ClassID") != ITEM_CLASS["container"]
        and integer(item_sparse, "BagFamily") & profession_bag_mask
    )

    generated: dict[int, GeneratedCategory] = {}
    classifications: dict[int, str] = {}
    classification_source: dict[int, str] = {}
    classification_origin: dict[int, str] = {}
    reference: dict[int, dict[str, str | int | None]] = {}
    excluded = Counter()
    missing_records = []

    for item_id in sorted(candidate_item_ids):
        item = items.get(item_id)
        item_sparse = sparse.get(item_id)
        if not item or not item_sparse:
            excluded["missing current client item metadata"] += 1
            missing_records.append(item_id)
            continue
        eligible, reason = is_statically_bank_eligible(item, item_sparse)
        if not eligible:
            excluded[reason or "statically ineligible"] += 1
            continue

        item_roles = roles.get(item_id, Roles())
        category = intrinsic_category(item_id, item)
        intrinsic = category is not None
        if category:
            result = GeneratedCategory(
                category,
                "intrinsic item metadata",
                tuple(sorted(item_roles.reagent | item_roles.product)),
            )
        elif item_id in ARCHAEOLOGY_ITEM_IDS:
            result = GeneratedCategory(
                "archaeology",
                "MoP archaeology keystone data",
                ("archaeology",),
            )
        else:
            result = generated_category(item_sparse, item_roles)

        final = apply_taxonomy_policy(item_id, result)
        name = (item_sparse.get("Display_lang") or "Unnamed item").replace(
            "\r", " "
        ).replace("\n", " ")
        if final is None:
            reason = EXCLUDED_ITEM_REASONS[item_id]
            excluded[f"reviewed: {reason}"] += 1
            reference[item_id] = {
                "item_id": item_id,
                "name": name,
                "category": None,
                "evidence": reason,
                "status": "excluded",
            }
            continue

        if not intrinsic or final != result:
            generated[item_id] = final
        classifications[item_id] = final.category
        classification_source[item_id] = final.reason
        classification_origin[item_id] = "Intrinsic" if intrinsic else "Generated"
        reference[item_id] = {
            "item_id": item_id,
            "name": name,
            "category": final.category,
            "evidence": final.reason,
            "status": "public",
        }

    unclassified = [
        item_id for item_id in classifications if not classifications[item_id]
    ]
    if unclassified:
        raise RuntimeError(
            f"profession coverage has {len(unclassified)} unclassified items"
        )

    sentinels = {
        2581: "first_aid",       # Heavy Linen Bandage
        3371: "alchemy",          # Crystal Vial
        4359: "engineering",     # Handful of Copper Bolts
        4408: "engineering",     # Mechanical Squirrel schematic
        37602: "enchanting",      # Ruined Vellum
        39354: "inscription",     # Light Parchment
        52078: "profession_supplies",  # Chaos Orb
        79251: "inscription",    # Shadow Pigment
        79254: "inscription",    # Ink of Dreams
        79868: "archaeology",    # Pandaren Pottery Shard
    }
    for item_id, expected in sentinels.items():
        actual = classifications.get(item_id)
        if actual != expected:
            raise RuntimeError(
                f"source validation failed for item {item_id}: "
                f"{actual!r} != {expected!r}"
            )
    if reference.get(23418, {}).get("status") != "excluded":
        raise RuntimeError("source validation failed for item 23418: expected excluded")

    return {
        "items": items,
        "sparse": sparse,
        "roles": roles,
        "generated": generated,
        "classifications": classifications,
        "classification_source": classification_source,
        "classification_origin": classification_origin,
        "reference": reference,
        "excluded": excluded,
        "missing_records": missing_records,
        "connected_count": connected_count,
        "candidate_count": len(candidate_item_ids),
    }


def lua_quote(value: str) -> str:
    return '"' + value.replace("\\", "\\\\").replace('"', '\\"') + '"'


def render_lua(catalog) -> str:
    generated = catalog["generated"]
    reference = catalog["reference"]
    shared_item_ids = [
        item_id for item_id in sorted(SHARED_ITEM_IDS)
        if reference.get(item_id, {}).get("status") == "public"
    ]
    category_counts = Counter(value.category for value in generated.values())
    lines = [
        "local _, GBO = ...",
        "",
        "-- Generated by scripts/generate_profession_data.py from Blizzard client",
        "-- DB2 tables served by Wago Tools. Do not edit by hand.",
        f"-- Source build: {SOURCE_BUILD}",
        "-- Values cover profession-connected items that broad item metadata cannot",
        "-- classify. Intrinsic Armor, Cloth, Ore, Leather, and similar rules win first.",
        "local curatedCategories = {",
    ]
    for item_id in sorted(CURATED_CATEGORY_BY_ITEM):
        lines.append(
            f"    [{item_id}] = {lua_quote(CURATED_CATEGORY_BY_ITEM[item_id])},"
        )
    for item_id in sorted(EXCLUDED_ITEM_REASONS):
        lines.append(f"    [{item_id}] = false,")
    lines.extend(
        [
            "}",
            "",
        "local professionCategories = {",
        ]
    )
    for item_id in sorted(generated):
        entry = generated[item_id]
        name = (
            catalog["sparse"][item_id].get("Display_lang") or "Unnamed item"
        ).replace("\r", " ").replace("\n", " ")
        lines.append(
            f"    [{item_id}] = {lua_quote(entry.category)}, -- {name}"
        )
    lines.extend(["}", "", "local professionReference = {"])
    for item_id in sorted(reference):
        record = reference[item_id]
        category = record["category"]
        category_key = "nil" if category is None else lua_quote(str(category))
        lines.extend(
            [
                f"    [{item_id}] = {{",
                f"        itemID = {item_id},",
                f"        name = {lua_quote(str(record['name']))},",
                f"        categoryKey = {category_key},",
                f"        evidence = {lua_quote(str(record['evidence']))},",
                f"        status = {lua_quote(str(record['status']))},",
                "    },",
            ]
        )
    lines.extend(["}", "", "local sharedCraftingReagents = {"])
    for item_id in shared_item_ids:
        lines.append(f"    {item_id},")
    lines.extend(
        [
            "}",
            "",
            "local coverage = {",
            f"    sourceBuild = {lua_quote(SOURCE_BUILD)},",
            f"    connectedItems = {catalog['connected_count']},",
            f"    candidateItems = {catalog['candidate_count']},",
            f"    eligibleItems = {len(catalog['classifications'])},",
            f"    generatedItems = {len(generated)},",
            "    unclassifiedItems = 0,",
            "    generatedByCategory = {",
        ]
    )
    for category in sorted(category_counts):
        lines.append(
            f"        [{lua_quote(category)}] = {category_counts[category]},"
        )
    lines.extend(
        [
            "    },",
            "}",
            "",
            "function GBO:GetCuratedProfessionCategory(itemID)",
            "    local category = curatedCategories[tonumber(itemID)]",
            "    return category, category ~= nil",
            "end",
            "",
            "function GBO:GetGeneratedProfessionCategory(itemID)",
            "    return professionCategories[tonumber(itemID)]",
            "end",
            "",
            "function GBO:GetProfessionReferenceItem(itemID)",
            "    return professionReference[tonumber(itemID)]",
            "end",
            "",
            "function GBO:SearchProfessionReference(query, limit)",
            "    query = string.lower(tostring(query or \"\"))",
            "    limit = math.max(1, math.min(tonumber(limit) or 25, 50))",
            "    if string.match(query, \"^%d+$\") then",
            "        local record = professionReference[tonumber(query)]",
            "        return record and { record } or {}",
            "    end",
            "",
            "    local results = {}",
            "    for _, record in pairs(professionReference) do",
            "        if record.status == \"public\" and string.find(",
            "            string.lower(record.name), query, 1, true",
            "        ) then",
            "            table.insert(results, record)",
            "        end",
            "    end",
            "    table.sort(results, function(left, right)",
            "        if left.name == right.name then",
            "            return left.itemID < right.itemID",
            "        end",
            "        return left.name < right.name",
            "    end)",
            "    for index = #results, limit + 1, -1 do",
            "        table.remove(results, index)",
            "    end",
            "    return results",
            "end",
            "",
            "function GBO:GetSharedCraftingReagents()",
            "    local results = {}",
            "    for _, itemID in ipairs(sharedCraftingReagents) do",
            "        table.insert(results, professionReference[itemID])",
            "    end",
            "    return results",
            "end",
            "",
            "function GBO:GetProfessionCoverageSummary()",
            "    return coverage",
            "end",
            "",
        ]
    )
    return "\n".join(lines)


def markdown_escape(value: str) -> str:
    return value.replace("|", "\\|").replace("\n", " ")


def render_report(catalog) -> str:
    generated = catalog["generated"]
    classifications = catalog["classifications"]
    origins = catalog["classification_origin"]
    reference = catalog["reference"]
    sparse = catalog["sparse"]
    category_counts: dict[str, Counter] = defaultdict(Counter)
    for item_id, category in classifications.items():
        source = origins[item_id]
        category_counts[category][source] += 1

    shared = [
        item_id for item_id in sorted(SHARED_ITEM_IDS)
        if reference.get(item_id, {}).get("status") == "public"
    ]
    reviewed_exclusions = [
        item_id for item_id in sorted(EXCLUDED_ITEM_REASONS)
        if reference.get(item_id, {}).get("status") == "excluded"
    ]

    lines = [
        "# MoP Classic profession item coverage",
        "",
        "This report is generated, not hand-maintained. It joins the Mists of",
        "Pandaria Classic profession skill lines with their spell reagents and",
        "created items, then classifies each eligible item using intrinsic item",
        "metadata, specialized-bag evidence, and profession ownership.",
        "",
        f"- Client build: `{SOURCE_BUILD}`",
        f"- Profession recipe-graph item records: **{catalog['connected_count']:,}**",
        f"- Total recipe-graph, direct-metadata, and Archaeology candidates: **{catalog['candidate_count']:,}**",
        f"- Public guild-bank-eligible records: **{len(classifications):,}**",
        f"- Resolved by intrinsic item metadata: **{sum(value == 'Intrinsic' for value in origins.values()):,}**",
        f"- Resolved by generated profession data: **{sum(value == 'Generated' for value in origins.values()):,}**",
        "- Eligible records without an organizational category: **0**",
        "",
        "Static eligibility excludes bind-on-pickup, quest-bound, Quest-class, and",
        "conjured records. Archaeology fragment currencies are not item records;",
        "the bankable keystone items are included explicitly.",
        "",
        "The live bag binding flag remains authoritative because an item",
        "instance can be bound even when its base item record is not.",
        "",
        "## Category coverage",
        "",
        "| Category | Intrinsic | Generated | Total |",
        "| --- | ---: | ---: | ---: |",
    ]
    for category in sorted(category_counts, key=lambda value: CATEGORY_NAMES[value]):
        counts = category_counts[category]
        lines.append(
            f"| {CATEGORY_NAMES[category]} | {counts['Intrinsic']:,} | "
            f"{counts['Generated']:,} | {sum(counts.values()):,} |"
        )

    lines.extend(
        [
            "",
            "## Shared Crafting Reagents",
            "",
            "These reviewed allowlist entries deliberately route through one neutral",
            "category instead of being duplicated across tab profiles. Any new",
            "multi-owner candidate stops generation until it receives a curated category,",
            "Shared allowlist entry, or exclusion.",
            "",
            "| Item ID | Item | Profession evidence |",
            "| ---: | --- | --- |",
        ]
    )
    for item_id in shared:
        name = markdown_escape(sparse[item_id].get("Display_lang") or "Unnamed item")
        item_roles = catalog["roles"].get(item_id, Roles())
        owners = ", ".join(sorted(item_roles.reagent | item_roles.product))
        if not owners:
            owners = "specialized bag or direct item metadata"
        lines.append(f"| {item_id} | {name} | {owners} |")

    lines.extend(
        [
            "",
            "## Excluded reviewed records",
            "",
            "These exact IDs remain in the reference catalog for diagnostics but are",
            "not public routing choices.",
            "",
            "| Item ID | Item | Exclusion reason |",
            "| ---: | --- | --- |",
        ]
    )
    for item_id in reviewed_exclusions:
        record = reference[item_id]
        lines.append(
            f"| {item_id} | {markdown_escape(str(record['name']))} | "
            f"{markdown_escape(str(record['evidence']))} |"
        )

    lines.extend(
        [
            "",
            "## Method and boundaries",
            "",
            "- Intrinsic categories take priority, so crafted Armor remains Armor,",
            "  bolts of cloth remain Cloth, bars remain Ore, and hides remain Leather.",
            "- A specialized bag family is accepted only when it is unambiguous and",
            "  the profession graph supports it. Fishing-family items are kept in",
            "  Fish & Cooking because fishing itself has no crafting recipe graph.",
            "- A unique crafted-product category wins next, followed by a unique",
            "  profession category. Multi-profession leftovers require reviewed",
            "  policy rather than becoming implicit Shared routing choices.",
            "- Client data includes deprecated and internal records. The reviewed",
            "  exclusions stay searchable by exact item ID without being suggested.",
            "- Coverage is for items connected to professions present in this client,",
            "  not every quest token, cosmetic, or miscellaneous object in the game.",
            "",
            "## Reproduction",
            "",
            "```sh",
            "python3 scripts/generate_profession_data.py",
            "```",
            "",
            "The generator downloads `Item`, `ItemSparse`, `SkillLineAbility`,",
            "`SpellReagents`, and `SpellEffect` CSV exports for the pinned client",
            "build from Wago Tools. The addon never contacts Wago Tools at runtime.",
            "",
        ]
    )
    return "\n".join(lines)


def main() -> None:
    project_dir = Path(__file__).resolve().parents[1]
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--source-dir",
        type=Path,
        help="Use already downloaded Table.csv source files.",
    )
    parser.add_argument(
        "--lua-output",
        type=Path,
        default=project_dir / "GuildBankOrganizer" / "ProfessionData.lua",
    )
    parser.add_argument(
        "--report-output",
        type=Path,
        default=project_dir / "docs" / "PROFESSION_COVERAGE.md",
    )
    args = parser.parse_args()

    if args.source_dir:
        catalog = build_catalog(load_sources(args.source_dir))
    else:
        with tempfile.TemporaryDirectory(prefix="gbo-profession-data-") as directory:
            source_dir = Path(directory)
            for table in SOURCE_TABLES:
                download(table, source_dir / f"{table}.csv")
            catalog = build_catalog(load_sources(source_dir))

    args.lua_output.write_text(render_lua(catalog), encoding="utf-8")
    args.report_output.write_text(render_report(catalog), encoding="utf-8")
    print(
        f"wrote {args.lua_output} with {len(catalog['generated'])} generated items; "
        f"coverage {len(catalog['classifications'])}/{len(catalog['classifications'])}; "
        "unreviewed multi-owner items 0"
    )
    print(f"wrote {args.report_output}")


if __name__ == "__main__":
    main()
