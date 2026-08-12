# MoP Classic profession item coverage

This report is generated, not hand-maintained. It joins the Mists of
Pandaria Classic profession skill lines with their spell reagents and
created items, then classifies each eligible item using intrinsic item
metadata, specialized-bag evidence, and profession ownership.

- Client build: `5.5.4.68806`
- Profession recipe-graph item records: **5,920**
- Total recipe-graph, direct-metadata, and Archaeology candidates: **11,783**
- Public guild-bank-eligible records: **8,569**
- Resolved by intrinsic item metadata: **7,634**
- Resolved by generated profession data: **935**
- Eligible records without an organizational category: **0**

Static eligibility excludes bind-on-pickup, quest-bound, Quest-class, and
conjured records. Archaeology fragment currencies are not item records;
the bankable keystone items are included explicitly.

The live bag binding flag remains authoritative because an item
instance can be bound even when its base item record is not.

## Category coverage

| Category | Intrinsic | Generated | Total |
| --- | ---: | ---: | ---: |
| Alchemy | 402 | 22 | 424 |
| Archaeology | 0 | 13 | 13 |
| Armor | 2,129 | 0 | 2,129 |
| Bags | 55 | 0 | 55 |
| Battle Pets | 18 | 0 | 18 |
| Blacksmithing | 236 | 31 | 267 |
| Cloth | 45 | 0 | 45 |
| Elemental | 62 | 6 | 68 |
| Enchanting | 618 | 16 | 634 |
| Engineering | 117 | 264 | 381 |
| First Aid | 37 | 6 | 43 |
| Fish & Cooking | 329 | 289 | 618 |
| Food | 704 | 0 | 704 |
| Herbs | 74 | 13 | 87 |
| Inscription | 508 | 187 | 695 |
| Jewels | 1,448 | 24 | 1,472 |
| Leather | 82 | 0 | 82 |
| Leatherworking | 221 | 27 | 248 |
| Lockboxes | 4 | 0 | 4 |
| Ore, Bars & Stone | 99 | 1 | 100 |
| Shared Profession Supplies | 0 | 19 | 19 |
| Tailoring | 199 | 17 | 216 |
| Trinkets | 28 | 0 | 28 |
| Weapons | 219 | 0 | 219 |

## Shared Crafting Reagents

These reviewed allowlist entries deliberately route through one neutral
category instead of being duplicated across tab profiles. Any new
multi-owner candidate stops generation until it receives a curated category,
Shared allowlist entry, or exclusion.

| Item ID | Item | Profession evidence |
| ---: | --- | --- |
| 4402 | Small Flame Sac | alchemy, cooking, engineering |
| 5635 | Sharp Claw | alchemy, blacksmithing |
| 5637 | Large Fang | alchemy, blacksmithing, enchanting, jewelcrafting, leatherworking |
| 12811 | Righteous Orb | blacksmithing, enchanting, tailoring |
| 23572 | Primal Nether | blacksmithing, engineering, jewelcrafting, leatherworking, tailoring |
| 30183 | Nether Vortex | alchemy, blacksmithing, leatherworking, tailoring |
| 32428 | Heart of Darkness | blacksmithing, leatherworking, tailoring |
| 34664 | Sunmote | blacksmithing, jewelcrafting, leatherworking, tailoring |
| 43102 | Frozen Orb | blacksmithing, engineering, inscription, jewelcrafting, leatherworking, tailoring |
| 45087 | Runed Orb | blacksmithing, leatherworking, tailoring |
| 47556 | Crusader Orb | blacksmithing, leatherworking, tailoring |
| 49908 | Primordial Saronite | blacksmithing, leatherworking, tailoring |
| 52078 | Chaos Orb | blacksmithing, engineering, leatherworking, tailoring |
| 69237 | Living Ember | blacksmithing, leatherworking, tailoring |
| 71998 | Essence of Destruction | blacksmithing, leatherworking, tailoring |
| 80433 | Blood Spirit | blacksmithing, leatherworking, tailoring |
| 83092 | Orb of Mystery | engineering, jewelcrafting |
| 94289 | Haunting Spirit | blacksmithing, leatherworking, tailoring |
| 102218 | Spirit of War | blacksmithing, leatherworking, tailoring |

## Excluded reviewed records

These exact IDs remain in the reference catalog for diagnostics but are
not public routing choices.

| Item ID | Item | Exclusion reason |
| ---: | --- | --- |
| 23418 | Test Sapper Charge | internal test item |
| 34476 | Broken Engine Part | broken internal record |
| 35499 | Ninja Grenade [PH] | placeholder item |
| 41178 | ZX-5103 Mechanical Suit | internal test item |
| 43614 | Broken Wrath Elixir | broken internal record |
| 43620 | Broken Spellpower Elixir | broken internal record |
| 43621 | Broken Noggenfogger Elixir | broken internal record |

## Method and boundaries

- Intrinsic categories take priority, so crafted Armor remains Armor,
  bolts of cloth remain Cloth, bars remain Ore, and hides remain Leather.
- A specialized bag family is accepted only when it is unambiguous and
  the profession graph supports it. Fishing-family items are kept in
  Fish & Cooking because fishing itself has no crafting recipe graph.
- A unique crafted-product category wins next, followed by a unique
  profession category. Multi-profession leftovers require reviewed
  policy rather than becoming implicit Shared routing choices.
- Client data includes deprecated and internal records. The reviewed
  exclusions stay searchable by exact item ID without being suggested.
- Coverage is for items connected to professions present in this client,
  not every quest token, cosmetic, or miscellaneous object in the game.

## Reproduction

```sh
python3 scripts/generate_profession_data.py
```

The generator downloads `Item`, `ItemSparse`, `SkillLineAbility`,
`SpellReagents`, and `SpellEffect` CSV exports for the pinned client
build from Wago Tools. The addon never contacts Wago Tools at runtime.
