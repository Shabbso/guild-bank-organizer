# Smart Deposit Profile Persistence and Category Reference Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make Smart Deposit profiles persist automatically, route overlapping profiles deterministically, replace the catch-all profession-supplies taxonomy with player-first categories, and expose an in-addon category and item reference.

**Architecture:** Keep a reviewed taxonomy policy in `scripts/profession_taxonomy.py`, validate it against the pinned MoP Classic client data, and emit the runtime item/reference tables into `ProfessionData.lua`. Move SavedVariables profile ownership out of the depositor into a focused `ProfileStore.lua`; keep route selection in `Depositor.lua`, and add only presentation/draft state to `UI.lua`. The Category Reference queries the same generated records and classifier used by Smart Deposit, so documentation and actual routing cannot silently diverge.

**Tech Stack:** Python 3 standard library, Blizzard Classic DB2 CSV exports pinned to client build `5.5.4.68806`, World of Warcraft MoP Classic Lua 5.1 API, code-created WoW frames, Fengari smoke tests, `luaparse`, POSIX shell packaging, ZIP release archive.

## Global Constraints

- Keep the public category key `profession_supplies` for SavedVariables compatibility; display it as `Shared Crafting Reagents`.
- Curated item assignment takes precedence over intrinsic metadata, generated profession ownership, and specialized bag-family fallback.
- Inks, pigments, and parchment route to Inscription; vellum routes to Enchanting; dyes and bleach route to Tailoring; Crystal Vial routes to Alchemy.
- Shared Crafting Reagents is allowlist-only. Generated multi-owner data must never add an item to Shared implicitly.
- Known test, placeholder, broken, or intentionally unsupported records do not appear in public category suggestions.
- Exact item-ID profile rules override built-in categories; expansion-specific category routes override All Expansions routes; equal-priority ties move nothing.
- Valid profile edits save without requiring `Save Now`; invalid drafts never replace the last valid saved profile.
- Do not change the `1.25s` sort cadence or the event-confirmed Smart Deposit move cadence and retry behavior.
- Do not fetch taxonomy data from the network at addon runtime.
- Do not expose a complete multi-thousand-item browser for broad categories; expose definitions/examples, the complete Shared list, and capped item-name/ID lookup.
- Do not publish to GitHub or CurseForge as part of this plan. Produce and install a testable beta only.

---

### Task 1: Create the Curated Taxonomy and Reproducible Reference Data

**Files:**
- Create: `scripts/profession_taxonomy.py`
- Create: `tests/test_profession_generator.py`
- Modify: `scripts/generate_profession_data.py:1-675`
- Regenerate: `GuildBankOrganizer/ProfessionData.lua`
- Regenerate: `docs/PROFESSION_COVERAGE.md`

**Interfaces:**
- Consumes: `Item`, `ItemSparse`, `SkillLineAbility`, `SpellReagents`, and `SpellEffect` CSV data for build `5.5.4.68806`.
- Produces: `CURATED_CATEGORY_BY_ITEM: dict[int, str]`, `SHARED_ITEM_IDS: frozenset[int]`, and `EXCLUDED_ITEM_REASONS: dict[int, str]` in the reviewed Python source.
- Produces in `ProfessionData.lua`: `GBO:GetCuratedProfessionCategory(itemID) -> category|false|nil, found`, `GBO:GetGeneratedProfessionCategory(itemID) -> category|nil`, `GBO:GetProfessionReferenceItem(itemID) -> record|nil`, `GBO:SearchProfessionReference(query, limit) -> record[]`, and `GBO:GetSharedCraftingReagents() -> record[]`.
- A reference record is `{ itemID: number, name: string, categoryKey: string|nil, evidence: string, status: "public"|"excluded" }`; expansion is resolved at runtime through `GBO:ResolveDepositExpansion`.

- [ ] **Step 1: Add failing pure-Python taxonomy tests**

Create `tests/test_profession_generator.py` with standard-library `unittest`. Import `generated_category` and a new `apply_taxonomy_policy` function from `scripts.generate_profession_data`, plus the three policy constants from `scripts.profession_taxonomy`. Use small synthetic rows so this step requires no network:

```python
import unittest

from scripts.generate_profession_data import GeneratedCategory, apply_taxonomy_policy
from scripts.profession_taxonomy import (
    CURATED_CATEGORY_BY_ITEM,
    EXCLUDED_ITEM_REASONS,
    SHARED_ITEM_IDS,
)


class TaxonomyPolicyTests(unittest.TestCase):
    def test_obvious_supplies_have_player_facing_owners(self):
        self.assertEqual(CURATED_CATEGORY_BY_ITEM[3371], "alchemy")
        self.assertEqual(CURATED_CATEGORY_BY_ITEM[39354], "inscription")
        self.assertEqual(CURATED_CATEGORY_BY_ITEM[37602], "enchanting")
        self.assertEqual(CURATED_CATEGORY_BY_ITEM[2604], "tailoring")

    def test_shared_is_allowlist_only(self):
        generated = GeneratedCategory(
            "profession_supplies",
            "shared by multiple professions",
            ("blacksmithing", "tailoring"),
        )
        self.assertEqual(
            apply_taxonomy_policy(52078, generated).category,
            "profession_supplies",
        )
        with self.assertRaisesRegex(RuntimeError, "multi-owner item 999999"):
            apply_taxonomy_policy(999999, generated)

    def test_internal_records_are_excluded(self):
        self.assertIn(23418, EXCLUDED_ITEM_REASONS)
        self.assertIsNone(
            apply_taxonomy_policy(
                23418,
                GeneratedCategory("engineering", "metadata", ("engineering",)),
            )
        )

    def test_shared_and_excluded_sets_do_not_overlap(self):
        self.assertFalse(SHARED_ITEM_IDS & EXCLUDED_ITEM_REASONS.keys())


if __name__ == "__main__":
    unittest.main()
```

