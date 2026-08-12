-- Minimal off-client smoke test for the diagnostic lifecycle.
-- Run with a Lua 5.1+ interpreter from the repository root:
--   lua tests/smoke.lua

local addonName = "GuildBankOrganizer"
local addon = {}
local currentTime = 0
local serverTime = 100000
local timers = {}
local frames = {}
local cursor
local cursorOrigin
local inCombat = false
local dropNextGuildBankDeposit = false
local numGuildBankTabs = 1
local currentGuildBankTab = 1

local itemDatabase = {
    [100] = { name = "Poor Widget", quality = 0, itemLevel = 1, maxStack = 20, sellPrice = 1, classID = 7, subclassID = 2 },
    [200] = { name = "Blue Widget", quality = 3, itemLevel = 10, maxStack = 20, sellPrice = 10, classID = 7, subclassID = 1 },
    [300] = { name = "Green Widget", quality = 2, itemLevel = 5, maxStack = 20, sellPrice = 5, classID = 7, subclassID = 1 },
    [72988] = { name = "Windwool Cloth", quality = 1, itemLevel = 1, maxStack = 20, sellPrice = 1, classID = 7, subclassID = 5, expansionID = 254 },
    [500] = { name = "Test Dust", quality = 1, itemLevel = 1, maxStack = 20, sellPrice = 1, classID = 7, subclassID = 12 },
    [74249] = { name = "Spirit Dust", quality = 1, itemLevel = 1, maxStack = 20, sellPrice = 1, classID = 7, subclassID = 12, expansionID = 0 },
    [79251] = { name = "Shadow Pigment", quality = 1, itemLevel = 86, maxStack = 20, sellPrice = 1, classID = 7, subclassID = 11, bagFamily = 16, expansionID = 254 },
    [79254] = { name = "Ink of Dreams", quality = 1, itemLevel = 85, maxStack = 20, sellPrice = 1, classID = 7, subclassID = 1, bagFamily = 16, expansionID = 254 },
    [4359] = { name = "Handful of Copper Bolts", quality = 1, itemLevel = 10, maxStack = 20, sellPrice = 1, classID = 7, subclassID = 1, bagFamily = 128, expansionID = 0 },
    [2581] = { name = "Heavy Linen Bandage", quality = 1, itemLevel = 20, maxStack = 20, sellPrice = 1, classID = 0, subclassID = 7, expansionID = 0 },
    [4408] = { name = "Schematic: Mechanical Squirrel Box", quality = 1, itemLevel = 15, maxStack = 1, sellPrice = 1, classID = 9, subclassID = 3, bagFamily = 128, expansionID = 0 },
    [3371] = { name = "Crystal Vial", quality = 1, itemLevel = 5, maxStack = 20, sellPrice = 1, classID = 7, subclassID = 11, bagFamily = 16, expansionID = 0 },
    [79868] = { name = "Pandaren Pottery Shard", quality = 1, itemLevel = 1, maxStack = 20, sellPrice = 1, classID = 7, subclassID = 11, expansionID = 254 },
    [83064] = { name = "Spinefish", quality = 1, itemLevel = 1, maxStack = 20, sellPrice = 1, classID = 7, subclassID = 11 },
    [103641] = { name = "Singing Crystal", quality = 1, itemLevel = 1, maxStack = 20, sellPrice = 1, classID = 0, subclassID = 5 },
    [109999] = { name = "Unclassified Material", quality = 1, itemLevel = 1, maxStack = 20, sellPrice = 1, classID = 7, subclassID = 11 },
    [12345] = { name = "Test Item", quality = 2, itemLevel = 1, maxStack = 20, sellPrice = 1, classID = 7, subclassID = 9 },
}

local function itemLink(itemID)
    return string.format(
        "|cff1eff00|Hitem:%d:0:0:0:0:0:0:0|h[%s]|h|r",
        itemID,
        itemDatabase[itemID].name
    )
end

local function makeItem(itemID, count)
    return {
        itemID = itemID,
        link = itemLink(itemID),
        count = count,
        texture = itemID,
    }
end

local slots = {
    [1] = {
        [1] = makeItem(12345, 20),
    },
}
local bags = {
    [0] = {},
    [1] = {},
    [2] = {},
    [3] = {},
    [4] = {},
}

local function fire(event, ...)
    for _, frame in ipairs(frames) do
        if frame.events[event] and frame.scripts.OnEvent then
            frame.scripts.OnEvent(frame, event, ...)
        end
    end
end

local function runTimers()
    local fired = 0
    while #timers > 0 do
        table.sort(timers, function(left, right)
            return left.at < right.at
        end)
        local timer = table.remove(timers, 1)
        currentTime = timer.at
        timer.callback()
        fired = fired + 1
        assert(fired < 1000, "timer loop did not converge")
    end
end

