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
    # Explicit client-name markers identify these as obsolete records. They are
    # reviewed exact IDs rather than a runtime name filter.
    741: "deprecated client record",      # Deprecated Copper Ingot
    786: "deprecated client record",      # Deprecated Pure Copper Ingot
    807: "deprecated client record",      # Deprecated Iron Ingot
    1950: "deprecated client record",     # Deprecated Gold Ingot
    2050: "deprecated client record",     # Deprecated Silver Ingot
    2404: "deprecated client record",     # Deprecated Pattern: Light Winter Cloak
    2405: "deprecated client record",     # Deprecated Pattern: Light Winter Boots
    2461: "deprecated client record",     # Deprecated Elemental Resistance Potion
    2462: "deprecated client record",     # Deprecated Potion of Lesser Invulnerability (Fix)
    2554: "deprecated client record",     # Deprecated Recipe: Elixir of Fortitude
    2599: "deprecated client record",     # Deprecated Pattern: Forest Silk Gloves
    2600: "deprecated client record",     # Deprecated Pattern: Trogg Vest
    2602: "deprecated client record",     # Deprecated Pattern: Feathered Robe
    4418: "deprecated client record",     # Deprecated Creeper Cakes
    4997: "deprecated client record",     # Deprecated Recipe: Kodo Skin Bag
    5632: "deprecated client record",     # Deprecated Cowardly Flight Potion
    21950: "deprecated client record",    # Design: Cut Emerald - Deprecated
    23364: "deprecated client record",    # zzDEPRECATEDHeart of the Sky
    23366: "deprecated client record",    # zzDEPRECATEDPerfect Diamond
    34645: "deprecated client record",    # Deprecated Earthen Ink
    34660: "deprecated client record",    # Silver Writing Nib DEPRECATED
    36845: "deprecated client record",    # Deprecated Alchemy Elixir Template
    37102: "deprecated client record",    # Deprecated Emerald Ink
    37327: "deprecated client record",    # DEPRECATED Formula: Enchant Weapon - Scourgebane
    38724: "deprecated client record",    # Deprecated Glyph of Natural Force
    38952: "deprecated client record",    # Deprecated Scroll of Enchant Bracer - Major Stamina
    39300: "deprecated client record",    # Spring Loaded Cloak Expander DEPRECATED
    39352: "deprecated client record",    # Deprecated Ebon Ink
    39584: "deprecated client record",    # Deprecated Glyph of Thorns
    39587: "deprecated client record",    # Deprecated Glyph of Savage Mauling
    40413: "deprecated client record",    # Deprecated Elixir of Mighty Nothing
    40484: "deprecated client record",    # Deprecated Glyph of the White Bear
    40538: "deprecated client record",    # DEPRECATED Remote Detonator
    40754: "deprecated client record",    # DEPRECATED Flame Red Ejector Seat
    40800: "deprecated client record",    # Belt-Clipped Spynoculars [DEPRECATED]
    40948: "deprecated client record",    # Deprecated Glyph of the Red Lynx
    41247: "deprecated client record",    # Titansteel (DEPRECATED)
    42548: "deprecated client record",    # Deprecated Speed Potion Injector
    43336: "deprecated client record",    # Deprecated Glyph of the Black Bear
    43337: "deprecated client record",    # Deprecated Glyph of the Forest Lynx
    43383: "deprecated client record",    # Deprecated Glyph of the Arctic Wolf
    43384: "deprecated client record",    # Deprecated Glyph of the Black Wolf
    43540: "deprecated client record",    # Deprecated Glyph
    43602: "deprecated client record",    # Deprecated Thriving Ink
    43603: "deprecated client record",    # Deprecated Demon's Blood Ink
    43604: "deprecated client record",    # Deprecated Gorefellow Ink
    43605: "deprecated client record",    # Deprecated Starshine Ink
    43606: "deprecated client record",    # Deprecated Void Ink
    43607: "deprecated client record",    # Deprecated Noble's Ink
    44432: "deprecated client record",    # DEPRECATED Glyph of the Ghoul
    72097: "deprecated client record",    # DEPRECATED Manticyte Bar
    72987: "deprecated client record",    # Dense Windwool Bandage DEPRECATED
    27774: "obsolete client record",      # zzOLDMighty Blood Garnet
    27811: "obsolete client record",      # zzOLDMighty Blood Garnet
    28117: "obsolete client record",      # zzOLDBold Ornate Ruby
    28122: "obsolete client record",      # zzOLDEnscribed Ornate Topaz
    41403: "obsolete client record",      # ZZOLD Design: Insightful Earthsiege Diamond
    41404: "obsolete client record",      # ZZOLD Design: Bracing Earthsiege Diamond
    41405: "obsolete client record",      # ZZOLD Design: Eternal Earthsiege Diamond
    41406: "obsolete client record",      # ZZOLD Design: Powerful Earthsiege Diamond
    41407: "obsolete client record",      # ZZOLD Design: Relentless Earthsiege Diamond
    41408: "obsolete client record",      # ZZOLD Design: Austere Earthsiege Diamond
    41409: "obsolete client record",      # ZZOLD Design: Persistent Earthsiege Diamond
    41410: "obsolete client record",      # ZZOLD Design: Trenchant Earthsiege Diamond
    41411: "obsolete client record",      # ZZOLD Design: Invigorating Earthsiege Diamond
    41412: "obsolete client record",      # ZZOLD Design: Beaming Earthsiege Diamond
    41413: "obsolete client record",      # ZZOLD Design: Revitalizing Skyflare Diamond
    41414: "obsolete client record",      # ZZOLD Design: Effulgent Skyflare Diamond
    41415: "obsolete client record",      # ZZOLD Design: Tireless Skyflare Diamond
    41416: "obsolete client record",      # ZZOLD Design: Forlorn Skyflare Diamond
    41417: "obsolete client record",      # ZZOLD Design: Impassive Skyflare Diamond
    41418: "obsolete client record",      # ZZOLD Design: Chaotic Skyflare Diamond
    41419: "obsolete client record",      # ZZOLD Design: Destructive Skyflare Diamond
    41420: "obsolete client record",      # ZZOLD Design: Ember Skyflare Diamond
    41421: "obsolete client record",      # ZZOLD Design: Enigmatic Skyflare Diamond
    41422: "obsolete client record",      # ZZOLD Design: Swift Skyflare Diamond
    41423: "obsolete client record",      # ZZOLDDesign: Thundering Skyflare Diamond
    63415: "obsolete client record",      # zzOLDGlyph of Armors
    71799: "obsolete client record",      # zzOLD Glyph of Stabbing
    76729: "obsolete client record",      # zzOLD Glyph of the Chameleon
    85686: "obsolete client record",      # zzOLD Glyph of Chi Wave
    85708: "obsolete client record",      # zzOLD Glyph of Vampiric Touch
    85711: "obsolete client record",      # zzOLD Glyph of the Bear Cub
    85712: "obsolete client record",      # zzOLD Glyph of Flying Serpent Kick
    87886: "obsolete client record",      # zzOLD Glyph of Spinning Fire Blossom
    56478: "unused client record",        # Savage Leather (UNUSED)
    47842: "programmer-only crash item",  # SERVER CRASHING ITEM [PROGRAMMER ONLY -- DO NOT MAKE]
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