- [ ] **Step 2: Run the unit test and verify it fails**

Run:

```bash
python3 -m unittest tests.test_profession_generator -v
```

Expected: FAIL because `scripts.profession_taxonomy` and `apply_taxonomy_policy` do not exist.

- [ ] **Step 3: Add the reviewed taxonomy policy**

Create `scripts/profession_taxonomy.py`. Use these explicit initial assignments and exclusions; names are comments, while item IDs are authoritative:

```python
CURATED_CATEGORY_BY_ITEM = {
    1288: "first_aid",       # Large Venom Sac
    2324: "tailoring",       # Bleach
    2325: "tailoring",       # Black Dye
    2604: "tailoring",       # Red Dye
    2605: "tailoring",       # Green Dye
    3371: "alchemy",         # Crystal Vial
    4340: "tailoring",       # Gray Dye
    4342: "tailoring",       # Purple Dye
    4470: "enchanting",      # Simple Wood
    6260: "tailoring",       # Blue Dye
    10648: "inscription",    # Common Parchment
    11291: "enchanting",     # Star Wood
    12804: "elemental",      # Powerful Mojo
    17010: "elemental",      # Fiery Core
    17011: "elemental",      # Lava Core
    20520: "elemental",      # Dark Rune
    22682: "elemental",      # Frozen Rune
    24186: "jewels",         # Copper Powder
    24188: "jewels",         # Tin Powder
    24190: "jewels",         # Iron Powder
    24234: "jewels",         # Mithril Powder
    24235: "jewels",         # Thorium Powder
    24242: "jewels",         # Fel Iron Powder
    24507: "elemental",      # Elemental Shard
    37602: "enchanting",     # Ruined Vellum
    39349: "enchanting",     # Ruined Vellum
    39350: "enchanting",     # Ruined Vellum
    39354: "inscription",    # Light Parchment
    39501: "inscription",    # Heavy Parchment
    39502: "inscription",    # Resilient Parchment
    43145: "enchanting",     # Ruined Vellum
    43146: "enchanting",     # Ruined Vellum
    71966: "engineering",    # Shiny Bronze Rivet
}

SHARED_ITEM_IDS = frozenset({
    4402,   # Small Flame Sac
    5635,   # Sharp Claw
    5637,   # Large Fang
    12811,  # Righteous Orb
    23572,  # Primal Nether
    30183,  # Nether Vortex
    32428,  # Heart of Darkness
    34664,  # Sunmote
    43102,  # Frozen Orb
    45087,  # Runed Orb
    47556,  # Crusader Orb
    49908,  # Primordial Saronite
    52078,  # Chaos Orb
    69237,  # Living Ember
    71998,  # Essence of Destruction
    80433,  # Blood Spirit
    83092,  # Orb of Mystery
    94289,  # Haunting Spirit
    102218, # Spirit of War
})

EXCLUDED_ITEM_REASONS = {
    23418: "internal test item",       # Test Sapper Charge
    34476: "broken internal record",   # Broken Engine Part
    35499: "placeholder item",         # Ninja Grenade [PH]
    41178: "internal test item",       # ZX-5103 Mechanical Suit
    43614: "broken internal record",   # Broken Wrath Elixir
    43620: "broken internal record",   # Broken Spellpower Elixir
    43621: "broken internal record",   # Broken Noggenfogger Elixir
}
```

Document in this file that all seven excluded records are retained for exact-ID diagnostics but are not public routing choices. Keep the current runtime safety overrides for Spinefish, Enchanting Vellum, and Singing Crystal separate in `Categories.lua`; they are gameplay/client anomalies rather than profession-generator policy.

- [ ] **Step 4: Apply policy after intrinsic/generated classification and reject implicit Shared entries**

In `generate_profession_data.py`, import the policy constants and add:

```python
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
```

Apply exclusions and curated assignments before committing a final classification. For intrinsic candidates, wrap the intrinsic result in `GeneratedCategory` long enough to apply policy, but keep it out of the compact `professionCategories` table when policy did not change it. Store every eligible public or explicitly excluded candidate in a `reference` mapping with its display name, final category, evidence, and status.

Update generator sentinels so Crystal Vial expects `alchemy`, and add sentinels for Light Parchment (`inscription`), Ruined Vellum (`enchanting`), Chaos Orb (`profession_supplies`), and Test Sapper Charge (`excluded`).

- [ ] **Step 5: Emit lookup and complete-Shared APIs from the same catalog**

Extend `render_lua()` to emit compact tables for curated assignments/exclusions, generated categories, reference records, and the sorted Shared list. Implement the exact public signatures from this task's Interfaces block. `SearchProfessionReference` must:

```lua
query = string.lower(tostring(query or ""))
limit = math.max(1, math.min(tonumber(limit) or 25, 50))
```

- treat an all-digit query as an exact ID lookup;
- otherwise use plain `string.find(string.lower(record.name), query, 1, true)`;
- omit excluded records from text suggestions;
- return excluded records for exact numeric lookup;
- sort text results by name and then item ID;
- stop at the requested cap.

