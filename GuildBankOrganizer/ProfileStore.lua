local _, GBO = ...

local LEGACY_CATEGORY_KEYS = {
    ["7:4"] = "jewels",
    ["7:5"] = "cloth",
    ["7:6"] = "leather",
    ["7:7"] = "ore",
    ["7:8"] = "fish",
    ["7:9"] = "herbs",
    ["7:10"] = "elemental",
    ["7:12"] = "enchanting",
    ["7:16"] = "inscription",
}

local PROFILE_FIELDS = {
    enabled = true,
    label = true,
    categories = true,
    allExpansions = true,
    expansions = true,
    exactItemIDs = true,
    enabledStateVersion = true,
}

local GUILD_CONTAINER_RECOVERY_KEY = "__guildProfileContainer"
local TOP_LEVEL_RECOVERY_KEY = "__depositProfilesContainer"

local expansionIDs = {}
for _, expansion in ipairs(GBO:GetDepositExpansionCatalog()) do
    expansionIDs[expansion.id] = true
end

local function trim(value)
    return string.match(value, "^%s*(.-)%s*$")
end

local function profileScopeKey()
    local realm = GetRealmName and GetRealmName() or "Unknown Realm"
    local guild = GetGuildInfo and GetGuildInfo("player") or nil
    return tostring(realm) .. "\031" .. tostring(guild or "No Guild")
end

local function newProfile()
    return {
        enabled = false,
        label = "",
        categories = {},
        allExpansions = true,
        expansions = {},
        exactItemIDs = {},
        enabledStateVersion = 1,
    }
end

local function isInteger(value)
    return value and value == math.floor(value)
end

local function selectedExpansionSet(source, strict)
    local selected = {}
    local malformed = false
    for expansionID, value in pairs(source or {}) do
        local normalizedID = tonumber(expansionID)
        if type(value) ~= "boolean" then
            malformed = true
        elseif not isInteger(normalizedID) or not expansionIDs[normalizedID] then
            if strict then
                return nil, "Choose a supported expansion."
            end
            malformed = true
        elseif value then
            selected[normalizedID] = true
        end
    end
    return selected, nil, malformed
end

local function selectedExactItemSet(source, strict)
    local selected = {}
    local malformed = false
    for itemID, value in pairs(source or {}) do
        local normalizedID = tonumber(itemID)
        if type(value) ~= "boolean" then
            malformed = true
        elseif not isInteger(normalizedID) or normalizedID <= 0 then
            if strict then
                return nil, "Exact item IDs must be positive whole numbers."
            end
            malformed = true
        elseif value then
            selected[normalizedID] = true
        end
    end
    return selected, nil, malformed
end

local function selectedCategorySet(source, strict, acceptLegacy)
    local selected = {}
    local malformed = false
    for key, value in pairs(source or {}) do
        if type(key) ~= "string" or type(value) ~= "boolean" then
            malformed = true
        else
            local normalizedKey = acceptLegacy and LEGACY_CATEGORY_KEYS[key] or nil
            normalizedKey = normalizedKey or key
            if not GBO:GetDepositCategory(normalizedKey) then
                if strict then
                    return nil, string.format(
                        "Unknown Smart Deposit category: %s.",
                        tostring(key)
                    )
                end
                malformed = true
            elseif value then
                selected[normalizedKey] = true
            end
        end
    end
    return selected, nil, malformed
end

function GBO:GetDepositProfiles(create)
    if not self.db then
        return nil
    end
    self.db.depositProfiles = self.db.depositProfiles or {}
    local key = profileScopeKey()
    if create and type(self.db.depositProfiles[key]) ~= "table" then
        self.db.depositProfiles[key] = {}
    end
    return self.db.depositProfiles[key]
end

function GBO:GetDepositProfile(tab, create)
    tab = tonumber(tab)
    if not tab then
        return nil
    end
    local profiles = self:GetDepositProfiles(create)
    if not profiles then
        return nil
    end
    if create and type(profiles[tab]) ~= "table" then
        profiles[tab] = newProfile()
    end
    return profiles[tab]
end

function GBO:GetDepositProfileRecovery()
    if not self.db or type(self.db.depositProfileRecovery) ~= "table"
        or next(self.db.depositProfileRecovery) == nil
    then
        return nil
    end
    return self.db.depositProfileRecovery
end

function GBO:GetExactDepositProfileTabs(itemID)
    itemID = tonumber(itemID)
    if not itemID then
        return {}
    end

    local exactTabs = {}
    local profiles = self:GetDepositProfiles(false) or {}
    for tab, profile in pairs(profiles) do
        tab = tonumber(tab)
        if tab
            and type(profile) == "table"
            and profile.enabled
            and type(profile.exactItemIDs) == "table"
            and profile.exactItemIDs[itemID]
        then
            table.insert(exactTabs, tab)
        end
    end
    table.sort(exactTabs)
    return exactTabs
