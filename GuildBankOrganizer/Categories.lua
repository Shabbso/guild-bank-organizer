local _, GBO = ...

local itemClass = Enum and Enum.ItemClass or {}
local CLASS = {
    CONSUMABLE = itemClass.Consumable or 0,
    CONTAINER = itemClass.Container or 1,
    WEAPON = itemClass.Weapon or 2,
    GEM = itemClass.Gem or 3,
    ARMOR = itemClass.Armor or 4,
    TRADEGOODS = itemClass.Tradegoods or 7,
    ITEM_ENHANCEMENT = itemClass.ItemEnhancement or 8,
    RECIPE = itemClass.Recipe or 9,
    MISCELLANEOUS = itemClass.Miscellaneous or 15,
    GLYPH = itemClass.Glyph or 16,
    BATTLE_PET = itemClass.Battlepet or 17,
}

local TRADEGOODS = {
    JEWELCRAFTING = 4,
    CLOTH = 5,
    LEATHER = 6,
    METAL_AND_STONE = 7,
    COOKING = 8,
    HERB = 9,
    ELEMENTAL = 10,
    OTHER = 11,
    ENCHANTING = 12,
    MATERIALS = 13,
    ITEM_ENCHANTMENT = 14,
}

local CONSUMABLE = {
    POTION = 1,
    ELIXIR = 2,
    FLASK = 3,
    FOOD_AND_DRINK = 5,
    ITEM_ENHANCEMENT = 6,
    BANDAGE = 7,
}

local RECIPE = {
    LEATHERWORKING = 1,
    TAILORING = 2,
    ENGINEERING = 3,
    BLACKSMITHING = 4,
    COOKING = 5,
    ALCHEMY = 6,
    FIRST_AID = 7,
    ENCHANTING = 8,
    FISHING = 9,
    JEWELCRAFTING = 10,
    INSCRIPTION = 11,
}

-- Lockboxes do not have a dependable lockbox-only class/subclass in this
-- client. Keep the built-in list explicit so the rule is inspectable and can
-- be supplemented by per-tab exact item IDs.
local LOCKBOX_ITEM_IDS = {
    [4632] = true, [4633] = true, [4634] = true, [4636] = true,
    [5758] = true, [5759] = true, [5760] = true,
    [6354] = true, [6355] = true, [13875] = true, [16882] = true,
    [29569] = true, [31952] = true, [43622] = true, [43624] = true,
    [45986] = true, [68729] = true, [88567] = true,
}

-- A small number of Classic items have gameplay categories that do not match
-- the class/subclass exposed by the item API. Keep these exceptions explicit
-- and reviewable instead of weakening the broad public category rules.
--
-- false means "do not route through a broad category." Exact item-ID profile
-- rules can still opt such an item in, although soulbound items remain blocked.
local GAMEPLAY_ITEM_OVERRIDES = {
    [38682] = "enchanting", -- Enchanting Vellum: Trade Goods / Other in Classic
    [83064] = "fish", -- Spinefish: Alchemy reagent obtained through fishing
    [103641] = false, -- Singing Crystal: soulbound Timeless Isle combat buff
}

local function classIs(classID)
    return function(item)
        return item.classID == classID
    end
end

local function tradegoodsIs(subclassID)
    return function(item)
        return item.classID == CLASS.TRADEGOODS
            and item.subclassID == subclassID
    end
end

local function recipeIs(subclassID)
    return function(item)
        return item.classID == CLASS.RECIPE
            and item.subclassID == subclassID
    end
end

local BAG_FAMILY_CATEGORIES = {
    { bit = 8, key = "leatherworking" },
    { bit = 16, key = "inscription" },
    { bit = 32, key = "herbs" },
    { bit = 64, key = "enchanting" },
    { bit = 128, key = "engineering" },
    { bit = 512, key = "jewels" },
    { bit = 1024, key = "ore" },
    { bit = 32768, key = "fish" },
    { bit = 65536, key = "fish" },
}

local function specializedBagCategory(item)
    if item.classID == CLASS.CONTAINER then
        return nil
    end
    local family = tonumber(item.bagFamily) or 0
    local category
    for _, candidate in ipairs(BAG_FAMILY_CATEGORIES) do
        if math.floor(family / candidate.bit) % 2 == 1 then
            if category and category ~= candidate.key then
                return nil
            end
            category = candidate.key
        end
    end
    return category
end