Keep the coverage summary and generated Markdown report, but rename its section to `Shared Crafting Reagents`, show the smaller allowlist, and add an `Excluded reviewed records` table with the exclusion reason.

- [ ] **Step 6: Run unit, generator, and reproducibility checks**

Run:

```bash
python3 -m unittest tests.test_profession_generator -v
python3 scripts/generate_profession_data.py
cp GuildBankOrganizer/ProfessionData.lua /tmp/gbo-profession-data.lua
cp docs/PROFESSION_COVERAGE.md /tmp/gbo-profession-coverage.md
python3 scripts/generate_profession_data.py
cmp GuildBankOrganizer/ProfessionData.lua /tmp/gbo-profession-data.lua
cmp docs/PROFESSION_COVERAGE.md /tmp/gbo-profession-coverage.md
```

Expected: all unit tests pass; generation reports zero unreviewed multi-owner items; the second run is byte-for-byte identical.

- [ ] **Step 7: Parse the generated Lua and commit the taxonomy data layer**

Run:

```bash
npx --yes luaparse GuildBankOrganizer/ProfessionData.lua >/dev/null
git diff --check
git add scripts/profession_taxonomy.py scripts/generate_profession_data.py \
  tests/test_profession_generator.py GuildBankOrganizer/ProfessionData.lua \
  docs/PROFESSION_COVERAGE.md
git diff --cached --check
git commit -m "Curate player-facing profession categories"
```

Expected: the commit contains only reviewed policy, generator/test changes, and deterministic generated outputs.

---

### Task 2: Make Runtime Classification and Reference Queries Authoritative

**Files:**
- Modify: `GuildBankOrganizer/Categories.lua:60-485`
- Test: `tests/smoke.lua:16-32`
- Test: `tests/smoke.lua:560-690`

**Interfaces:**
- Consumes: the generated APIs from Task 1 and `GBO:ResolveDepositExpansion(itemID, apiExpansionID, classID)`.
- Produces: `GBO:DescribeProfessionReference(itemID) -> { itemID, name, categoryKey, categoryName, expansionID, expansionName, evidence, status }|nil`.
- Produces: category catalog records with `name`, `description`, `evidence`, and `examples: string[]` for Category Reference rendering.

- [ ] **Step 1: Add failing player-first classification and reference assertions**

Add representative items to `itemDatabase` in `tests/smoke.lua`: Mageroyal `785`, Red Dye `2604`, Crystal Vial `3371`, Light Parchment `39354`, Ruined Vellum `37602`, Chaos Orb `52078`, and Test Sapper Charge `23418`. Add assertions:

```lua
assert(select(1, addon:ClassifyDepositItem(readTestItem(3371))) == "alchemy")
assert(select(1, addon:ClassifyDepositItem(readTestItem(2604))) == "tailoring")
assert(select(1, addon:ClassifyDepositItem(readTestItem(39354))) == "inscription")
assert(select(1, addon:ClassifyDepositItem(readTestItem(37602))) == "enchanting")
assert(select(1, addon:ClassifyDepositItem(readTestItem(52078))) == "profession_supplies")
assert(select(1, addon:ClassifyDepositItem(readTestItem(23418))) == nil)
assert(addon:GetDepositCategoryName("profession_supplies") == "Shared Crafting Reagents")

local vialReference = assert(addon:DescribeProfessionReference(3371))
assert(vialReference.name == "Crystal Vial")
assert(vialReference.categoryKey == "alchemy")
assert(vialReference.expansionName == "Classic")
local excludedReference = assert(addon:DescribeProfessionReference(23418))
assert(excludedReference.status == "excluded")
local shared = addon:GetSharedCraftingReagents()
assert(#shared == 19)
```

Use a small `readTestItem(itemID)` helper that builds the same fields passed by `readBagSlot`: `itemID`, `classID`, `subclassID`, `equipLoc`, and `bagFamily`.

- [ ] **Step 2: Run the smoke test and verify the contract fails**

Run:

```bash
npx --yes --package=fengari-node-cli fengari tests/smoke.lua
```

Expected: FAIL first on the old Crystal Vial/Shared classification and later because `DescribeProfessionReference` does not exist.

- [ ] **Step 3: Put curated data ahead of runtime fallbacks**

Replace `CATEGORY_ITEM_OVERRIDES` with a gameplay-only table containing Enchanting Vellum, Spinefish, and Singing Crystal. In `ClassifyDepositItem`, use this order:

```lua
local curated, curatedFound = self:GetCuratedProfessionCategory(item.itemID)
if curatedFound then
    return curated or nil, curated and "curated player-facing category"
        or "excluded internal or unavailable item"
end
local gameplayOverride = GAMEPLAY_ITEM_OVERRIDES[tonumber(item.itemID)]
if gameplayOverride ~= nil then
    return gameplayOverride or nil, "curated gameplay item ID"
end
for _, category in ipairs(categories) do
    if category.matches(item) then
        return category.key, category.evidence
    end
end
local generated = self:GetGeneratedProfessionCategory(item.itemID)
if generated then
    return generated, "MoP profession item data"
end
```

Keep the unambiguous specialized-bag fallback last. This intentionally changes the existing generated-before-intrinsic order to the approved classifier order.

- [ ] **Step 4: Add category examples and reference description**

Rename the public Shared label and description. Add two to four representative names to an `examples` array on every category record. Implement `DescribeProfessionReference` by cloning the generated record, resolving its expansion through `ResolveDepositExpansion(itemID, nil, nil)`, and adding category/expansion display names. Do not mutate generated tables returned to other callers.

