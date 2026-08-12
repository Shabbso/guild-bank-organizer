# MoP Classic profession item coverage

This report is generated, not hand-maintained. It joins the Mists of
Pandaria Classic profession skill lines with their spell reagents and
created items, then classifies each eligible item using intrinsic item
metadata, specialized-bag evidence, and profession ownership.

- Client build: `5.5.4.68806`
- Profession recipe-graph item records: **5,920**
- Total recipe-graph, direct-metadata, and Archaeology candidates: **11,783**
- Statically guild-bank-eligible records: **8,576**
- Resolved by intrinsic item metadata: **7,635**
- Resolved by generated profession data: **941**
- Eligible records without an organizational category: **0**

Static eligibility excludes bind-on-pickup, quest-bound, Quest-class, and
conjured records. Archaeology fragment currencies are not item records;
the bankable keystone items are included explicitly.

The live bag binding flag remains authoritative because an item
instance can be bound even when its base item record is not.

## Category coverage

| Category | Intrinsic | Generated | Total |
| --- | ---: | ---: | ---: |
| Alchemy | 402 | 21 | 423 |
| Archaeology | 0 | 13 | 13 |
| Armor | 2,129 | 0 | 2,129 |
| Bags | 55 | 0 | 55 |
| Battle Pets | 18 | 0 | 18 |
| Blacksmithing | 236 | 31 | 267 |
| Cloth | 45 | 0 | 45 |
| Elemental | 62 | 0 | 62 |
| Enchanting | 618 | 9 | 627 |
| Engineering | 117 | 263 | 380 |
| First Aid | 37 | 5 | 42 |
| Fish & Cooking | 329 | 289 | 618 |
| Food | 704 | 0 | 704 |
| Herbs | 74 | 13 | 87 |
| Inscription | 508 | 182 | 690 |
| Jewels | 1,448 | 18 | 1,466 |
| Leather | 82 | 0 | 82 |
| Leatherworking | 221 | 27 | 248 |
| Lockboxes | 4 | 0 | 4 |
| Ore, Bars & Stone | 99 | 1 | 100 |
| Shared Profession Supplies | 1 | 59 | 60 |
| Tailoring | 199 | 10 | 209 |
| Trinkets | 28 | 0 | 28 |
| Weapons | 219 | 0 | 219 |

## Shared profession supplies

These items have more than one defensible profession owner and no
stronger intrinsic category. They deliberately route through one
neutral category instead of being duplicated across tab profiles.