local function runNextTimer()
    table.sort(timers, function(left, right)
        return left.at < right.at
    end)
    local timer = table.remove(timers, 1)
    assert(timer, "expected a pending timer")
    currentTime = timer.at
    timer.callback()
end

MAX_GUILDBANK_SLOTS_PER_TAB = 98
NUM_BAG_SLOTS = 4
UIParent = {}
ChatFontNormal = {}
SlashCmdList = {}
GuildBankOrganizerDB = nil
Enum = {
    ItemClass = {
        Consumable = 0,
        Container = 1,
        Weapon = 2,
        Gem = 3,
        Armor = 4,
        Tradegoods = 7,
        ItemEnhancement = 8,
        Miscellaneous = 15,
        Glyph = 16,
        Battlepet = 17,
    },
    PlayerInteractionType = {
        GuildBanker = 10,
    },
}

DEFAULT_CHAT_FRAME = {
    AddMessage = function() end,
}

C_AddOns = {
    GetAddOnMetadata = function(_, key)
        if key == "Version" then
            return "1.0.0-test"
        end
    end,
}

C_Timer = {
    After = function(delay, callback)
        table.insert(timers, {
            at = currentTime + delay,
            callback = callback,
        })
    end,
}

local function addWidgetMethods(widget)
    widget.shown = true
    widget.enabled = true
    widget.text = ""
    widget.scripts = widget.scripts or {}

    function widget:SetSize() end
    function widget:SetPoint() end
    function widget:SetAllPoints() end
    function widget:SetFrameStrata() end
    function widget:SetMovable() end
    function widget:EnableMouse() end
    function widget:RegisterForDrag() end
    function widget:SetClampedToScreen() end
    function widget:SetAutoFocus() end
    function widget:SetJustifyH() end
    function widget:ClearFocus() end
    function widget:SetMultiLine() end
    function widget:SetFontObject() end
    function widget:SetNormalFontObject() end
    function widget:SetTextColor() end
    function widget:SetWidth() end
    function widget:SetHeight() end
    function widget:SetTexture() end
    function widget:SetColorTexture() end
    function widget:SetMinMaxValues(minimum, maximum)
        self.minimum = minimum
        self.maximum = maximum
    end
    function widget:SetValue(value)
        self.value = value
    end
    function widget:SetStatusBarTexture() end
    function widget:SetTextInsets() end
    function widget:SetCursorPosition() end
    function widget:SetScrollChild() end
    function widget:UpdateScrollChildRect() end
    function widget:StartMoving() end
    function widget:StopMovingOrSizing() end
    function widget:Enable()
        self.enabled = true
    end
    function widget:Disable()
        self.enabled = false
        if self.scripts.OnDisable then
            self.scripts.OnDisable(self)
        end
    end
    function widget:IsEnabled()
        return self.enabled
    end
    function widget:SetText(text)
        self.text = tostring(text or "")
        if self.scripts.OnTextChanged then
            self.scripts.OnTextChanged(self)
        end
    end
    function widget:GetText()
        return self.text
    end
    function widget:GetNumLines()
        local _, newlines = string.gsub(self.text, "\n", "\n")
        return newlines + 1
    end
    function widget:SetScript(script, callback)
        self.scripts[script] = callback
    end
    function widget:SetChecked(checked)
        self.checked = checked and true or false
    end
    function widget:GetChecked()
        return self.checked
    end
    function widget:Show()
        local wasShown = self.shown
        self.shown = true
        if not wasShown and self.scripts.OnShow then
            self.scripts.OnShow(self)
        end
    end
    function widget:Hide()
        local wasShown = self.shown
        self.shown = false
        if wasShown and self.scripts.OnHide then
            self.scripts.OnHide(self)
        end
    end
    function widget:IsShown()
        return self.shown
    end
    function widget:CreateFontString()
        return addWidgetMethods({})
    end
    function widget:CreateTexture()
        return addWidgetMethods({})
    end

    return widget
end

function CreateFrame(_, name)
    local frame = {
        events = {},
        scripts = {},
    }
    addWidgetMethods(frame)
    function frame:RegisterEvent(event)
        self.events[event] = true
    end
    if name then
        _G[name] = frame
    end
    table.insert(frames, frame)
    return frame
end

function GetTime()
    return currentTime
end

function GetServerTime()
    return serverTime + math.floor(currentTime)
end

function GetBuildInfo()
    return "5.5.4", "68806", "Jul 2026", 50504
end

function GetRealmName()
    return "Test Realm"
end

function GetGuildInfo()
    return "Test Guild"
end

function UnitName()
    return "Tester"
end

function GetNetStats()
    return 0, 0, 20, 30
end

function InCombatLockdown()
    return inCombat
end

function geterrorhandler()
    return function(message)
        error(message)
    end
end

function GetNumGuildBankTabs()
    return numGuildBankTabs
end

function GetCurrentGuildBankTab()
    return currentGuildBankTab