For exact custom profile rules, add `GBO:GetExactDepositProfileTabs(itemID) -> number[]` beside the current profile methods in `Depositor.lua`. `DescribeProfessionReference` includes `exactTabs`. Task 3 then moves this method unchanged with the other profile-store responsibilities.

- [ ] **Step 5: Run parser and smoke tests**

Run:

```bash
npx --yes luaparse GuildBankOrganizer/Categories.lua >/dev/null
npx --yes --package=fengari-node-cli fengari tests/smoke.lua
```

Expected: all player-first classification, exclusion, reference, Shared-size, and existing regression assertions pass.

- [ ] **Step 6: Commit the authoritative runtime classifier**

Run:

```bash
git add GuildBankOrganizer/Categories.lua GuildBankOrganizer/Depositor.lua tests/smoke.lua
git diff --cached --check
git commit -m "Use curated Smart Deposit classification"
```

---

### Task 3: Extract an Atomic Profile Store and Migrate SavedVariables Safely

**Files:**
- Create: `GuildBankOrganizer/ProfileStore.lua`
- Modify: `GuildBankOrganizer/GuildBankOrganizer.toc:10-18`
- Modify: `GuildBankOrganizer/Core.lua:133-171`
- Modify: `GuildBankOrganizer/Depositor.lua:1-259`
- Test: `tests/smoke.lua:500-550`
- Test: `tests/smoke.lua:690-875`

**Interfaces:**
- Produces: existing `GBO:GetDepositProfiles(create)` and `GBO:GetDepositProfile(tab, create)` APIs without caller changes.
- Produces: `GBO:ValidateDepositProfile(tab, draft) -> normalized|nil, reason` and `GBO:SaveDepositProfileDraft(tab, draft) -> true, normalized | false, reason`.
- Keeps the compatibility wrapper `GBO:SaveDepositProfile(tab, enabled, label, categories, allExpansions, expansions, exactItemIDs)`.
- Produces: `GBO:MigrateDepositProfileDatabase(db, previousSchema)` and schema `6`.
- Produces: `GBO:GetDepositProfileRecovery() -> table|nil` and `GBO:GetExactDepositProfileTabs(itemID) -> sorted number[]`.

- [ ] **Step 1: Add failing migration, atomicity, and reload assertions**

Before the normal addon initialization fixture, construct a schema-5 database with one valid profile, one malformed profile, and `profession_supplies = true`. After `ADDON_LOADED`, assert:

```lua
assert(GuildBankOrganizerDB.schema == 6)
assert(addon:GetDepositProfile(1, false).categories.profession_supplies)
assert(addon:GetDepositProfile(1, false).enabled)
assert(not addon:GetDepositProfile(2, false).enabled)
assert(addon:GetDepositProfileRecovery())
```

Then save a valid Herbs/Classic profile, snapshot it, attempt an enabled profile with no expansion choice, and assert that the call fails and the saved table still matches the snapshot. Simulate reload by clearing `addon.db`, calling `InitializeDatabase()`, and asserting the profile's enabled state, Herbs category, Classic expansion, label, and exact IDs remain identical.

- [ ] **Step 2: Run smoke and verify the new schema/store assertions fail**

Run:

```bash
npx --yes --package=fengari-node-cli fengari tests/smoke.lua
```

Expected: FAIL because schema remains `5`, malformed recovery is absent, and draft APIs are undefined.

- [ ] **Step 3: Move profile ownership into `ProfileStore.lua`**

Move `profileScopeKey`, `LEGACY_CATEGORY_KEYS`, profile getters, normalization, expansion-overlap helpers, and saving out of `Depositor.lua`. Load `ProfileStore.lua` after `Categories.lua` and before `Scanner.lua`/`Depositor.lua` in the TOC.

Use this draft shape consistently:

```lua
{
    enabled = boolean,
    label = string,
    categories = { [categoryKey] = true },
    allExpansions = boolean,
    expansions = { [0..4] = true },
    exactItemIDs = { [positiveItemID] = true },
}
```

`ValidateDepositProfile` builds a new normalized table and never mutates the saved profile or input draft. Validate purchased tab range, known category keys, and positive item IDs; trim the label for storage and normalize exact IDs into a set. When enabled, require at least one rule and require at least one expansion when `allExpansions == false`; a disabled draft may retain no rules or an incomplete expansion selection for later editing.

- [ ] **Step 4: Implement equal-precedence save conflict validation**

Allow exact-versus-category and explicit-expansion-versus-All overlaps. Reject only:

```text
same exact ID + same priority
same category + same explicit expansion
same category + All Expansions on both profiles
```

Return actionable messages containing the category or item ID and both destination tabs. `SaveDepositProfileDraft` validates into a candidate, checks conflicts against other enabled profiles, and only then performs `profiles[tab] = candidate`. On failure it returns without changing `profiles[tab]`. On success it refreshes the deposit plan.

- [ ] **Step 5: Implement idempotent schema-6 migration and recovery**

In `Core.lua`, retain basic DB table initialization, call `MigrateDepositProfileDatabase(GuildBankOrganizerDB, previousSchema)` after all top-level files have loaded, and then assign schema `6`.

For every guild/tab entry, normalization keeps valid known fields. If the entry is not a table, contains malformed field types, or contains fields outside `enabled`, `label`, `categories`, `allExpansions`, `expansions`, `exactItemIDs`, and `enabledStateVersion`, copy the original value into:

