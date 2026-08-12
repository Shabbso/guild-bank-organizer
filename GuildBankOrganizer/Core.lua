local ADDON_NAME, GBO = ...

_G.GuildBankOrganizer = GBO

GBO.name = ADDON_NAME
GBO.MAX_SLOTS = MAX_GUILDBANK_SLOTS_PER_TAB or 98
GBO.defaults = {
    cadence = 1.25,
    moves = 10,
    settleDelay = 3.5,
    operationTimeout = 5.0,
    scanQueryTimeout = 3.0,
    scanTabDelay = 0.5,
    maxTimelineEntries = 500,
    sortMinimumCadence = 1.25,
    sortFailureBackoff = 4.0,
    sortMaxMoves = 500,
    depositPollInterval = 0.05,
    depositQuietPeriod = 0.15,
    depositRetryDelay = 0.75,
    depositMaxRetries = 1,
    depositPlanTabDelay = 0.35,
    depositFinalDelay = 0.50,
    depositMaxMoves = 500,
}

local metadata = (C_AddOns and C_AddOns.GetAddOnMetadata) or GetAddOnMetadata
GBO.version = metadata and metadata(ADDON_NAME, "Version") or "dev"

local eventFrame = CreateFrame("Frame")
local listeners = {}

local function reportHandlerError(event, err)
    local handler = geterrorhandler and geterrorhandler()
    if handler then
        handler(string.format("%s event handler failed for %s: %s", ADDON_NAME, event, tostring(err)))
    end
end

function GBO:On(event, callback)
    if not listeners[event] then
        listeners[event] = {}
        eventFrame:RegisterEvent(event)
    end
    table.insert(listeners[event], callback)
end

function GBO:Print(message)
    DEFAULT_CHAT_FRAME:AddMessage("|cff61d7ffGBO:|r " .. tostring(message))
end

function GBO:IsBankOpen()
    if self.bankOpen ~= nil then
        return self.bankOpen
    end
    return GuildBankFrame and GuildBankFrame:IsShown() or false
end

function GBO:IsGuildBankInteraction(interactionType)
    return Enum
        and Enum.PlayerInteractionType
        and interactionType == Enum.PlayerInteractionType.GuildBanker
end

function GBO:GetCursorType()
    local cursorType = GetCursorInfo()
    return cursorType
end

function GBO:GetItemID(itemLink)
    if not itemLink then
        return nil
    end
    return tonumber(string.match(itemLink, "item:(%d+)"))
end

function GBO:ReadSlot(tab, slot)
    local texture, count, locked, filtered, quality = GetGuildBankItemInfo(tab, slot)
    local link = GetGuildBankItemLink(tab, slot)
    return {
        tab = tab,
        slot = slot,
        link = link,
        itemID = self:GetItemID(link),
        texture = texture,
        count = link and (count or 1) or 0,
        locked = locked and true or false,
        filtered = filtered and true or false,
        quality = quality,
    }
end

function GBO:IsEmpty(slot)
    return not slot or slot.link == nil
end

function GBO:SameStack(left, right)
    if self:IsEmpty(left) or self:IsEmpty(right) then
        return self:IsEmpty(left) and self:IsEmpty(right)
    end
    return left.link == right.link and left.count == right.count
end

function GBO:MatchesTrackedItem(slot, tracked)
    if self:IsEmpty(slot) or not tracked then
        return false
    end
    return slot.link == tracked.link and slot.count == tracked.count
end

function GBO:DescribeSlot(slot)
    if self:IsEmpty(slot) then
        return string.format("T%d/S%d empty", slot and slot.tab or 0, slot and slot.slot or 0)
    end
    return string.format(
        "T%d/S%d item:%s x%d%s",
        slot.tab or 0,
        slot.slot or 0,
        tostring(slot.itemID or "?"),
        slot.count or 0,
        slot.locked and " locked" or ""
    )
end