local categories = {
    {
        key = "trinkets",
        name = "Trinkets",
        description = "Items equipped in a trinket slot.",
        evidence = "Equipment slot",
        examples = { "Talisman of Ephemeral Power", "Darkmoon Card: Blue Dragon" },
        matches = function(item)
            return item.equipLoc == "INVTYPE_TRINKET"
        end,
    },
    {
        key = "armor",
        name = "Armor",
        description = "Wearable armor. Cloth material and bags are excluded.",
        evidence = "Item class",
        examples = { "Mooncloth Robe", "Helm of Wrath" },
        matches = classIs(CLASS.ARMOR),
    },
    {
        key = "weapons",
        name = "Weapons",
        description = "All weapon classes and weapon types.",
        evidence = "Item class",
        examples = { "Arcanite Reaper", "Thunderfury, Blessed Blade of the Windseeker" },
        matches = classIs(CLASS.WEAPON),
    },
    {
        key = "elemental",
        name = "Elemental",
        description = "Motes, primals, crystallized, eternal, volatile, and spirit materials.",
        evidence = "Trade Goods subclass",
        examples = { "Mote of Fire", "Volatile Life" },
        matches = tradegoodsIs(TRADEGOODS.ELEMENTAL),
    },
    {
        key = "battle_pets",
        name = "Battle Pets",
        description = "Caged battle pets and legacy companion-pet items.",
        evidence = "Item class",
        examples = { "Dark Whelpling", "Hyacinth Macaw" },
        matches = function(item)
            return item.classID == CLASS.BATTLE_PET
                or item.classID == CLASS.MISCELLANEOUS
                    and item.subclassID == 2
        end,
    },
    {
        key = "lockboxes",
        name = "Lockboxes",
        description = "Known locked containers. Add unusual ones by exact item ID.",
        evidence = "Curated item IDs",
        examples = { "Strong Iron Lockbox", "Elementium Lockbox" },
        matches = function(item)
            return LOCKBOX_ITEM_IDS[item.itemID] == true
        end,
    },
    {
        key = "bags",
        name = "Bags",
        description = "Equippable bags and containers; known lockboxes are excluded.",
        evidence = "Item class",
        examples = { "Netherweave Bag", "Embersilk Bag" },
        matches = classIs(CLASS.CONTAINER),
    },
    {
        key = "cloth",
        name = "Cloth",
        description = "Raw cloth and bolts from every expansion, not cloth armor.",
        evidence = "Trade Goods subclass",
        examples = { "Linen Cloth", "Bolt of Windwool Cloth" },
        matches = tradegoodsIs(TRADEGOODS.CLOTH),
    },
    {
        key = "enchanting",
        name = "Enchanting",
        description = "Dust, essence, shards, crystals, enchantments, oils, and formulas.",
        evidence = "Item metadata and generated profession data",
        examples = { "Strange Dust", "Ruined Vellum" },
        matches = function(item)
            return item.classID == CLASS.TRADEGOODS
                    and (
                        item.subclassID == TRADEGOODS.ENCHANTING
                        or item.subclassID == TRADEGOODS.ITEM_ENCHANTMENT
                    )
                or item.classID == CLASS.ITEM_ENHANCEMENT
                or item.classID == CLASS.CONSUMABLE
                    and item.subclassID == CONSUMABLE.ITEM_ENHANCEMENT
                or item.classID == CLASS.RECIPE
                    and item.subclassID == RECIPE.ENCHANTING
        end,
    },
    {
        key = "food",
        name = "Food",
        description = "Finished food and drink consumables.",
        evidence = "Consumable subclass",
        examples = { "Roasted Boar Meat", "Mogu Fish Stew" },
        matches = function(item)
            return item.classID == CLASS.CONSUMABLE
                and item.subclassID == CONSUMABLE.FOOD_AND_DRINK
        end,
    },
    {
        key = "fish",
        name = "Fish & Cooking",
        description = "Raw fish, meat, cooking ingredients, spices, lures, and cooking or fishing recipes.",
        evidence = "Item metadata and generated profession data",
        examples = { "Raw Brilliant Smallfish", "Spinefish" },
        matches = function(item)
            return item.classID == CLASS.TRADEGOODS
                    and item.subclassID == TRADEGOODS.COOKING
                or item.classID == CLASS.RECIPE
                    and (
                        item.subclassID == RECIPE.COOKING
                        or item.subclassID == RECIPE.FISHING
                    )
        end,
    },
    {
        key = "herbs",
        name = "Herbs",
        description = "Herbs from every expansion.",
        evidence = "Trade Goods subclass",
        examples = { "Mageroyal", "Green Tea Leaf" },
        matches = tradegoodsIs(TRADEGOODS.HERB),
    },
    {
        key = "alchemy",
        name = "Alchemy",
        description = "Potions, elixirs, and flasks. Herbs remain in Herbs.",
        evidence = "Consumable subclass",
        examples = { "Crystal Vial", "Flask of the Winds" },
        matches = function(item)
            return item.classID == CLASS.CONSUMABLE
                and (
                    item.subclassID == CONSUMABLE.POTION
                    or item.subclassID == CONSUMABLE.ELIXIR
                    or item.subclassID == CONSUMABLE.FLASK
                )
                or item.classID == CLASS.RECIPE
                    and item.subclassID == RECIPE.ALCHEMY
        end,
    },
    {
        key = "jewels",
        name = "Jewels",
        description = "Cut and uncut gems plus Jewelcrafting trade goods.",
        evidence = "Item or Trade Goods class",
        examples = { "Tigerseye", "Bold Carnelian" },
        matches = function(item)
            return item.classID == CLASS.GEM
                or item.classID == CLASS.TRADEGOODS
                    and item.subclassID == TRADEGOODS.JEWELCRAFTING
                or item.classID == CLASS.RECIPE
                    and item.subclassID == RECIPE.JEWELCRAFTING
        end,
    },
    {
        key = "ore",
        name = "Ore, Bars & Stone",
        description = "Ore, bars, and stone; the game stores these in one material subclass.",
        evidence = "Trade Goods subclass",
        examples = { "Copper Ore", "Ghost Iron Bar" },
        matches = tradegoodsIs(TRADEGOODS.METAL_AND_STONE),
    },
    {
        key = "blacksmithing",
        name = "Blacksmithing",
        description = "Plans, sharpening stones, weightstones, flux, keys, and other non-equipment products. Armor and weapons stay in their own categories.",
        evidence = "Recipe and generated profession data",
        examples = { "Plans: Copper Chain Vest", "Rough Sharpening Stone" },
        matches = recipeIs(RECIPE.BLACKSMITHING),
    },
    {
        key = "inscription",
        name = "Inscription",
        description = "Pigments, inks, glyphs, scrolls, parchment, and techniques.",
        evidence = "Glyph, recipe, and generated profession data",
        examples = { "Light Parchment", "Ink of Dreams" },
        matches = function(item)
            return item.classID == CLASS.GLYPH
                or item.classID == CLASS.RECIPE
                    and item.subclassID == RECIPE.INSCRIPTION
        end,
    },
    {
        key = "leather",
        name = "Leather",
        description = "Leather, hides, and related raw leatherworking materials.",
        evidence = "Trade Goods subclass",
        examples = { "Light Leather", "Exotic Leather" },
        matches = tradegoodsIs(TRADEGOODS.LEATHER),
    },
    {
        key = "engineering",
        name = "Engineering",
        description = "Parts, explosives, devices, scopes, schematics, and other Engineering products. Equipment stays in Armor or Weapons.",
        evidence = "Item metadata and generated profession data",
        examples = { "Handful of Copper Bolts", "Ghost Iron Dragonling" },
        matches = function(item)
            return item.classID == CLASS.TRADEGOODS
                    and item.subclassID >= 1
                    and item.subclassID <= 3
                or item.classID == CLASS.RECIPE
                    and item.subclassID == RECIPE.ENGINEERING
        end,
    },
    {
        key = "tailoring",
        name = "Tailoring",
        description = "Patterns, dyes, nets, and other Tailoring supplies or products. Raw cloth and bags stay in their own categories.",
        evidence = "Recipe and generated profession data",
        examples = { "Red Dye", "Bolt of Embersilk Cloth" },
        matches = recipeIs(RECIPE.TAILORING),
    },
    {
        key = "leatherworking",
        name = "Leatherworking",
        description = "Patterns, drums, kits, and other Leatherworking supplies or products. Raw leather and armor stay in their own categories.",
        evidence = "Recipe and generated profession data",
        examples = { "Drums of Speed", "Heavy Armor Kit" },
        matches = recipeIs(RECIPE.LEATHERWORKING),
    },
    {
        key = "first_aid",
        name = "First Aid",
        description = "Bandages, anti-venoms, venom sacs, and First Aid manuals.",
        evidence = "Item metadata and generated profession data",
        examples = { "Heavy Linen Bandage", "Manual: Heavy Frostweave Bandage" },
        matches = function(item)
            return item.classID == CLASS.CONSUMABLE
                    and item.subclassID == CONSUMABLE.BANDAGE
                or item.classID == CLASS.RECIPE
                    and item.subclassID == RECIPE.FIRST_AID
        end,
    },
    {
        key = "profession_supplies",
        name = "Shared Crafting Reagents",
        description = "Crafting reagents with no single defensible profession owner, including Crystal Vials, dyes, and raid crafting reagents.",
        evidence = "Generated multi-profession recipe data",
        examples = { "Crystal Vial", "Chaos Orb" },
        matches = function()
            return false
        end,
    },
    {
        key = "archaeology",
        name = "Archaeology",
        description = "Bankable Archaeology keystones, including tablets, rune stones, scrolls, pottery shards, statue pieces, and amber slivers. Archaeology fragment currencies are not bag items.",
        evidence = "Generated MoP archaeology item data",
        examples = { "Pandaren Pottery Shard", "Highborne Scroll" },
        matches = function()
            return false
        end,
    },
}