```lua
db.depositProfileRecovery = db.depositProfileRecovery or {}
db.depositProfileRecovery[guildKey] = db.depositProfileRecovery[guildKey] or {}
db.depositProfileRecovery[guildKey][tab] = originalValue
```

Do not overwrite an existing recovery copy on a second migration. Migration iterates stored guild keys directly and must not use `GetNumGuildBankTabs`, because the bank is normally closed during `ADDON_LOADED`. Disable a normalized profile only when no valid category or exact-ID rule remains. Preserve `profession_supplies` unchanged; only its display name/membership changed. Keep the existing beta enabled-state repair for pre-schema-5 data.

- [ ] **Step 6: Run full parser and smoke checks**

Run:

```bash
for file in GuildBankOrganizer/*.lua tests/*.lua; do
  npx --yes luaparse "$file" >/dev/null
done
npx --yes --package=fengari-node-cli fengari tests/smoke.lua
```

Expected: migration, recovery, atomic failure, simulated reload, exact-profile lookup, and all prior smoke assertions pass.

- [ ] **Step 7: Commit the profile store**

Run:

```bash
git add GuildBankOrganizer/ProfileStore.lua GuildBankOrganizer/Core.lua \
  GuildBankOrganizer/Depositor.lua GuildBankOrganizer/GuildBankOrganizer.toc \
  tests/smoke.lua
git diff --cached --check
git commit -m "Persist Smart Deposit profiles atomically"
```

---

### Task 4: Add Specificity-Aware Routing and Runtime Conflict Reports

**Files:**
- Modify: `GuildBankOrganizer/ProfileStore.lua`
- Modify: `GuildBankOrganizer/Depositor.lua:420-610`
- Modify: `GuildBankOrganizer/UI.lua:575-735`
- Test: `tests/smoke.lua:875-1070`

**Interfaces:**
- Produces: `GBO:ResolveDepositRoute(routing, item) -> tab|nil, evidence|nil, conflict|nil`.
- A conflict is `{ itemID, name, categoryKey, expansionID, priority, tabs: number[] }`.
- Deposit plans gain `routingConflicts: conflict[]`; conflicted items are absent from `operations` and `totalItems`.
- Produces: `GBO:GetFirstDepositRoutingConflict() -> conflict|nil` for organizer presentation.
- Produces: `GBO:ShowDepositSettingsUI(tab)` accepts an optional destination tab while retaining the current-tab default.

- [ ] **Step 1: Add failing precedence and tie tests**

Configure three tabs in the smoke fixture:

- Tab 1: Herbs, All Expansions.
- Tab 2: Herbs, Mists only.
- Tab 3: exact item ID for Mageroyal.

Assert exact Mageroyal routes to Tab 3, a MoP herb routes to Tab 2, and a Classic herb without an exact route routes to Tab 1. Remove the exact rule and create two Mists-only Herbs profiles by injecting one malformed legacy profile directly; assert the plan contains one conflict naming both tabs and contains no operation for the conflicted item.

Also assert the organizer message includes item name, `Herbs`, `Mists of Pandaria`, and both tab numbers, while its Setup button reads `Resolve`.

- [ ] **Step 2: Run smoke and verify current first-match routing fails**

Run:

```bash
npx --yes --package=fengari-node-cli fengari tests/smoke.lua
```

Expected: FAIL because current routing stores one exact tab, accepts the first matching category route, and has no conflict list.

- [ ] **Step 3: Preserve every candidate route and score specificity**

Change `enabledProfileRouting()` so `exactItemIDs[itemID]` is an array of routes, not a tab number. Keep all category routes. Implement priorities as constants:

```lua
local ROUTE_EXACT = 3
local ROUTE_EXPANSION = 2
local ROUTE_ALL = 1
```

`ResolveDepositRoute` gathers eligible exact and category routes, determines the highest priority, sorts unique tabs, and returns a conflict instead of a tab when more than one tab remains at that priority. Evidence is `exact item ID`, the item's classification evidence for an explicit expansion, or `All Expansions profile`.

- [ ] **Step 4: Exclude conflicted items from operations and expose diagnostics**

Return eligible items and conflicts separately from bag scanning. Add conflicts to the plan without adding the item to a tab source list. Ensure report/debug output records the number of conflicts and the first conflict's item ID/tabs, while no deposit is attempted for it.

In the organizer refresh, prefer an active-operation status, then a routing-conflict status, then ordinary plan counts. Set the existing Setup button to `Resolve` and make it open the first conflicting tab through `ShowDepositSettingsUI(conflict.tabs[1])`.

- [ ] **Step 5: Run parser and smoke regression checks**

Run:

```bash
npx --yes luaparse GuildBankOrganizer/Depositor.lua >/dev/null
npx --yes luaparse GuildBankOrganizer/UI.lua >/dev/null
npx --yes --package=fengari-node-cli fengari tests/smoke.lua
```

Expected: precedence and tie behavior pass; no conflicted item moves; existing current-tab/all-tabs scope and retry tests remain green.

- [ ] **Step 6: Commit deterministic routing**

Run:

```bash
git add GuildBankOrganizer/ProfileStore.lua GuildBankOrganizer/Depositor.lua \
  GuildBankOrganizer/UI.lua tests/smoke.lua
git diff --cached --check
git commit -m "Resolve Smart Deposit routes by specificity"
```

---

### Task 5: Autosave Profile Drafts and Improve Checkbox Contrast

