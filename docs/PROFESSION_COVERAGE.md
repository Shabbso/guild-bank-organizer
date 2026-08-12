# MoP Classic profession item coverage

This report is generated, not hand-maintained. It joins the Mists of
Pandaria Classic profession skill lines with their spell reagents and
created items, then classifies each eligible item using intrinsic item
metadata, specialized-bag evidence, and profession ownership.

- Client build: `5.5.4.68806`
- Profession recipe-graph item records: **5,920**
- Total recipe-graph, direct-metadata, and Archaeology candidates: **11,783**
- Public guild-bank-eligible records: **8,464**
- Resolved by intrinsic item metadata: **7,593**
- Resolved by generated profession data: **871**
- Eligible records without an organizational category: **0**

Static eligibility excludes bind-on-pickup, quest-bound, Quest-class, and
conjured records. Archaeology fragment currencies are not item records;
the bankable keystone items are included explicitly.

The live bag binding flag remains authoritative because an item
instance can be bound even when its base item record is not.

## Category coverage

| Category | Intrinsic | Generated | Total |
| --- | ---: | ---: | ---: |
| Alchemy | 399 | 21 | 420 |
| Archaeology | 0 | 13 | 13 |
| Armor | 2,129 | 0 | 2,129 |
| Bags | 55 | 0 | 55 |
| Battle Pets | 18 | 0 | 18 |
| Blacksmithing | 236 | 31 | 267 |
| Cloth | 45 | 0 | 45 |
| Elemental | 61 | 6 | 67 |
| Enchanting | 616 | 16 | 632 |
| Engineering | 117 | 261 | 378 |
| First Aid | 34 | 6 | 40 |
| Fish & Cooking | 327 | 231 | 558 |
| Food | 701 | 0 | 701 |
| Herbs | 73 | 13 | 86 |
| Inscription | 501 | 185 | 686 |
| Jewels | 1,437 | 24 | 1,461 |
| Leather | 78 | 0 | 78 |
| Leatherworking | 221 | 26 | 247 |
| Lockboxes | 4 | 0 | 4 |
| Ore, Bars & Stone | 96 | 1 | 97 |
| Shared Crafting Reagents | 0 | 19 | 19 |
| Tailoring | 199 | 18 | 217 |
| Trinkets | 27 | 0 | 27 |
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
| 1165 | Test Food | internal test item |
| 4363 | Broken Modulator | broken internal record |
| 8547 | Formula: Powerful Smelling Salts [PH] | placeholder item |
| 13642 | Level 15 Test Gear Cloth - Mage/Priest/Warlock | internal test item |
| 13643 | Level 15 Test Gear Leather - Druid/Shaman | internal test item |
| 13644 | Level 15 Test Gear Leather - Hunter/Rogue | internal test item |
| 13645 | Level 15 Test Gear Mail - Paladin/Warrior | internal test item |
| 13646 | Level 20 Test Gear Cloth - Mage/Priest/Warlock | internal test item |
| 13647 | Level 25 Test Gear Cloth - Mage/Priest/Warlock | internal test item |
| 13648 | Level 30 Test Gear Cloth - Mage/Priest/Warlock | internal test item |
| 13649 | Level 35 Test Gear Cloth - Mage/Priest/Warlock | internal test item |
| 13650 | Level 40 Test Gear Cloth - Mage/Priest/Warlock | internal test item |
| 13651 | Level 45 Test Gear Cloth - Mage/Priest/Warlock | internal test item |
| 13652 | Level 50 Test Gear Cloth - Mage/Priest/Warlock | internal test item |
| 13653 | Level 55 Test Gear Cloth - Mage/Priest/Warlock | internal test item |
| 13654 | Level 60 Test Gear Cloth - Mage/Priest/Warlock | internal test item |
| 13655 | Level 65 Test Gear Cloth - Mage | internal test item |
| 13656 | Level 20 Test Gear Mail - Paladin/Warrior | internal test item |
| 13657 | Level 25 Test Gear Mail - Paladin/Warrior | internal test item |
| 13658 | Level 30 Test Gear Mail - Paladin/Warrior | internal test item |
| 13659 | Level 35 Test Gear Mail - Paladin/Warrior | internal test item |
| 13660 | Level 20 Test Gear Leather - Druid/Shaman | internal test item |
| 13661 | Level 25 Test Gear Leather - Druid/Shaman | internal test item |
| 13662 | Level 30 Test Gear Leather - Druid/Shaman | internal test item |
| 13663 | Level 35 Test Gear Leather - Druid/Shaman | internal test item |
| 13664 | Level 20 Test Gear Leather - Hunter/Rogue | internal test item |
| 13665 | Level 25 Test Gear Leather - Hunter/Rogue | internal test item |
| 13666 | Level 30 Test Gear Leather - Hunter/Rogue | internal test item |
| 13667 | Level 35 Test Gear Leather - Hunter/Rogue | internal test item |
| 13668 | Level 40 Test Gear Leather - Druid | internal test item |
| 13669 | Level 45 Test Gear Leather - Druid | internal test item |
| 13670 | Level 50 Test Gear Leather - Druid | internal test item |
| 13671 | Level 55 Test Gear Leather - Druid | internal test item |
| 13672 | Level 60 Test Gear Leather - Druid | internal test item |
| 13673 | Level 65 Test Gear Leather - Druid | internal test item |
| 13674 | Level 40 Test Gear Leather - Rogue | internal test item |
| 13675 | Level 45 Test Gear Leather - Rogue | internal test item |
| 13676 | Level 50 Test Gear Leather - Rogue | internal test item |
| 13677 | Level 55 Test Gear Leather - Rogue | internal test item |
| 13678 | Level 60 Test Gear Leather - Rogue | internal test item |
| 13679 | Level 65 Test Gear Leather - Rogue | internal test item |
| 13680 | Level 40 Test Gear Plate - Paladin/Warrior | internal test item |
| 13681 | Level 45 Test Gear Plate - Paladin/Warrior | internal test item |
| 13682 | Level 50 Test Gear Plate - Paladin/Warrior | internal test item |
| 13683 | Level 55 Test Gear Plate - Paladin/Warrior | internal test item |
| 13684 | Level 60 Test Gear Plate - Paladin/Warrior | internal test item |
| 13685 | Level 65 Test Gear Plate - Paladin | internal test item |
| 13686 | Level 40 Test Gear Mail - Hunter | internal test item |
| 13687 | Level 45 Test Gear Mail - Hunter | internal test item |
| 13688 | Level 50 Test Gear Mail - Hunter | internal test item |
| 13689 | Level 55 Test Gear Mail - Hunter | internal test item |
| 13690 | Level 60 Test Gear Mail - Hunter | internal test item |
| 13691 | Level 65 Test Gear Mail - Hunter | internal test item |
| 13692 | Level 40 Test Gear Mail - Shaman | internal test item |
| 13693 | Level 45 Test Gear Mail - Shaman | internal test item |
| 13694 | Level 50 Test Gear Mail - Shaman | internal test item |
| 13695 | Level 55 Test Gear Mail - Shaman | internal test item |
| 13696 | Level 60 Test Gear Mail - Shaman | internal test item |
| 13697 | Level 65 Test Gear Mail - Shaman | internal test item |
| 20499 | Broken Silithid Chitin | broken internal record |
| 23418 | Test Sapper Charge | internal test item |
| 23684 | Crystal Infused Bandage [PH] | placeholder item |
| 23696 | [PH] Potion of Heightened Senses [DEP] | placeholder item |
| 23698 | [PH] Nature Resist Potion [DEP] | placeholder item |
| 28388 | TCHILTON TEST RUBY | internal test item |
| 28389 | TCHILTON TEST DAWNSTONE | internal test item |
| 34465 | Test Firebloom | internal test item |
| 34467 | Test Handful of Fel Iron Bolts | internal test item |
| 34476 | Broken Engine Part | broken internal record |
| 34840 | Broken Spyglass | broken internal record |
| 35485 | Goblin Rocket Launcher [PH] | placeholder item |
| 35499 | Ninja Grenade [PH] | placeholder item |
| 35626 | Eternal Mana [PH] | placeholder item |
| 35715 | Deprecated Glyph of Venomous Mana [PH] | placeholder item |
| 37301 | Deprecated Test Glyph | internal test item |
| 37550 | DEPRECATED Test Glyph 2 | internal test item |
| 37551 | DEPRECATED Test Glyph 3 [PH] | placeholder item |
| 38292 | Test Living Ruby | internal test item |
| 38498 | QA Test Blank Purple Gem | internal test item |
| 38499 | QA Test Blank Blue Gem | internal test item |
| 38500 | QA Test Blank Red Gem | internal test item |
| 38501 | QA Test Blank Yellow Gem | internal test item |
| 38502 | QA Test Blank Orange Gem | internal test item |
| 38503 | QA Test Blank Green Gem | internal test item |
| 38641 | Deprecated Frostweave Bandage [PH] | placeholder item |
| 39304 | Glyph of Natural Force [PH] | placeholder item |
| 39585 | Deprecated Glyph of Wild Endurance [PH] | placeholder item |
| 39586 | Derecated Glyph of Moonfire (Kyle Test) [PH] | placeholder item |
| 40677 | Crafty Potion PLACEHOLDER | placeholder item |
| 41178 | ZX-5103 Mechanical Suit | internal test item |
| 41374 | [PH] Glass of Red Wine | placeholder item |
| 43098 | Ochre Pigment [PH] | placeholder item |
| 43614 | Broken Wrath Elixir | broken internal record |
| 43620 | Broken Spellpower Elixir | broken internal record |
| 43621 | Broken Noggenfogger Elixir | broken internal record |
| 44119 | Recipe: Big Bear Steak [PH] | placeholder item |
| 49627 | Broken Fishbones | broken internal record |
| 60891 | Pat Test Hydraulic | internal test item |
| 60893 | Pat Test Cogwheel | internal test item |
| 67435 | Loot-A-Rang (INTERNAL ONLY) | internal-only record |
| 72164 | Type1 Leather [PH] | placeholder item |
| 72165 | Type2 Leather [PH] | placeholder item |
| 72174 | Type3 Leather [PH] | placeholder item |
| 72175 | Type4 Leather [PH] | placeholder item |
| 76747 | Scaling Food (TEST) | internal test item |
| 79119 | Test Glyph 1 | internal test item |
| 79121 | Item A [DO NOT TEST OR LOCALIZE] | internal test item |
| 79122 | Item B [DO NOT TEST OR LOCALIZE] | internal test item |
| 79123 | Item C [DO NOT TEST OR LOCALIZE] | internal test item |
| 80824 | Sha Crystal (TEST VERSION) [PH] | placeholder item |
| 82396 | Recipe: Format Test | internal test item |
| 86561 | Test Cookbook | internal test item |

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