local categoryByKey = {}
for _, category in ipairs(categories) do
    categoryByKey[category.key] = category
end

local expansions = {
    { id = 0, name = "Classic", shortName = "Classic" },
    { id = 1, name = "The Burning Crusade", shortName = "TBC" },
    { id = 2, name = "Wrath of the Lich King", shortName = "Wrath" },
    { id = 3, name = "Cataclysm", shortName = "Cata" },
    { id = 4, name = "Mists of Pandaria", shortName = "Mists" },
}

local expansionItemOverrides = {
    -- MoP enchanting materials. Some Classic-client item-info cache states
    -- omit expacID even though class/subclass data is already available.
    [74247] = 4, -- Ethereal Shard
    [74248] = 4, -- Sha Crystal
    [74249] = 4, -- Spirit Dust
    [74250] = 4, -- Mysterious Essence
}

function GBO:GetDepositCategoryCatalog()
    return categories
end

function GBO:GetDepositCategoryName(key)
    local category = categoryByKey[key]
    return category and category.name or tostring(key)
end

function GBO:GetDepositCategory(key)
    return categoryByKey[key]
end

function GBO:DescribeProfessionReference(itemID)
    local record = self:GetProfessionReferenceItem(itemID)
    if not record then
        return nil
    end

    local reference = {}
    for key, value in pairs(record) do
        reference[key] = value
    end
    reference.categoryName = reference.categoryKey
        and self:GetDepositCategoryName(reference.categoryKey)
        or nil
    reference.expansionID, reference.expansionEvidence =
        self:ResolveDepositExpansion(reference.itemID, nil, nil)
    reference.expansionName = reference.expansionID ~= nil
        and self:GetDepositExpansionName(reference.expansionID)
        or nil
    reference.exactTabs = self:GetExactDepositProfileTabs(reference.itemID)
    return reference
