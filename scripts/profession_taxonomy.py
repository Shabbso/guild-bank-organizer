"""Reviewed player-facing policy for ambiguous profession items.

All seven excluded records are retained for exact-ID diagnostics but are not
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