**Files:**
- Modify: `GuildBankOrganizer/UI.lua:130-190`
- Modify: `GuildBankOrganizer/UI.lua:700-760`
- Modify: `GuildBankOrganizer/UI.lua:1025-1465`
- Test: `tests/smoke.lua:120-260`
- Test: `tests/smoke.lua:820-920`

**Interfaces:**
- Consumes: `GBO:SaveDepositProfileDraft(tab, draft)` from Task 3.
- Produces: UI-local `readDepositSettingsDraft()`, `flushDepositSettingsDraft(action) -> boolean`, and `setDepositSaveState(state, message)`.
- Exposes on `GuildBankOrganizerDepositSettingsFrame`: `.SaveState`, `.SaveButton`, `.StatusText`, and `.LoadingProfile` for smoke verification.

- [ ] **Step 1: Extend frame mocks and add failing autosave assertions**

Extend the smoke widget mock with `SetBackdrop`, `SetBackdropColor`, `SetBackdropBorderColor`, `IsMouseOver`, and focus/blur hooks needed by outlined checkboxes and input commits. Store texture colors so tests can distinguish unchecked outline from background.

In the Smart Deposit settings test:

1. Click Herbs and Classic without clicking Save.
2. Assert the profile is saved and enabled and `SaveState == "saved"`.
3. Type a label, invoke `OnEnterPressed`, and assert it persisted.
4. Type exact ID `785`, invoke `OnEditFocusLost`, and assert it persisted.
5. Reopen the frame and verify every displayed value.
6. Make the expansion draft invalid, click Back, and assert the page stays visible and the last valid profile remains unchanged.
7. Correct the expansion and click Back; assert navigation continues.

Assert `SaveButton:GetText() == "Save Now"`, unchecked checkboxes have a visible border texture, checked boxes retain cyan, and hover changes the border color.

- [ ] **Step 2: Run smoke and verify autosave/visual contracts fail**

Run:

```bash
npx --yes --package=fengari-node-cli fengari tests/smoke.lua
```

Expected: FAIL because checkbox callbacks do not save, inputs have no focus-lost saves, Back discards drafts, and boxes lack borders.

- [ ] **Step 3: Add a single draft reader and atomic flush path**

Replace `saveDepositSettings` with:

```lua
local function readDepositSettingsDraft()
    return frame.SelectedTab, {
        enabled = frame.EnabledCheck:GetChecked(),
        label = frame.LabelInput:GetText(),
        categories = categories,
        allExpansions = frame.AllExpansionsCheck:GetChecked(),
        expansions = expansions,
        exactItemIDs = exactItemIDs,
    }
end
```

`flushDepositSettingsDraft(action)` returns true during `LoadingProfile`, sets `Saving...`, calls `SaveDepositProfileDraft`, preserves and displays a validation error on failure, and sets `Saved` plus refreshes organizer state on success. It always saves `frame.SelectedTab`, never the editable `TabInput`; Load Tab parses `TabInput` only after the current draft flush succeeds. Do not reload the form after saving because doing so would replace the user's active draft/cursor position.

- [ ] **Step 4: Wire every approved commit and navigation trigger**

- Checkbox callbacks call `flushDepositSettingsDraft("checkbox")` after enforcing All-versus-specific mutual exclusion and auto-enabling a profile with a rule.
- Label and exact-ID inputs commit on Enter and `OnEditFocusLost`.
- Scan flushes first and returns immediately on failure.
- Load Tab, Use Current, both Back actions, and automatic bank-tab change flush the current draft before loading/navigating.
- `OnHide` attempts one final flush without reopening frames; closing the bank cannot be blocked.
- `loadDepositSettings` always uses `LoadingProfile = true` until all widgets and status are populated.
- Rename the explicit button `Save Now`; it calls the same flush function.

Prevent recursive hide/save calls with a `Navigating` guard. Keep an invalid editor-controlled Back action on the settings page, but let guild-bank closure hide the page while retaining the last valid saved profile.

- [ ] **Step 5: Add outlined checkbox states**

In `createCheckBox`, create four one-pixel border textures around the box using `COLORS.border`. Add a single `applyCheckStyle(self)` helper used by `SetChecked`, `OnEnter`, `OnLeave`, `OnEnable`, and `OnDisable`:

- unchecked enabled: dark fill plus neutral-gray outline;
- hover enabled: brighter cyan-gray outline;
- checked enabled: cyan mark plus normal visible outline;
- disabled: muted mark/fill/outline and label.

Do not use a default Blizzard checkbox template. Apply this component to category, expansion, auto-open, and reverse-order controls.

- [ ] **Step 6: Run parser and smoke tests**

Run:

```bash
npx --yes luaparse GuildBankOrganizer/UI.lua >/dev/null
npx --yes --package=fengari-node-cli fengari tests/smoke.lua
```

Expected: immediate checkbox saves, input focus/Enter saves, blocked invalid navigation, reload restoration, and checkbox-state assertions all pass.

- [ ] **Step 7: Commit autosave and visual state**

Run:

```bash
git add GuildBankOrganizer/UI.lua tests/smoke.lua
git diff --cached --check
git commit -m "Autosave Smart Deposit profile edits"
```

---

### Task 6: Add the In-Addon Category Reference