| Item ID | Item | Profession evidence |
| ---: | --- | --- |
| 1288 | Large Venom Sac | alchemy, first_aid |
| 2324 | Bleach | leatherworking, tailoring |
| 2325 | Black Dye | leatherworking, tailoring |
| 2604 | Red Dye | engineering, leatherworking, tailoring |
| 2605 | Green Dye | blacksmithing, engineering, leatherworking, tailoring |
| 3371 | Crystal Vial | alchemy, enchanting |
| 4340 | Gray Dye | leatherworking, tailoring |
| 4342 | Purple Dye | alchemy, engineering, leatherworking, tailoring |
| 4402 | Small Flame Sac | alchemy, cooking, engineering |
| 4470 | Simple Wood | enchanting, engineering |
| 5635 | Sharp Claw | alchemy, blacksmithing |
| 5637 | Large Fang | alchemy, blacksmithing, enchanting, jewelcrafting, leatherworking |
| 6260 | Blue Dye | engineering, tailoring |
| 10648 | Common Parchment | specialized bag or direct item metadata |
| 11291 | Star Wood | enchanting, engineering |
| 12804 | Powerful Mojo | alchemy, blacksmithing, engineering, jewelcrafting, leatherworking, tailoring |
| 12811 | Righteous Orb | blacksmithing, enchanting, tailoring |
| 17010 | Fiery Core | blacksmithing, engineering, leatherworking, mining, tailoring |
| 17011 | Lava Core | blacksmithing, engineering, leatherworking, tailoring |
| 20520 | Dark Rune | blacksmithing, tailoring |
| 22682 | Frozen Rune | blacksmithing, leatherworking, tailoring |
| 23418 | Test Sapper Charge | specialized bag or direct item metadata |
| 23572 | Primal Nether | blacksmithing, engineering, jewelcrafting, leatherworking, tailoring |
| 24186 | Copper Powder | specialized bag or direct item metadata |
| 24188 | Tin Powder | specialized bag or direct item metadata |
| 24190 | Iron Powder | specialized bag or direct item metadata |
| 24234 | Mithril Powder | specialized bag or direct item metadata |
| 24235 | Thorium Powder | specialized bag or direct item metadata |
| 24242 | Fel Iron Powder | specialized bag or direct item metadata |
| 24507 | Elemental Shard | alchemy, blacksmithing, enchanting, engineering, herbalism, inscription, jewelcrafting, leatherworking, mining, skinning, tailoring |
| 30183 | Nether Vortex | alchemy, blacksmithing, leatherworking, tailoring |
| 32428 | Heart of Darkness | blacksmithing, leatherworking, tailoring |
| 34476 | Broken Engine Part | specialized bag or direct item metadata |
| 34664 | Sunmote | blacksmithing, jewelcrafting, leatherworking, tailoring |
| 35499 | Ninja Grenade [PH] | specialized bag or direct item metadata |
| 37602 | Ruined Vellum | specialized bag or direct item metadata |
| 39349 | Ruined Vellum | specialized bag or direct item metadata |
| 39350 | Ruined Vellum | specialized bag or direct item metadata |
| 39354 | Light Parchment | engineering, inscription |
| 39501 | Heavy Parchment | specialized bag or direct item metadata |
| 39502 | Resilient Parchment | specialized bag or direct item metadata |
| 41178 | ZX-5103 Mechanical Suit | specialized bag or direct item metadata |
| 43102 | Frozen Orb | blacksmithing, engineering, inscription, jewelcrafting, leatherworking, tailoring |
| 43145 | Ruined Vellum | specialized bag or direct item metadata |
| 43146 | Ruined Vellum | specialized bag or direct item metadata |
| 43614 | Broken Wrath Elixir | specialized bag or direct item metadata |
| 43620 | Broken Spellpower Elixir | specialized bag or direct item metadata |
| 43621 | Broken Noggenfogger Elixir | specialized bag or direct item metadata |
| 45087 | Runed Orb | blacksmithing, leatherworking, tailoring |
| 47556 | Crusader Orb | blacksmithing, leatherworking, tailoring |
| 49908 | Primordial Saronite | blacksmithing, leatherworking, tailoring |
| 52078 | Chaos Orb | blacksmithing, engineering, leatherworking, tailoring |
| 69237 | Living Ember | blacksmithing, leatherworking, tailoring |
| 71966 | Shiny Bronze Rivet | specialized bag or direct item metadata |
| 71998 | Essence of Destruction | blacksmithing, leatherworking, tailoring |
| 80433 | Blood Spirit | blacksmithing, leatherworking, tailoring |
| 83092 | Orb of Mystery | engineering, jewelcrafting |
| 94289 | Haunting Spirit | blacksmithing, leatherworking, tailoring |
| 102218 | Spirit of War | blacksmithing, leatherworking, tailoring |

## Method and boundaries

- Intrinsic categories take priority, so crafted Armor remains Armor,
  bolts of cloth remain Cloth, bars remain Ore, and hides remain Leather.
- A specialized bag family is accepted only when it is unambiguous and
  the profession graph supports it. Fishing-family items are kept in
  Fish & Cooking because fishing itself has no crafting recipe graph.
- A unique crafted-product category wins next, followed by a unique
  profession category. Truly multi-profession leftovers become Shared
  Profession Supplies.
- Client data includes deprecated and internal records. Classifying an
  unreachable record is harmless; it does not make that item obtainable.
- Coverage is for items connected to professions present in this client,
  not every quest token, cosmetic, or miscellaneous object in the game.

## Reproduction

```sh
python3 scripts/generate_profession_data.py
```

The generator downloads `Item`, `ItemSparse`, `SkillLineAbility`,
`SpellReagents`, and `SpellEffect` CSV exports for the pinned client
build from Wago Tools. The addon never contacts Wago Tools at runtime.