end

function GBO:ValidateDepositProfile(tab, draft)
    tab = tonumber(tab)
    local purchasedTabs = GetNumGuildBankTabs and tonumber(GetNumGuildBankTabs()) or 0
    if not isInteger(tab) or tab < 1 or tab > purchasedTabs then
        return nil, "Select a purchased guild-bank tab."
    end
    if type(draft) ~= "table" then
        return nil, "The Smart Deposit profile draft is invalid."
    end
    if type(draft.enabled) ~= "boolean"
        or type(draft.label) ~= "string"
        or type(draft.categories) ~= "table"
        or type(draft.allExpansions) ~= "boolean"
        or type(draft.expansions) ~= "table"
        or type(draft.exactItemIDs) ~= "table"
    then
        return nil, "The Smart Deposit profile draft has invalid fields."
    end

    local categories, categoryReason = selectedCategorySet(
        draft.categories,
        true,
        false
    )
    if not categories then
        return nil, categoryReason
    end
    local expansions, expansionReason = selectedExpansionSet(
        draft.expansions,
        true
    )
    if not expansions then
        return nil, expansionReason
    end
    local exactItemIDs, itemReason = selectedExactItemSet(
        draft.exactItemIDs,
        true
    )
    if not exactItemIDs then
        return nil, itemReason
    end

    if draft.enabled and not next(categories) and not next(exactItemIDs) then
        return nil, "Choose at least one category or exact item ID."
    end
    if draft.enabled and not draft.allExpansions and not next(expansions) then
        return nil, "Choose All expansions or at least one expansion."
    end

    return {
        enabled = draft.enabled,
        label = trim(draft.label),
        categories = categories,
        allExpansions = draft.allExpansions,
        expansions = expansions,
        exactItemIDs = exactItemIDs,
        enabledStateVersion = 1,
    }
end

local function orderedTabs(left, right)
    if left < right then
        return left, right
    end
    return right, left
end

local function findProfileConflict(GBO, tab, candidate, profiles)
    if not candidate.enabled then
        return nil
    end

    for storedTab, otherProfile in pairs(profiles or {}) do
        local otherTab = tonumber(storedTab)
        if otherTab and otherTab ~= tab and type(otherProfile) == "table"
            and otherProfile.enabled
        then
            local firstTab, secondTab = orderedTabs(tab, otherTab)
            for itemID in pairs(candidate.exactItemIDs) do
                if type(otherProfile.exactItemIDs) == "table"
                    and otherProfile.exactItemIDs[itemID]
                then
                    return string.format(
                        "Item ID %d has exact routes to both Tab %d and Tab %d. Remove it from one profile.",
                        itemID,
                        firstTab,
                        secondTab
                    )
                end
            end

            for categoryKey in pairs(candidate.categories) do
                if type(otherProfile.categories) == "table"
                    and otherProfile.categories[categoryKey]
                then
                    if candidate.allExpansions and otherProfile.allExpansions then
                        return string.format(
                            "%s uses All Expansions on both Tab %d and Tab %d. Choose specific expansions or disable one profile.",
                            GBO:GetDepositCategoryName(categoryKey),
                            firstTab,
                            secondTab
                        )
                    elseif not candidate.allExpansions
                        and not otherProfile.allExpansions
                    then
                        for expansionID in pairs(candidate.expansions) do
                            if type(otherProfile.expansions) == "table"
                                and otherProfile.expansions[expansionID]
                            then
                                return string.format(
                                    "%s routes %s to both Tab %d and Tab %d. Choose a different expansion or disable one profile.",
                                    GBO:GetDepositCategoryName(categoryKey),
                                    GBO:GetDepositExpansionName(expansionID),
                                    firstTab,
                                    secondTab
                                )
                            end
                        end
                    end
                end
            end
        end
    end
    return nil
end

function GBO:SaveDepositProfileDraft(tab, draft)
    if (self.IsDepositRunning and self:IsDepositRunning())
        or (self.IsDepositScanning and self:IsDepositScanning())
    then
        return false,
            "Finish or stop the active Smart Deposit before changing profiles."
    end

    tab = tonumber(tab)
    local candidate, reason = self:ValidateDepositProfile(tab, draft)
    if not candidate then
        return false, reason
    end

    local profiles = self:GetDepositProfiles(false)
    reason = findProfileConflict(self, tab, candidate, profiles)
    if reason then
        return false, reason
    end

    profiles = self:GetDepositProfiles(true)
    profiles[tab] = candidate
    if self.RefreshDepositPlan then
        self:RefreshDepositPlan()
    end
    return true, candidate
end