**Files:**
- Create: `GuildBankOrganizer/CategoryReference.lua`
- Modify: `GuildBankOrganizer/GuildBankOrganizer.toc:10-20`
- Modify: `GuildBankOrganizer/Diagnostics.lua`
- Modify: `GuildBankOrganizer/UI.lua:1-20`
- Modify: `GuildBankOrganizer/UI.lua:875-1025`
- Modify: `GuildBankOrganizer/UI.lua:1465-1545`
- Test: `tests/smoke.lua:500-550`
- Test: `tests/smoke.lua:700-820`

**Interfaces:**
- Consumes: `GetDepositCategoryCatalog`, `DescribeProfessionReference`, `SearchProfessionReference`, `GetSharedCraftingReagents`, and `GetExactDepositProfileTabs`.
- Produces: `GBO:GetCategoryReferenceSections() -> section[]`, where each section is `{ key, name, description, examples }`.
- Produces: `GBO:FormatCategoryReferenceResult(record) -> display table` without frame dependencies.
- Produces: global frame `GuildBankOrganizerCategoryReferenceFrame` with `.SearchInput`, `.SearchButton`, `.CategoryList`, `.ResultList`, `.SharedButton`, and `.BackButton`.
- Produces: `GBO:ShowCategoryReferenceUI()`.

- [ ] **Step 1: Add failing query-format and page-navigation assertions**

Add smoke assertions that category sections contain Herbs examples and the renamed Shared section. Assert numeric `3371` lookup shows Crystal Vial, Alchemy, Classic, and curated evidence. Assert text `vial` finds Crystal Vial with a cold item cache, text suggestions omit Test Sapper Charge, numeric `23418` explains exclusion, and Shared complete list contains exactly the Task 1 allowlist grouped under supported expansion labels.

Open Advanced, click `Category Reference`, and assert:

```lua
assert(GuildBankOrganizerCategoryReferenceFrame:IsShown())
assert(not GuildBankOrganizerAdvancedFrame:IsShown())
GuildBankOrganizerCategoryReferenceFrame.BackButton.scripts.OnClick()
assert(not GuildBankOrganizerCategoryReferenceFrame:IsShown())
assert(GuildBankOrganizerAdvancedFrame:IsShown())
```

Assign Crystal Vial as an exact ID to a test profile and assert the formatted result identifies its custom destination tab without changing the built-in Alchemy label.

- [ ] **Step 2: Run smoke and verify reference APIs/page fail**

Run:

```bash
npx --yes --package=fengari-node-cli fengari tests/smoke.lua
```

Expected: FAIL because the query formatter and Category Reference frame do not exist.

- [ ] **Step 3: Build frame-independent reference view models**

Create `CategoryReference.lua` after `ProfileStore.lua` and before `UI.lua`. Clone category definitions/examples into sorted sections. Format reference results with category name, expansion name, evidence, exclusion/unsupported status, and sorted exact-route tabs. Return new tables so UI code cannot mutate classifier or generated data.

Cap search at 50 results and return this explicit empty-state copy:

```text
No bundled MoP Classic profession item found.
```

- [ ] **Step 4: Build the addon-styled reference page in `UI.lua`**

Keep `CategoryReference.lua` frame-independent. In `UI.lua`, create a `470 x 650` panel using the file-local `createPanel`, `createButton`, `createInput`, colors, fonts, and borders. Put search at the top, category definitions/examples in a scrollable left/main view, and render search or Shared-list results in a reusable scroll child. The Shared button switches the result view to the complete list with an expansion label on every row.

Use plain text rows rather than one frame per bundled item; only create frames for the capped visible result set. This avoids thousands of UI objects. Numeric excluded lookups show the exclusion reason. Unsupported lookup shows the exact empty-state copy above.

- [ ] **Step 5: Add Advanced entry and exclusive page transitions**

Add `Category Reference` beside/below `Smart Deposits` in Advanced settings. `ShowCategoryReferenceUI` hides organizer, Smart Deposit settings, and Advanced before showing the reference page. Reference Back hides reference before showing Advanced. Update `ShowOrganizerUI`, `ShowAdvancedUI`, `ShowDepositSettingsUI`, and `HideOrganizerUI` so at most one GBO page is visible and refresh scheduling considers the reference page.

If `depositProfileRecovery` contains entries, show a concise warning in Advanced settings and include recovery data in the existing copyable diagnostic report; never use it for routing.

- [ ] **Step 6: Run complete parser and smoke tests**

Run:

```bash
for file in GuildBankOrganizer/*.lua tests/*.lua; do
  npx --yes luaparse "$file" >/dev/null
done
npx --yes --package=fengari-node-cli fengari tests/smoke.lua
```

Expected: cold-cache search, numeric lookup, exclusion status, Shared expansion grouping, exact-route annotation, recovery warning, and non-overlapping page transitions pass.

- [ ] **Step 7: Commit the Category Reference**

Run:

```bash
git add GuildBankOrganizer/CategoryReference.lua \
  GuildBankOrganizer/GuildBankOrganizer.toc GuildBankOrganizer/UI.lua \
  GuildBankOrganizer/Diagnostics.lua tests/smoke.lua
git diff --cached --check
git commit -m "Add Smart Deposit category reference"
```

---

### Task 7: Document, Package, and Install the Persistence Beta

**Files:**
- Modify: `GuildBankOrganizer/GuildBankOrganizer.toc:1-20`
- Modify: `CHANGELOG.md:1-24`
- Modify: `README.md:68-135`
- Modify: `docs/CATEGORY_RULES.md:1-115`
- Modify: `docs/SMART_DEPOSIT.md`
- Create: `dist/GuildBankOrganizer-1.2.0-beta.3.zip` through `scripts/package.sh` (ignored by Git)
- Install: `/Applications/World of Warcraft/_classic_/Interface/AddOns/GuildBankOrganizer`

