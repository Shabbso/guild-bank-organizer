# Smart Deposit category rules

Guild Bank Organizer uses a deterministic, exclusive taxonomy: one item gets
one public category. This prevents the same bag item from being promised to
several guild-bank tabs.

Rules are evaluated in this order:

1. curated item-ID assignments and reviewed exclusions;
2. intrinsic class, subclass, equipment-slot, and recipe metadata;
3. generated MoP profession item data for records whose broad metadata is not
   specific enough;
4. one unambiguous specialized-bag family for an otherwise unknown future
   item.

Generated profession records never replace broad intrinsic groups such as
Armor, Weapons, Cloth, Ore, Leather, Herbs, or Elemental materials.

| Public category | Primary rule |
| --- | --- |
| Trinkets | Equipment location is `INVTYPE_TRINKET` |
| Armor | Item class is Armor |
| Weapons | Item class is Weapon |
| Elemental | Trade Goods subclass 10 |
| Battle Pets | Battle Pet class, or legacy Miscellaneous companion-pet subclass |
| Lockboxes | Built-in, inspectable item-ID list plus profile exact IDs |
| Bags | Item class is Container |
| Cloth | Trade Goods subclass 5 |
| Enchanting | Enchanting or Item Enchantment trade goods, enchant consumables, formulas, and generated oils/supplies |
| Food | Finished Food & Drink consumables |
| Fish & Cooking | Cooking trade goods, cooking/fishing recipes, fishing-family items, and generated ingredients/lures |
| Herbs | Trade Goods subclass 9 and herb-family items |
| Alchemy | Potions, elixirs, flasks, recipes, and generated Alchemy supplies |
| Jewels | Gems, Jewelcrafting trade goods/recipes, and generated Jewelcrafting supplies |
| Ore, Bars & Stone | Trade Goods subclass 7 and mining-family items |
| Blacksmithing | Plans and generated non-equipment products such as stones, flux, and keys |
| Inscription | Glyphs, techniques, and generated pigments, inks, scrolls, and supplies |
| Leather | Trade Goods subclass 6 |
| Engineering | Parts, explosives, devices, schematics, and generated Engineering products |
| Tailoring | Patterns and generated non-equipment Tailoring products |
| Leatherworking | Patterns and generated non-equipment Leatherworking products |
| First Aid | Bandages, manuals, anti-venoms, and generated First Aid supplies |
| Shared Crafting Reagents | Reviewed allowlist items with several defensible profession owners and no stronger intrinsic category |
| Archaeology | Bankable keystones; fragment currencies are not bag items |

The generated catalog is built from the MoP Classic `Item`, `ItemSparse`,
`SkillLineAbility`, `SpellReagents`, and `SpellEffect` client tables. See the
generated [`PROFESSION_COVERAGE.md`](PROFESSION_COVERAGE.md#shared-crafting-reagents)
for the complete Shared Crafting Reagents allowlist, counts, methodology, and
the reproduction command.

## Why shared supplies are separate

Some raid and endgame crafting reagents genuinely serve several professions
without one intuitive owner. Assigning them to every profession would make tab
routing overlap and depend on scan order. **Shared Crafting Reagents** is a
small reviewed allowlist for that case. Obvious supplies such as Crystal Vial,
parchment, vellum, and dyes instead route to the most intuitive player-facing
profession category. Generation stops when a new multi-owner item has not been
curated, explicitly allowlisted as Shared, or excluded.

## Archaeology

Archaeology's fragments are currencies rather than bag items. Its optional
keystones are ordinary item objects, but they do not appear in the standard
profession reagent graph. GBO therefore includes the MoP client keystone set
directly: Dwarf Rune Stone/Dwarven Keystone, Highborne Scroll, Troll Tablet,
Orc Blood Text, Draenei Tome, Vrykul Rune Stick, Nerubian Obelisk, Tol'vir
Hieroglyphic, Pandaren Pottery Shard, Mogu Statue Piece, and Mantid Amber
Sliver/Piece.

## Expansion filtering

The expansion filter uses these public IDs:

| ID | Expansion |
| --- | --- |
| 0 | Classic |
| 1 | The Burning Crusade |
| 2 | Wrath of the Lich King |
| 3 | Cataclysm |
| 4 | Mists of Pandaria |

MoP Classic can return `expansionID=254` for items from every era, or report
`0` for post-Classic items. GBO instead uses first presence in Blizzard's late
Classic, TBC, Wrath, Cataclysm, and MoP Classic `Item` tables. The generated
correction table stores only ranges where compact item-ID thresholds overlap.

## Runtime safety boundaries

- Profile exact item IDs take precedence over category routes.
- A specific-expansion category route takes precedence over an All Expansions
  route for the same category.
- Equal-priority routes to different tabs identify both destinations and leave
  the conflicted item in the player's bags.
- Bound and locked bag items are never added to a deposit plan.
- Base item data excludes bind-on-pickup, Quest-class, quest-bound, and
  conjured records from the generated coverage denominator.
- A bind-on-equip or bind-on-use item can be bankable before it becomes bound,
  so live bag state remains authoritative.
- Reviewed deprecated, obsolete, unused, test, placeholder, and internal
  records are excluded from public routing and text suggestions. They remain
  available only through exact numeric reference lookup for diagnostics.
- The audit covers profession-connected and direct profession-metadata items,
  not every quest token or miscellaneous object in the game.

Regenerate the profession catalog and report with:

```sh
python3 scripts/generate_profession_data.py
```

The addon never contacts Wago Tools at runtime.
