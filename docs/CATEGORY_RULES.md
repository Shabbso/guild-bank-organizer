# Smart Deposit category rules

Guild Bank Organizer classifies loaded bag items from Blizzard's item metadata.
Rules are evaluated in the order below so, for example, a trinket is not
swallowed by the broader Armor rule.

| Public category | Metadata rule |
| --- | --- |
| Trinkets | Equipment location is `INVTYPE_TRINKET` |
| Armor | Item class is Armor |
| Weapons | Item class is Weapon |
| Elemental | Trade Goods subclass 10 |
| Battle Pets | Battle Pet class, or legacy Miscellaneous companion-pet subclass |
| Lockboxes | Built-in, inspectable item-ID list plus profile exact IDs |
| Bags | Item class is Container |
| Cloth | Trade Goods subclass 5 |
| Enchanting | Trade Goods subclass 12 or Item Enhancement class |
| Food | Consumable Food & Drink subclass |
| Fish & Raw Cooking | Trade Goods Cooking subclass 8 |
| Herbs | Trade Goods subclass 9 |
| Alchemy | Consumable Potion, Elixir, or Flask subclass |
| Jewels | Gem class or Trade Goods Jewelcrafting subclass 4 |
| Ore, Bars & Stone | Trade Goods subclass 7 |
| Blacksmithing (exact items) | Profile exact item IDs |
| Inscription | Glyph class or Trade Goods Inscription subclass 16 |
| Leather | Trade Goods subclass 6 |

The expansion filter uses these public IDs:

| ID | Expansion |
| --- | --- |
| 0 | Classic |
| 1 | The Burning Crusade |
| 2 | Wrath of the Lich King |
| 3 | Cataclysm |
| 4 | Mists of Pandaria |

## Deliberate limitations

MoP item metadata groups raw fish, meat, and other raw cooking ingredients
together, so the addon does not claim it can perfectly separate fish from
every other cooking ingredient. The UI names that rule **Fish & Raw Cooking**.

The metadata also does not provide one universal “crafted by Blacksmithing”
field. Armor remains deterministically classifiable as Armor; non-armor
Blacksmithing products can be routed with the profile's comma-separated exact
item IDs.

Exact item IDs take precedence over category rules. Bound and locked bag items
are never included in a deposit plan.

MoP Classic can return `expansionID=254` for items from every era, or report
`0` for post-Classic items in some cache states. Those values are not reliable
enough to drive profiles directly.

GBO instead uses the item's first presence in Blizzard's late Classic, TBC,
Wrath, Cataclysm, and MoP Classic client `Item` DB2 tables. A generated table
stores only the ranges where expansion-era item-number thresholds overlap;
the remaining IDs use compact thresholds. This covers every public category,
including equipment, without bundling a complete item database. Exact curated
IDs still take precedence for special cases such as core MoP enchanting
materials.

The generated source builds and regeneration command are recorded in
`GuildBankOrganizer/ExpansionData.lua` and
`scripts/generate_expansion_data.py`.