end

function GetGuildBankTabInfo(tab)
    assert(tab >= 1 and tab <= numGuildBankTabs)
    return tab == 1 and "Test" or "Second", 1, true, true, -1, -1, false
end

function QueryGuildBankTab(tab)
    assert(tab >= 1 and tab <= numGuildBankTabs)
    fire("GUILDBANKBAGSLOTS_CHANGED")
end

function GetGuildBankItemInfo(tab, slot)
    local item = slots[tab] and slots[tab][slot]
    if not item then
        return nil, 0, nil, false, nil
    end
    return item.texture, item.count, item.locked, false, 2
end

function GetGuildBankItemLink(tab, slot)
    local item = slots[tab] and slots[tab][slot]
    return item and item.link
end

function GetCursorInfo()
    if cursor then
        return "item", cursor.itemID
    end
end

function PickupGuildBankItem(tab, slot)
    slots[tab] = slots[tab] or {}
    if not cursor then
        cursor = slots[tab][slot]
        if not cursor then
            return
        end
        cursorOrigin = { tab = tab, slot = slot }
        slots[tab][slot] = nil
    else
        if dropNextGuildBankDeposit and cursorOrigin.bag then
            dropNextGuildBankDeposit = false
            local original = bags[cursorOrigin.bag][cursorOrigin.slot]
            if original and original.itemID == cursor.itemID then
                original.count = original.count + cursor.count
            else
                bags[cursorOrigin.bag][cursorOrigin.slot] = cursor
            end
            cursor = nil
            cursorOrigin = nil
            fire("GUILDBANKBAGSLOTS_CHANGED")
            fire("BAG_UPDATE_DELAYED")
            return
        end
        local target = slots[tab][slot]
        if target and target.itemID == cursor.itemID then
            local maxStack = itemDatabase[cursor.itemID].maxStack
            assert(target.count + cursor.count <= maxStack, "overflow should use SplitGuildBankItem")
            target.count = target.count + cursor.count
        elseif target then
            slots[tab][slot] = cursor
            if cursorOrigin.tab then
                slots[cursorOrigin.tab][cursorOrigin.slot] = target
            else
                bags[cursorOrigin.bag][cursorOrigin.slot] = target
            end
        else
            slots[tab][slot] = cursor
        end
        cursor = nil
        cursorOrigin = nil
    end
    fire("GUILDBANK_ITEM_LOCK_CHANGED")
    fire("GUILDBANKBAGSLOTS_CHANGED")
    fire("BAG_UPDATE_DELAYED")
end

function SplitGuildBankItem(tab, slot, amount)
    local source = assert(slots[tab] and slots[tab][slot], "split source must exist")
    assert(amount > 0 and amount < source.count, "split amount must be partial")
    source.count = source.count - amount
    cursor = makeItem(source.itemID, amount)
    cursorOrigin = { tab = tab, slot = slot, split = true }
    fire("GUILDBANK_ITEM_LOCK_CHANGED")
    fire("GUILDBANKBAGSLOTS_CHANGED")
end

function ClearCursor()
    if cursor and cursorOrigin then
        local origin = cursorOrigin.tab
            and slots[cursorOrigin.tab][cursorOrigin.slot]
            or bags[cursorOrigin.bag][cursorOrigin.slot]
        if origin and origin.itemID == cursor.itemID then
            origin.count = origin.count + cursor.count
        elseif cursorOrigin.tab then
            slots[cursorOrigin.tab][cursorOrigin.slot] = cursor
        else
            bags[cursorOrigin.bag][cursorOrigin.slot] = cursor
        end
    end
    cursor = nil
    cursorOrigin = nil
end

function GetItemInfo(item)
    local itemID = tonumber(item)
    if not itemID and type(item) == "string" then
        itemID = tonumber(string.match(item, "item:(%d+)"))
    end
    local info = itemDatabase[itemID]
    if not info then
        return nil
    end
    local expansionID
    if not info.omitExpansion then
        expansionID = info.expansionID or 4
    end
    return info.name,
        itemLink(itemID),
        info.quality,
        info.itemLevel,
        1,
        "Test Class",
        "Test Subclass",
        info.maxStack,
        "",
        info.texture or itemID,
        info.sellPrice,
        info.classID,
        info.subclassID,
        nil,
        expansionID
end

C_Item = {
    GetItemInfo = GetItemInfo,
    GetItemFamily = function(item)
        local itemID = tonumber(item)
        if not itemID and type(item) == "string" then
            itemID = tonumber(string.match(item, "item:(%d+)"))
        end
        local info = itemDatabase[itemID]
        return info and info.bagFamily or 0
    end,
    GetItemInfoInstant = function(item)
        local itemID = tonumber(item)
        if not itemID and type(item) == "string" then
            itemID = tonumber(string.match(item, "item:(%d+)"))
        end
        local info = itemDatabase[itemID]
        if not info then
            return nil
        end
        return itemID,
            "Trade Goods",
            "Test Subclass",
            "",
            itemID,
            info.classID,
            info.subclassID
    end,
    GetItemSubClassInfo = function(classID, subclassID)
        if classID ~= 7 then
            return nil
        end
        local names = {
            [5] = "Cloth",
            [7] = "Metal & Stone",
            [9] = "Herbs",
            [12] = "Enchanting",
        }
        return names[subclassID]
    end,
}