function GBO:GetLatencySummary()
    if not GetNetStats then
        return "home=?ms world=?ms"
    end
    local _, _, home, world = GetNetStats()
    return string.format("home=%dms world=%dms", home or -1, world or -1)
end

function GBO:InitializeDatabase()
    if type(GuildBankOrganizerDB) ~= "table" then
        GuildBankOrganizerDB = {}
    end
    local previousSchema = tonumber(GuildBankOrganizerDB.schema) or 0
    if type(GuildBankOrganizerDB.runs) ~= "table" then
        GuildBankOrganizerDB.runs = {}
    end
    if type(GuildBankOrganizerDB.settings) ~= "table" then
        GuildBankOrganizerDB.settings = {}
    end
    if type(GuildBankOrganizerDB.depositProfiles) ~= "table" then
        GuildBankOrganizerDB.depositProfiles = {}
    end
    self:MigrateDepositProfileDatabase(GuildBankOrganizerDB, previousSchema)
    GuildBankOrganizerDB.schema = 6

    local cadence = tonumber(GuildBankOrganizerDB.settings.sortCadence)
    if not cadence
        or cadence < self.defaults.sortMinimumCadence
        or cadence > 5.0
    then
        GuildBankOrganizerDB.settings.sortCadence = self.defaults.cadence
    else
        GuildBankOrganizerDB.settings.sortCadence = cadence
    end
    if GuildBankOrganizerDB.settings.autoOpen == nil then
        GuildBankOrganizerDB.settings.autoOpen = true
    else
        GuildBankOrganizerDB.settings.autoOpen =
            GuildBankOrganizerDB.settings.autoOpen and true or false
    end
    if GuildBankOrganizerDB.settings.sortInverted == nil then
        GuildBankOrganizerDB.settings.sortInverted = false
    else
        GuildBankOrganizerDB.settings.sortInverted =
            GuildBankOrganizerDB.settings.sortInverted and true or false
    end
    self.db = GuildBankOrganizerDB
end

function GBO:SaveRun(run)
    if not self.db or not run then
        return
    end

    table.insert(self.db.runs, 1, run)
    while #self.db.runs > 20 do
        table.remove(self.db.runs)
    end
end

eventFrame:SetScript("OnEvent", function(_, event, ...)
    local callbacks = listeners[event]
    if not callbacks then
        return
    end

    for index = 1, #callbacks do
        local ok, err = pcall(callbacks[index], event, ...)
        if not ok then
            reportHandlerError(event, err)
        end
    end
end)

GBO:On("ADDON_LOADED", function(_, loadedName)
    if loadedName == ADDON_NAME then
        GBO:InitializeDatabase()
    end
end)

local function handleGuildBankOpened()
    GBO.bankOpen = true
end

local function handleGuildBankClosed()
    GBO.bankOpen = false
    if GBO.CancelScan then
        GBO:CancelScan("bank closed")
    end
    if GBO.AbortDiagnostic then
        GBO:AbortDiagnostic("bank closed")
    end
    if GBO.AbortSort then
        GBO:AbortSort("bank closed")
    end
    if GBO.AbortDeposit then
        GBO:AbortDeposit("bank closed")
    end
end

GBO:On("GUILDBANKFRAME_OPENED", handleGuildBankOpened)
GBO:On("GUILDBANKFRAME_CLOSED", handleGuildBankClosed)

GBO:On("PLAYER_INTERACTION_MANAGER_FRAME_SHOW", function(_, interactionType)
    if GBO:IsGuildBankInteraction(interactionType) then
        handleGuildBankOpened()
    end
end)

GBO:On("PLAYER_INTERACTION_MANAGER_FRAME_HIDE", function(_, interactionType)
    if GBO:IsGuildBankInteraction(interactionType) then
        handleGuildBankClosed()
    end
end)

GBO:On("PLAYER_LOGIN", function()
    local version, build, date, interfaceVersion = GetBuildInfo()
    GBO.client = {
        version = version,
        build = build,
        date = date,
        interfaceVersion = interfaceVersion,
    }
end)