**Interfaces:**
- Consumes: the verified taxonomy, store, router, autosave, and reference UI from Tasks 1-6.
- Produces: one exact `1.2.0-beta.3` archive and an installed addon tree identical to the archive.

- [ ] **Step 1: Update public documentation and version**

Set:

```text
## Version: 1.2.0-beta.3
```

Add a `1.2.0-beta.3 - 2026-08-12` changelog section covering:

- profile edits now save automatically and survive `/reload`;
- specific-expansion routes override All Expansions routes;
- equal-priority conflicts identify both tabs and move nothing;
- Shared Profession Supplies is now the smaller Shared Crafting Reagents set;
- obvious parchment, vellum, dye, vial, and similar supplies use intuitive categories;
- Advanced settings now includes searchable Category Reference;
- checkbox outlines improve expansion-filter contrast.

Update README and Smart Deposit documentation with `Save Now` as an optional explicit confirmation, exact autosave triggers, route precedence, conflict behavior, and the Category Reference entry point. Update `CATEGORY_RULES.md` to match curated → intrinsic → generated → bag-family precedence and link its complete Shared list to the generated coverage report.

- [ ] **Step 2: Run generator unit, reproducibility, parser, smoke, and whitespace checks**

Run:

```bash
python3 -m unittest tests.test_profession_generator -v
python3 scripts/generate_profession_data.py
git diff --check
for file in GuildBankOrganizer/*.lua tests/*.lua; do
  npx --yes luaparse "$file" >/dev/null
done
npx --yes --package=fengari-node-cli fengari tests/smoke.lua
```

Expected: unit tests pass, generator reports zero unreviewed multi-owner items, all Lua parses, and smoke ends with `smoke test passed`.

- [ ] **Step 3: Build and inspect the beta archive**

Run:

```bash
./scripts/package.sh
unzip -tq dist/GuildBankOrganizer-1.2.0-beta.3.zip
unzip -p dist/GuildBankOrganizer-1.2.0-beta.3.zip \
  GuildBankOrganizer/GuildBankOrganizer.toc | rg '^## Version: 1.2.0-beta.3$'
unzip -l dist/GuildBankOrganizer-1.2.0-beta.3.zip | \
  rg 'ProfileStore.lua|CategoryReference.lua|ProfessionData.lua'
shasum -a 256 dist/GuildBankOrganizer-1.2.0-beta.3.zip
```

Expected: ZIP integrity passes; the exact version and all new runtime files are present; record the SHA-256 checksum.

- [ ] **Step 4: Back up the installed beta and install the exact archive**

Resolve explicit paths before moving anything:

```bash
install_root="/Applications/World of Warcraft/_classic_/Interface/AddOns"
installed_addon="$install_root/GuildBankOrganizer"
backup_root="/Users/ericbeane/Documents/WoW Addon Backups"
backup_addon="$backup_root/GuildBankOrganizer-1.2.0-beta.2-20260812-persistence"
test -d "$installed_addon"
test ! -e "$backup_addon"
mkdir -p "$backup_root"
mv "$installed_addon" "$backup_addon"
unzip -q dist/GuildBankOrganizer-1.2.0-beta.3.zip -d "$install_root"
```

Expected: the prior installed tree remains recoverable at the explicit backup path and the new installed tree comes only from the verified archive.

- [ ] **Step 5: Verify installed/archive identity**

Run:

```bash
verify_dir=$(mktemp -d)
unzip -q dist/GuildBankOrganizer-1.2.0-beta.3.zip -d "$verify_dir"
diff -qr "$verify_dir/GuildBankOrganizer" \
  "/Applications/World of Warcraft/_classic_/Interface/AddOns/GuildBankOrganizer"
rm -r "$verify_dir"
```

Expected: `diff` prints nothing. The temporary directory is a narrow `mktemp` target and is removed after comparison.

- [ ] **Step 6: Commit release-facing source and documentation**

Run:

```bash
git add GuildBankOrganizer/GuildBankOrganizer.toc CHANGELOG.md README.md \
  docs/CATEGORY_RULES.md docs/SMART_DEPOSIT.md
git diff --cached --check
git commit -m "Prepare profile persistence beta"
git status --short
```

Expected: source/documentation are committed, the ignored distribution ZIP is not committed, and no unrelated files are modified.

- [ ] **Step 7: Perform focused in-client acceptance testing**

In MoP Classic:

1. Open the guild bank and edit a Herbs/All Expansions profile without pressing `Save Now`.
2. Return to Organizer, run `/reload`, reopen the profile, and confirm all fields persisted.
3. Put Mageroyal in bags and verify both the current-tab plan and actual deposit target the Herbs tab.
4. Confirm Mists Herbs override an All Expansions Herbs fallback.
5. Search Category Reference for Crystal Vial, Light Parchment, Ruined Vellum, Chaos Orb, and numeric Test Sapper Charge.
6. Open the complete Shared list and verify expansion labels.
7. Confirm unchecked expansion boxes have outlines and selected boxes remain unmistakable.
8. Run one current-tab and one all-tabs deposit to verify cadence, retries, Stop, progress, and reports remain unchanged.

Expected: profiles survive the login/reload boundary, classification matches the reference page, Mageroyal no longer remains because of an unsaved route, and deposit timing behaves like the previously verified beta.