C_Container = {
    GetContainerNumSlots = function(bag)
        return bag == 0 and 16 or 0
    end,
    GetContainerItemInfo = function(bag, slot)
        local item = bags[bag] and bags[bag][slot]
        if not item then
            return nil
        end
        return {
            iconFileID = item.texture,
            stackCount = item.count,
            isLocked = item.locked,
            quality = 1,
            hyperlink = item.link,
            itemID = item.itemID,
            isBound = item.bound,
        }
    end,
    PickupContainerItem = function(bag, slot)
        if cursor then
            return
        end
        cursor = bags[bag] and bags[bag][slot]
        if not cursor then
            return
        end
        cursorOrigin = { bag = bag, slot = slot }
        bags[bag][slot] = nil
        fire("BAG_UPDATE_DELAYED")
    end,
    SplitContainerItem = function(bag, slot, amount)
        local source = assert(bags[bag] and bags[bag][slot])
        assert(amount > 0 and amount < source.count)
        source.count = source.count - amount
        cursor = makeItem(source.itemID, amount)
        cursorOrigin = { bag = bag, slot = slot, split = true }
        fire("BAG_UPDATE_DELAYED")
    end,
}

local function loadAddonFile(path)
    local chunk, err = loadfile(path)
    assert(chunk, err)
    return chunk(addonName, addon)
end

loadAddonFile("GuildBankOrganizer/Core.lua")
loadAddonFile("GuildBankOrganizer/ExpansionData.lua")
loadAddonFile("GuildBankOrganizer/ProfessionData.lua")
loadAddonFile("GuildBankOrganizer/Categories.lua")
loadAddonFile("GuildBankOrganizer/Scanner.lua")
loadAddonFile("GuildBankOrganizer/Diagnostics.lua")
loadAddonFile("GuildBankOrganizer/Sorter.lua")
loadAddonFile("GuildBankOrganizer/Depositor.lua")
loadAddonFile("GuildBankOrganizer/UI.lua")
loadAddonFile("GuildBankOrganizer/Commands.lua")