end

function GBO:ClassifyDepositItem(item)
    if not item then
        return nil
    end
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
    local familyCategory = specializedBagCategory(item)
    if familyCategory then
        return familyCategory, "specialized bag family"
    end
    return nil
end

function GBO:IsUnclassifiedDepositMaterial(item)
    if not item or item.categoryKey or item.categoryEvidence then
        return false
    end
    return item.classID == CLASS.TRADEGOODS
        or item.classID == CLASS.GEM
        or item.classID == CLASS.ITEM_ENHANCEMENT
        or item.classID == CLASS.GLYPH
        or item.classID == CLASS.RECIPE
        or item.classID == CLASS.CONSUMABLE
            and item.subclassID >= CONSUMABLE.POTION
            and item.subclassID <= CONSUMABLE.BANDAGE
end

function GBO:GetDepositExpansionCatalog()
    return expansions
end

function GBO:GetDepositExpansionName(expansionID)
    for _, expansion in ipairs(expansions) do
        if expansion.id == expansionID then
            return expansion.name
        end
    end
    return "Expansion " .. tostring(expansionID or "?")
end

function GBO:ResolveDepositExpansion(
    itemID,
    apiExpansionID,
    classID
)
    itemID = tonumber(itemID)
    local override = expansionItemOverrides[itemID]
    if override ~= nil then
        return override, "curated item ID"
    end

    apiExpansionID = tonumber(apiExpansionID)
    local maximumExpansionID = expansions[#expansions].id
    local supportedAPIExpansion = apiExpansionID ~= nil
        and apiExpansionID >= 0
        and apiExpansionID <= maximumExpansionID

    -- The MoP Classic client commonly exposes expansionID=254 for every item,
    -- and some cache states expose 0 for post-Classic items. Resolve those
    -- values from first appearance in Blizzard's Classic client Item DB2 data.
    -- The generated table stores only the places where compact item-ID era
    -- thresholds overlap, so this remains accurate for equipment as well as
    -- profession materials without bundling a full item database.
    if itemID and (not supportedAPIExpansion or apiExpansionID == 0) then
        local generated = self.GetGeneratedDepositExpansion
            and self:GetGeneratedDepositExpansion(itemID)
        if generated ~= nil then
            return generated, "Classic client item-era data"
        elseif itemID >= 72000 then
            return 4, "Classic item-era fallback"
        elseif itemID >= 52000 then
            return 3, "Classic item-era fallback"
        elseif itemID >= 33000 then
            return 2, "Classic item-era fallback"
        elseif itemID >= 21800 then
            return 1, "Classic item-era fallback"
        end
        return 0, "Classic item-era fallback"
    end
    if supportedAPIExpansion then
        return apiExpansionID, "item API"
    end
    return nil, "unavailable"
end
