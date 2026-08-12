"""Reviewed player-facing policy for ambiguous profession items.

All reviewed excluded records are retained for exact-ID diagnostics but are not
public routing choices. Runtime safety overrides for Spinefish, Enchanting
Vellum, and Singing Crystal remain in Categories.lua: they are gameplay/client
anomalies, not profession-generator policy.
"""

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
    9210: "tailoring",       # Ghost Dye
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
    1165: "internal test item",       # Test Food
    23418: "internal test item",       # Test Sapper Charge
    4363: "broken internal record",   # Broken Modulator
    8547: "placeholder item",         # Formula: Powerful Smelling Salts [PH]
    13642: "internal test item",      # Level 15 Test Gear Cloth - Mage/Priest/Warlock
    13643: "internal test item",      # Level 15 Test Gear Leather - Druid/Shaman
    13644: "internal test item",      # Level 15 Test Gear Leather - Hunter/Rogue
    13645: "internal test item",      # Level 15 Test Gear Mail - Paladin/Warrior
    13646: "internal test item",      # Level 20 Test Gear Cloth - Mage/Priest/Warlock
    13647: "internal test item",      # Level 25 Test Gear Cloth - Mage/Priest/Warlock
    13648: "internal test item",      # Level 30 Test Gear Cloth - Mage/Priest/Warlock
    13649: "internal test item",      # Level 35 Test Gear Cloth - Mage/Priest/Warlock
    13650: "internal test item",      # Level 40 Test Gear Cloth - Mage/Priest/Warlock
    13651: "internal test item",      # Level 45 Test Gear Cloth - Mage/Priest/Warlock
    13652: "internal test item",      # Level 50 Test Gear Cloth - Mage/Priest/Warlock
    13653: "internal test item",      # Level 55 Test Gear Cloth - Mage/Priest/Warlock
    13654: "internal test item",      # Level 60 Test Gear Cloth - Mage/Priest/Warlock
    13655: "internal test item",      # Level 65 Test Gear Cloth - Mage
    13656: "internal test item",      # Level 20 Test Gear Mail - Paladin/Warrior
    13657: "internal test item",      # Level 25 Test Gear Mail - Paladin/Warrior
    13658: "internal test item",      # Level 30 Test Gear Mail - Paladin/Warrior
    13659: "internal test item",      # Level 35 Test Gear Mail - Paladin/Warrior
    13660: "internal test item",      # Level 20 Test Gear Leather - Druid/Shaman
    13661: "internal test item",      # Level 25 Test Gear Leather - Druid/Shaman
    13662: "internal test item",      # Level 30 Test Gear Leather - Druid/Shaman
    13663: "internal test item",      # Level 35 Test Gear Leather - Druid/Shaman
    13664: "internal test item",      # Level 20 Test Gear Leather - Hunter/Rogue
    13665: "internal test item",      # Level 25 Test Gear Leather - Hunter/Rogue
    13666: "internal test item",      # Level 30 Test Gear Leather - Hunter/Rogue
    13667: "internal test item",      # Level 35 Test Gear Leather - Hunter/Rogue
    13668: "internal test item",      # Level 40 Test Gear Leather - Druid
    13669: "internal test item",      # Level 45 Test Gear Leather - Druid
    13670: "internal test item",      # Level 50 Test Gear Leather - Druid
    13671: "internal test item",      # Level 55 Test Gear Leather - Druid
    13672: "internal test item",      # Level 60 Test Gear Leather - Druid
    13673: "internal test item",      # Level 65 Test Gear Leather - Druid
    13674: "internal test item",      # Level 40 Test Gear Leather - Rogue
    13675: "internal test item",      # Level 45 Test Gear Leather - Rogue
    13676: "internal test item",      # Level 50 Test Gear Leather - Rogue
    13677: "internal test item",      # Level 55 Test Gear Leather - Rogue
    13678: "internal test item",      # Level 60 Test Gear Leather - Rogue
    13679: "internal test item",      # Level 65 Test Gear Leather - Rogue
    13680: "internal test item",      # Level 40 Test Gear Plate - Paladin/Warrior
    13681: "internal test item",      # Level 45 Test Gear Plate - Paladin/Warrior
    13682: "internal test item",      # Level 50 Test Gear Plate - Paladin/Warrior
    13683: "internal test item",      # Level 55 Test Gear Plate - Paladin/Warrior
    13684: "internal test item",      # Level 60 Test Gear Plate - Paladin/Warrior
    13685: "internal test item",      # Level 65 Test Gear Plate - Paladin
    13686: "internal test item",      # Level 40 Test Gear Mail - Hunter
    13687: "internal test item",      # Level 45 Test Gear Mail - Hunter
    13688: "internal test item",      # Level 50 Test Gear Mail - Hunter
    13689: "internal test item",      # Level 55 Test Gear Mail - Hunter
    13690: "internal test item",      # Level 60 Test Gear Mail - Hunter
    13691: "internal test item",      # Level 65 Test Gear Mail - Hunter
    13692: "internal test item",      # Level 40 Test Gear Mail - Shaman
    13693: "internal test item",      # Level 45 Test Gear Mail - Shaman
    13694: "internal test item",      # Level 50 Test Gear Mail - Shaman
    13695: "internal test item",      # Level 55 Test Gear Mail - Shaman
    13696: "internal test item",      # Level 60 Test Gear Mail - Shaman
    13697: "internal test item",      # Level 65 Test Gear Mail - Shaman
    20499: "broken internal record",  # Broken Silithid Chitin
    23684: "placeholder item",        # Crystal Infused Bandage [PH]
    23696: "placeholder item",        # [PH] Potion of Heightened Senses [DEP]
    23698: "placeholder item",        # [PH] Nature Resist Potion [DEP]
    28388: "internal test item",      # TCHILTON TEST RUBY
    28389: "internal test item",      # TCHILTON TEST DAWNSTONE
    34465: "internal test item",      # Test Firebloom
    34476: "broken internal record",   # Broken Engine Part
    34467: "internal test item",      # Test Handful of Fel Iron Bolts
    34840: "broken internal record",  # Broken Spyglass
    35499: "placeholder item",         # Ninja Grenade [PH]
    35485: "placeholder item",        # Goblin Rocket Launcher [PH]
    35626: "placeholder item",        # Eternal Mana [PH]
    35715: "placeholder item",        # Deprecated Glyph of Venomous Mana [PH]
    37301: "internal test item",      # Deprecated Test Glyph
    37550: "internal test item",      # DEPRECATED Test Glyph 2
    37551: "placeholder item",        # DEPRECATED Test Glyph 3 [PH]
    38292: "internal test item",      # Test Living Ruby
    38498: "internal test item",      # QA Test Blank Purple Gem
    38499: "internal test item",      # QA Test Blank Blue Gem
    38500: "internal test item",      # QA Test Blank Red Gem
    38501: "internal test item",      # QA Test Blank Yellow Gem
    38502: "internal test item",      # QA Test Blank Orange Gem
    38503: "internal test item",      # QA Test Blank Green Gem
    38641: "placeholder item",        # Deprecated Frostweave Bandage [PH]
    39304: "placeholder item",        # Glyph of Natural Force [PH]
    39585: "placeholder item",        # Deprecated Glyph of Wild Endurance [PH]
    39586: "placeholder item",        # Derecated Glyph of Moonfire (Kyle Test) [PH]
    40677: "placeholder item",        # Crafty Potion PLACEHOLDER
    41374: "placeholder item",        # [PH] Glass of Red Wine
    43098: "placeholder item",        # Ochre Pigment [PH]
    44119: "placeholder item",        # Recipe: Big Bear Steak [PH]
    41178: "internal test item",       # ZX-5103 Mechanical Suit
    43614: "broken internal record",   # Broken Wrath Elixir
    43620: "broken internal record",   # Broken Spellpower Elixir
    43621: "broken internal record",   # Broken Noggenfogger Elixir
    49627: "broken internal record",  # Broken Fishbones
    60891: "internal test item",      # Pat Test Hydraulic
    60893: "internal test item",      # Pat Test Cogwheel
    67435: "internal-only record",    # Loot-A-Rang (INTERNAL ONLY)
    72164: "placeholder item",        # Type1 Leather [PH]
    72165: "placeholder item",        # Type2 Leather [PH]
    72174: "placeholder item",        # Type3 Leather [PH]
    72175: "placeholder item",        # Type4 Leather [PH]
    76747: "internal test item",      # Scaling Food (TEST)
    79119: "internal test item",      # Test Glyph 1
    79121: "internal test item",      # Item A [DO NOT TEST OR LOCALIZE]
    79122: "internal test item",      # Item B [DO NOT TEST OR LOCALIZE]
    79123: "internal test item",      # Item C [DO NOT TEST OR LOCALIZE]
    80824: "placeholder item",        # Sha Crystal (TEST VERSION) [PH]
    82396: "internal test item",      # Recipe: Format Test
    86561: "internal test item",      # Test Cookbook
}