assert(type(addon.ShowTestUI) == "function")
assert(addon:ClassifyDepositItem({
    itemID = 72988,
    classID = 7,
    subclassID = 5,
}) == "cloth")
assert(addon:ClassifyDepositItem({
    itemID = 999,
    classID = 4,
    subclassID = 0,
    equipLoc = "INVTYPE_TRINKET",
}) == "trinkets")
assert(addon:ClassifyDepositItem({
    itemID = 88567,
    classID = 15,
    subclassID = 0,
}) == "lockboxes")
local spinefishCategory, spinefishEvidence = addon:ClassifyDepositItem({
    itemID = 83064,
    classID = 7,
    subclassID = 11,
})
assert(spinefishCategory == "fish")
assert(spinefishEvidence == "curated item ID")
assert(addon:ClassifyDepositItem({
    itemID = 103641,
    classID = 0,
    subclassID = 5,
}) == nil)
local vellumCategory, vellumEvidence = addon:ClassifyDepositItem({
    itemID = 38682,
    classID = 7,
    subclassID = 14,
})
assert(vellumCategory == "enchanting")
assert(vellumEvidence == "curated item ID")
local pigmentCategory, pigmentEvidence = addon:ClassifyDepositItem({
    itemID = 79251,
    classID = 7,
    subclassID = 11,
    bagFamily = 16,
})
assert(pigmentCategory == "inscription")
assert(pigmentEvidence == "MoP profession item data")
local inkCategory = addon:ClassifyDepositItem({
    itemID = 79254,
    classID = 7,
    subclassID = 1,
    bagFamily = 16,
})
assert(inkCategory == "inscription")
local boltsCategory = addon:ClassifyDepositItem({
    itemID = 4359,
    classID = 7,
    subclassID = 1,
    bagFamily = 128,
})
assert(boltsCategory == "engineering")
assert(addon:ClassifyDepositItem({
    itemID = 2581,
    classID = 0,
    subclassID = 7,
}) == "first_aid")
assert(addon:ClassifyDepositItem({
    itemID = 4408,
    classID = 9,
    subclassID = 3,
    bagFamily = 128,
}) == "engineering")
assert(addon:ClassifyDepositItem({
    itemID = 3371,
    classID = 7,
    subclassID = 11,
    bagFamily = 16,
}) == "alchemy")
assert(addon:ClassifyDepositItem({
    itemID = 79868,
    classID = 7,
    subclassID = 11,
}) == "archaeology")
local professionCoverage = addon:GetProfessionCoverageSummary()
assert(professionCoverage.sourceBuild == "5.5.4.68806")
assert(professionCoverage.eligibleItems > 8000)
assert(professionCoverage.generatedItems > 600)
assert(professionCoverage.unclassifiedItems == 0)
bags[0][16] = makeItem(79251, 2)
local shadowPigmentSlot = addon:ReadDepositBagSlot(0, 16)
assert(shadowPigmentSlot.bagFamily == 16)
assert(shadowPigmentSlot.categoryKey == "inscription")
assert(shadowPigmentSlot.categoryEvidence == "MoP profession item data")
bags[0][16] = nil
local futurePigmentCategory, futurePigmentEvidence = addon:ClassifyDepositItem({
    itemID = 999999,
    classID = 7,
    subclassID = 11,
    bagFamily = 16,
})
assert(futurePigmentCategory == "inscription")
assert(futurePigmentEvidence == "specialized bag family")
assert(addon:ClassifyDepositItem({
    itemID = 999998,
    classID = 1,
    subclassID = 0,
    bagFamily = 16,
}) == "bags")
assert(addon:ClassifyDepositItem({
    itemID = 999997,
    classID = 4,
    subclassID = 1,
    bagFamily = 128,
}) == "armor")
assert(addon:GetGeneratedProfessionCategory(72988) == nil)
assert(addon:GetGeneratedProfessionCategory(9210) == "tailoring")
for _, itemID in ipairs({ 1165, 8547, 40677, 67435 }) do
    local record = addon:GetProfessionReferenceItem(itemID)
    assert(record.status == "excluded")
    assert(addon:SearchProfessionReference(tostring(itemID))[1] == record)
    assert(#addon:SearchProfessionReference(record.name) == 0)
end
local spiritDustExpansion, spiritDustEvidence =
    addon:ResolveDepositExpansion(74249, 0, Enum.ItemClass.Tradegoods)
assert(spiritDustExpansion == 4)
assert(spiritDustEvidence == "curated item ID")
local snowLilyExpansion, snowLilyEvidence =
    addon:ResolveDepositExpansion(97622, 0, Enum.ItemClass.Tradegoods)
assert(snowLilyExpansion == 4)
assert(snowLilyEvidence == "Classic item-era fallback")

-- MoP Classic exposes expansionID=254 for item info. Expansion filtering
-- must still work across every public Smart Deposit category, including item
-- IDs near expansion boundaries where a numeric cutoff alone is ambiguous.
local classicSilkExpansion =
    addon:ResolveDepositExpansion(4306, 254, Enum.ItemClass.Tradegoods)
assert(classicSilkExpansion == 0)
local wrathFrostweaveExpansion =
    addon:ResolveDepositExpansion(33470, 254, Enum.ItemClass.Tradegoods)
assert(wrathFrostweaveExpansion == 2)
local cataEmbersilkExpansion =
    addon:ResolveDepositExpansion(53010, 254, Enum.ItemClass.Tradegoods)
assert(cataEmbersilkExpansion == 3)
local mistsWindwoolExpansion =
    addon:ResolveDepositExpansion(72988, 254, Enum.ItemClass.Tradegoods)
assert(mistsWindwoolExpansion == 4)
local tbcFoodExpansion =
    addon:ResolveDepositExpansion(22645, 254, Enum.ItemClass.Consumable)
assert(tbcFoodExpansion == 1)
local classicBoundaryWeaponExpansion =
    addon:ResolveDepositExpansion(21806, 254, Enum.ItemClass.Weapon)
assert(classicBoundaryWeaponExpansion == 0)
local classicBoundaryBagExpansion =
    addon:ResolveDepositExpansion(22248, 254, Enum.ItemClass.Container)
assert(classicBoundaryBagExpansion == 0)
local wrathGlyphExpansion =
    addon:ResolveDepositExpansion(40896, 254, Enum.ItemClass.Glyph)
assert(wrathGlyphExpansion == 2)

GuildBankOrganizerDB = {
    schema = 4,
    settings = {},
    runs = {},
    depositProfiles = {
        ["Test Realm\031Test Guild"] = {
            [2] = {
                enabled = false,
                label = "Affected beta profile",
                categories = { enchanting = true },
                allExpansions = false,
                expansions = { [4] = true },
                exactItemIDs = {},
            },
        },
    },
}
fire("ADDON_LOADED", addonName)
assert(GuildBankOrganizerDB.schema == 5)
assert(addon:GetDepositProfile(2, false).enabled)
addon:GetDepositProfiles(false)[2] = nil
fire("PLAYER_LOGIN")
fire("GUILDBANKFRAME_OPENED")

assert(GuildBankOrganizerFrame:IsShown())
assert(GuildBankOrganizerFrame.DepositCurrentButton:GetText() == "Deposit This Tab")
assert(GuildBankOrganizerFrame.DepositAllButton:GetText() == "Deposit All Tabs")
assert(not GuildBankOrganizerFrame.DepositStopButton:IsShown())
addon:ShowTestUI()
GuildBankOrganizerAdvancedFrame.AutoButton.scripts.OnClick()
runNextTimer()
assert(GuildBankOrganizerAdvancedFrame.SourceInput:GetText() == "1")
assert(GuildBankOrganizerAdvancedFrame.EmptyInput:GetText() == "98")
addon:HideOrganizerUI()
runTimers()

assert(addon:StartScan())
runTimers()
assert(addon.lastScan)
assert(addon.lastScan.tabs[1].occupied == 1)

assert(addon:StartDiagnostic(1, 1, 2, 1.50, 2))
runTimers()

assert(not addon:IsDiagnosticRunning())
assert(addon.lastReport and string.find(addon.lastReport, "result=PASS", 1, true))
assert(slots[1][1] and slots[1][1].count == 20)
assert(slots[1][2] == nil)
assert(GuildBankOrganizerDB and #GuildBankOrganizerDB.runs == 1)
addon:ShowReport()
assert(GuildBankOrganizerReportFrame:IsShown())
GuildBankOrganizerReportFrame:Hide()

-- Stopping after the first (odd) move should perform a conservative corrective
-- move, leave the item home, and record the run as a failure rather than a pass.
assert(addon:StartDiagnostic(1, 1, 2, 5.00, 2))
runNextTimer()
assert(slots[1][1] == nil and slots[1][2])
addon:AbortDiagnostic("smoke stop")
runTimers()

assert(not addon:IsDiagnosticRunning())
assert(addon.lastReport and string.find(addon.lastReport, "result=FAIL", 1, true))
assert(slots[1][1] and slots[1][1].count == 20)
assert(slots[1][2] == nil)
assert(#GuildBankOrganizerDB.runs == 2)

-- ElvUI-style sorting consolidates matching partial stacks, then orders by
-- quality/class/subclass and compacts items into the earliest slots.
slots[1] = {
    [1] = makeItem(100, 20),
    [2] = makeItem(300, 20),
    [5] = makeItem(200, 18),
    [9] = makeItem(200, 7),
}

assert(addon:StartSort(1, 1.25))
local initialProgress
for _ = 1, 10 do
    runNextTimer()
    initialProgress = addon:GetSortProgress()
    if initialProgress and initialProgress.total then
        break
    end
end
assert(initialProgress and initialProgress.total == 5)
assert(initialProgress.completed == 0)
assert(initialProgress.remaining == 5)
assert(initialProgress.etaSeconds > 10)
assert(addon:FormatSortDuration(75.2) == "1m 16s")

local firstConfirmedProgress
for _ = 1, 20 do
    runNextTimer()
    firstConfirmedProgress = addon:GetSortProgress()
    if firstConfirmedProgress and firstConfirmedProgress.completed >= 1 then
        break
    end
end
assert(firstConfirmedProgress.completed == 1)
assert(firstConfirmedProgress.total == 5)
assert(firstConfirmedProgress.remaining == 4)
runTimers()

assert(not addon:IsSortRunning())
assert(addon.lastReport and string.find(addon.lastReport, "Guild Bank Organizer sort report", 1, true))
assert(string.find(addon.lastReport, "result=PASS", 1, true))
assert(string.find(addon.lastReport, "estimated=5", 1, true))
assert(string.find(addon.lastReport, "confirmed=5", 1, true))
assert(slots[1][1] and slots[1][1].itemID == 200 and slots[1][1].count == 5)
assert(slots[1][2] and slots[1][2].itemID == 200 and slots[1][2].count == 20)
assert(slots[1][3] and slots[1][3].itemID == 300)
assert(slots[1][4] and slots[1][4].itemID == 100)
for slot = 5, MAX_GUILDBANK_SLOTS_PER_TAB do
    assert(slots[1][slot] == nil)
end
assert(#GuildBankOrganizerDB.runs == 3)

-- Reverse direction is persisted and produces the inverse public sort order.
GuildBankOrganizerDB.settings.sortInverted = true
assert(addon:StartSort(1, 1.25))
runTimers()
assert(slots[1][1] and slots[1][1].itemID == 100)
assert(slots[1][2] and slots[1][2].itemID == 300)
assert(slots[1][3] and slots[1][3].itemID == 200 and slots[1][3].count == 20)
assert(slots[1][4] and slots[1][4].itemID == 200 and slots[1][4].count == 5)
assert(string.find(addon.lastReport, "direction=reverse", 1, true))
assert(#GuildBankOrganizerDB.runs == 4)

-- Smart Deposit profiles are tab-first and accept multiple item categories.
-- Deposits use a separate confirmation-driven queue instead of the 1.25s
-- intra-bank sort cadence.
slots[1] = {
    [1] = makeItem(72988, 10),
}
bags[0] = {
    [1] = makeItem(72988, 15),
    [2] = makeItem(500, 7),
}

addon:ShowDepositSettingsUI()
local depositSettings = GuildBankOrganizerDepositSettingsFrame
assert(depositSettings.EnabledCheck:GetChecked())
depositSettings.EnabledCheck.scripts.OnClick(depositSettings.EnabledCheck)
assert(not depositSettings.EnabledCheck:GetChecked())
depositSettings.EnabledCheck.scripts.OnClick(depositSettings.EnabledCheck)
assert(depositSettings.EnabledCheck:GetChecked())
depositSettings.EnabledCheck:SetChecked(true)
depositSettings.LabelInput:SetText("Tailoring & Enchanting")
depositSettings.CategoryChecks.cloth:SetChecked(true)
depositSettings.CategoryChecks.enchanting:SetChecked(true)
depositSettings.AllExpansionsCheck:SetChecked(false)
depositSettings.ExpansionChecks[4]:SetChecked(true)
depositSettings.SaveButton.scripts.OnClick()
local savedProfile = addon:GetDepositProfile(1, false)
assert(savedProfile and savedProfile.enabled)
assert(savedProfile.categories.cloth)
assert(savedProfile.categories.enchanting)
assert(not savedProfile.allExpansions)
assert(savedProfile.expansions[4])
numGuildBankTabs = 2
local overlapSaved, overlapMessage = addon:SaveDepositProfile(
    2,
    true,
    "All Cloth",
    { cloth = true },
    true,
    {},
    {}
)
assert(not overlapSaved)
assert(string.find(overlapMessage, "All expansions includes Mists", 1, true))
assert(string.find(overlapMessage, "Tab 1", 1, true))
numGuildBankTabs = 1
bags[0][3] = makeItem(74249, 20)
bags[0][3].locked = true
local lockedSpiritDustInspection = addon:InspectDepositProfile(1)
assert(lockedSpiritDustInspection.lockedItems == 20)
assert(lockedSpiritDustInspection.boundItems == 0)
assert(lockedSpiritDustInspection.matchingItems == 22)
bags[0][3].locked = false
local spiritDustInspection = addon:InspectDepositProfile(1)
assert(spiritDustInspection.matchingItems == 42)
assert(spiritDustInspection.unknownExpansions == 0)
bags[0][3] = nil
bags[0][3] = makeItem(109999, 4)
local unclassifiedInspection = addon:InspectDepositProfile(1)
assert(unclassifiedInspection.unclassifiedItems == 4)
assert(unclassifiedInspection.firstUnclassified.itemID == 109999)
bags[0][3] = nil
addon:HideOrganizerUI()
addon:ShowDepositSettingsUI()
assert(GuildBankOrganizerDepositSettingsFrame.EnabledCheck:GetChecked())
addon:HideOrganizerUI()
runTimers()

-- A current-tab deposit must exclude other configured tabs from both the
-- operation and its reported totals, while the all-tabs preview includes
-- every enabled destination.
numGuildBankTabs = 2
currentGuildBankTab = 1
slots[1] = {
    [1] = makeItem(72988, 10),
}
slots[2] = {}
bags[0] = {
    [1] = makeItem(72988, 15),
    [2] = makeItem(500, 7),
}
assert(addon:SaveDepositProfile(
    1,
    true,
    "Tailoring",
    { cloth = true },
    false,
    { [4] = true },
    {}
))
runTimers()
assert(addon:SaveDepositProfile(
    2,
    true,
    "Enchanting",
    { enchanting = true },
    false,
    { [4] = true },
    {}
))
runTimers()

local tabScope = assert(addon:GetDepositPlanScope(1))
assert(tabScope.totalItems == 15)
assert(tabScope.totalMoves == 2)
assert(tabScope.destinationCount == 1)

local allScope = assert(addon:GetDepositPlanScope())
assert(allScope.totalItems == 22)
assert(allScope.totalMoves == 3)
assert(allScope.destinationCount == 2)

addon:ShowOrganizerUI()
local organizer = GuildBankOrganizerFrame
addon:RefreshOrganizerUI()
assert(string.find(
    organizer.SmartHint:GetText(),
    "This tab: 15 items in 2 deposits",
    1,
    true
))
assert(string.find(
    organizer.SmartHint:GetText(),
    "All configured tabs: 22 items in 3 deposits across 2 tabs",
    1,
    true
))
assert(organizer.DepositCurrentButton:IsEnabled())
assert(organizer.DepositAllButton:IsEnabled())

local originalStartDeposit = addon.StartDeposit
local requestedScopes = {}
addon.StartDeposit = function(_, tab)
    table.insert(requestedScopes, tab or "all")
    return true
end
organizer.DepositCurrentButton.scripts.OnClick()
organizer.DepositAllButton.scripts.OnClick()
addon.StartDeposit = originalStartDeposit
assert(requestedScopes[1] == currentGuildBankTab)
assert(requestedScopes[2] == "all")

currentGuildBankTab = 2
bags[0][2] = nil
assert(addon:RefreshDepositPlan())
organizer:Hide()
runTimers()
addon:RefreshOrganizerUI()
assert(not organizer.DepositCurrentButton:IsEnabled())
assert(organizer.DepositAllButton:IsEnabled())
assert(string.find(
    organizer.SmartHint:GetText(),
    "This tab: No matching items",
    1,
    true
))

currentGuildBankTab = 1
bags[0][2] = makeItem(500, 7)
assert(addon:RefreshDepositPlan())
runTimers()
addon:RefreshOrganizerUI()
assert(organizer.DepositCurrentButton:IsEnabled())
assert(organizer.DepositAllButton:IsEnabled())
assert(GuildBankOrganizerDB.settings.depositScope == nil)

assert(addon:StartDeposit(1))
addon:RefreshOrganizerUI()
assert(not organizer.DepositCurrentButton:IsShown())
assert(not organizer.DepositAllButton:IsShown())
assert(organizer.DepositStopButton:IsShown())
runTimers()
addon:RefreshOrganizerUI()
assert(organizer.DepositCurrentButton:IsShown())
assert(organizer.DepositAllButton:IsShown())
assert(not organizer.DepositStopButton:IsShown())
assert(bags[0][1] == nil)
assert(bags[0][2] and bags[0][2].itemID == 500)
assert(string.find(addon.lastReport, "planned=2", 1, true))
assert(string.find(addon.lastReport, "items=15", 1, true))

-- Restore the original one-tab fixture for the full Smart Deposit lifecycle.
numGuildBankTabs = 1
currentGuildBankTab = 1
addon:GetDepositProfiles(false)[2] = nil
slots[1] = {
    [1] = makeItem(72988, 10),
}
bags[0] = {
    [1] = makeItem(72988, 15),
    [2] = makeItem(500, 7),
}
assert(addon:SaveDepositProfile(
    1,
    true,
    "Tailoring & Enchanting",
    { cloth = true, enchanting = true },
    false,
    { [4] = true },
    {}
))
runTimers()

local depositPlan = addon:GetDepositPlan()
assert(depositPlan and depositPlan.totalMoves == 3)
assert(depositPlan.totalItems == 22)
dropNextGuildBankDeposit = true
assert(addon:StartDeposit())
runTimers()

assert(not addon:IsDepositRunning())
assert(bags[0][1] == nil and bags[0][2] == nil)
assert(slots[1][1] and slots[1][1].itemID == 72988 and slots[1][1].count == 20)
assert(slots[1][2] and slots[1][2].itemID == 72988 and slots[1][2].count == 5)
assert(slots[1][3] and slots[1][3].itemID == 500 and slots[1][3].count == 7)
assert(string.find(addon.lastReport, "smart deposit report", 1, true))
assert(string.find(addon.lastReport, "result=PASS", 1, true))
assert(string.find(addon.lastReport, "confirmed=3", 1, true))
assert(string.find(addon.lastReport, "retries=1", 1, true))
assert(#GuildBankOrganizerDB.runs == 6)
assert(GuildBankOrganizerDB.runs[1].type == "deposit")
assert(GuildBankOrganizerDB.runs[1].averageMoveSeconds < 0.20)

-- Public safety settings: combat blocks a new sort, and disabling auto-open
-- keeps the compact panel closed on the next bank visit.
inCombat = true
assert(not addon:StartSort(1, 1.25))
inCombat = false
GuildBankOrganizerDB.settings.autoOpen = false
fire("GUILDBANKFRAME_CLOSED")
fire("GUILDBANKFRAME_OPENED")
assert(not GuildBankOrganizerFrame:IsShown())
GuildBankOrganizerDB.settings.autoOpen = true
fire("PLAYER_INTERACTION_MANAGER_FRAME_SHOW", Enum.PlayerInteractionType.GuildBanker)
assert(addon:IsBankOpen())
assert(GuildBankOrganizerFrame:IsShown())
numGuildBankTabs = 2
currentGuildBankTab = 2
slots[2] = {}
addon:ShowDepositSettingsUI()
fire("GUILDBANKBAGSLOTS_CHANGED")
assert(GuildBankOrganizerDepositSettingsFrame.TabInput:GetText() == "2")
currentGuildBankTab = 1
numGuildBankTabs = 1
fire("PLAYER_INTERACTION_MANAGER_FRAME_HIDE", Enum.PlayerInteractionType.GuildBanker)
assert(not addon:IsBankOpen())
assert(not GuildBankOrganizerFrame:IsShown())

print("smoke test passed")