function GBO:SaveDepositProfile(
    tab,
    enabled,
    label,
    categories,
    allExpansions,
    expansions,
    exactItemIDs
)
    expansions = type(expansions) == "table" and expansions or {}
    if allExpansions == nil then
        local selected = selectedExpansionSet(expansions, false)
        allExpansions = not selected or next(selected) == nil
    end
    return self:SaveDepositProfileDraft(tab, {
        enabled = enabled and true or false,
        label = tostring(label or ""),
        categories = type(categories) == "table" and categories or {},
        allExpansions = allExpansions and true or false,
        expansions = expansions,
        exactItemIDs = type(exactItemIDs) == "table" and exactItemIDs or {},
    })
end

local function preserveRecovery(db, guildKey, tab, original)
    if type(db.depositProfileRecovery) ~= "table" then
        db.depositProfileRecovery = {}
    end
    if type(db.depositProfileRecovery[guildKey]) ~= "table" then
        db.depositProfileRecovery[guildKey] = {}
    end
    if db.depositProfileRecovery[guildKey][tab] == nil then
        db.depositProfileRecovery[guildKey][tab] = original
    end
end

local function normalizeStoredProfile(profile, previousSchema)
    if type(profile) ~= "table" then
        return newProfile(), true
    end

    local malformed = false
    for key in pairs(profile) do
        if not PROFILE_FIELDS[key] then
            malformed = true
        end
    end

    if profile.enabled ~= nil and type(profile.enabled) ~= "boolean" then
        malformed = true
    end
    if profile.label ~= nil and type(profile.label) ~= "string" then
        malformed = true
    end
    if profile.categories ~= nil and type(profile.categories) ~= "table" then
        malformed = true
    end
    if profile.allExpansions ~= nil
        and type(profile.allExpansions) ~= "boolean"
    then
        malformed = true
    end
    if profile.expansions ~= nil and type(profile.expansions) ~= "table" then
        malformed = true
    end
    if profile.exactItemIDs ~= nil and type(profile.exactItemIDs) ~= "table" then
        malformed = true
    end
    if profile.enabledStateVersion ~= nil
        and type(profile.enabledStateVersion) ~= "number"
    then
        malformed = true
    end

    local categories, _, categoriesMalformed = selectedCategorySet(
        type(profile.categories) == "table" and profile.categories or {},
        false,
        true
    )
    local expansions, _, expansionsMalformed = selectedExpansionSet(
        type(profile.expansions) == "table" and profile.expansions or {},
        false
    )
    local exactItemIDs, _, exactItemIDsMalformed = selectedExactItemSet(
        type(profile.exactItemIDs) == "table" and profile.exactItemIDs or {},
        false
    )
    malformed = malformed
        or categoriesMalformed
        or expansionsMalformed
        or exactItemIDsMalformed

    local hasRules = next(categories) ~= nil or next(exactItemIDs) ~= nil
    local enabled = profile.enabled == true and hasRules
    if previousSchema < 5 and profile.enabledStateVersion == nil and hasRules then
        enabled = true
    end

    local allExpansions
    if type(profile.allExpansions) == "boolean" then
        allExpansions = profile.allExpansions
    else
        allExpansions = next(expansions) == nil
    end

    return {
        enabled = enabled,
        label = type(profile.label) == "string" and trim(profile.label) or "",
        categories = categories,
        allExpansions = allExpansions,
        expansions = expansions,
        exactItemIDs = exactItemIDs,
        enabledStateVersion = tonumber(profile.enabledStateVersion) or 1,
    }, malformed
end

function GBO:MigrateDepositProfileDatabase(db, previousSchema)
    if type(db) ~= "table" then
        return
    end
    if type(db.depositProfiles) ~= "table" then
        if db.depositProfiles ~= nil then
            if type(db.depositProfileRecovery) ~= "table" then
                db.depositProfileRecovery = {}
            end
            if db.depositProfileRecovery[TOP_LEVEL_RECOVERY_KEY] == nil then
                db.depositProfileRecovery[TOP_LEVEL_RECOVERY_KEY] =
                    db.depositProfiles
            end
        end
        db.depositProfiles = {}
        return
    end

    previousSchema = tonumber(previousSchema) or 0
    for guildKey, guildProfiles in pairs(db.depositProfiles) do
        if type(guildProfiles) == "table" then
            for tab, original in pairs(guildProfiles) do
                local normalized, malformed = normalizeStoredProfile(
                    original,
                    previousSchema
                )
                if malformed then
                    preserveRecovery(db, guildKey, tab, original)
                end
                guildProfiles[tab] = normalized
            end
        else
            preserveRecovery(
                db,
                guildKey,
                GUILD_CONTAINER_RECOVERY_KEY,
                guildProfiles
            )
            db.depositProfiles[guildKey] = {}
        end
    end
end
