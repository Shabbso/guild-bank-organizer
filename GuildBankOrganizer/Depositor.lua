local _, GBO = ...

local depositor = {
    running = false,
    scanning = false,
    generation = 0,
    idleRefreshGeneration = 0,
}

local getContainerNumSlots = C_Container and C_Container.GetContainerNumSlots
local getContainerItemInfo = C_Container and C_Container.GetContainerItemInfo
local pickupContainerItem = C_Container and C_Container.PickupContainerItem
local splitContainerItem = C_Container and C_Container.SplitContainerItem
local getItemInfoInstant = C_Item and C_Item.GetItemInfoInstant
local getItemInfo = (C_Item and C_Item.GetItemInfo) or GetItemInfo
local getItemFamily = C_Item and C_Item.GetItemFamily

local function now()
    return GetTime()
end

local function schedule(delay, callback)
    local generation = depositor.generation
    C_Timer.After(delay, function()
        if depositor.generation == generation then
            callback()
        end
    end)
end

local function addTimeline(message)
    if not depositor.running then
        return
    end

    table.insert(depositor.timeline, string.format(
        "%8.3f  %s",
        now() - depositor.startedAt,
        tostring(message)
    ))
    while #depositor.timeline > GBO.defaults.maxTimelineEntries do
        table.remove(depositor.timeline, 1)
    end
end

function GBO:HasEnabledDepositProfiles()
    local profiles = self:GetDepositProfiles(false)
    if not profiles then
        return false
    end
    for _, profile in pairs(profiles) do
        if type(profile) == "table"
            and profile.enabled
            and type(profile.categories) == "table"
            and (
                next(profile.categories)
                or type(profile.exactItemIDs) == "table"
                    and next(profile.exactItemIDs)
            )
        then
            return true
        end
    end
    return false
end

local function readBagSlot(bag, slot)
    if not getContainerItemInfo then
        return nil
    end
    local info = getContainerItemInfo(bag, slot)
    if not info or not info.itemID then
        return nil
    end

    local itemID, _, _, equipLoc, _, classID, subclassID =
        getItemInfoInstant(info.itemID)
    if not itemID then
        return nil
    end

    local name, _, _, _, _, _, _, maxStack, infoEquipLoc, _, _, _, _, _, expansionID =
        getItemInfo(info.hyperlink or itemID)
    local resolvedExpansionID, expansionEvidence =
        GBO:ResolveDepositExpansion(itemID, expansionID, classID)
    local item = {
        bag = bag,
        slot = slot,
        itemID = itemID,
        link = info.hyperlink,
        count = info.stackCount or 1,
        locked = info.isLocked and true or false,
        bound = info.isBound and true or false,
        classID = classID,
        subclassID = subclassID,
        bagFamily = getItemFamily
            and getItemFamily(info.hyperlink or itemID)
            or 0,
        equipLoc = equipLoc ~= "" and equipLoc or infoEquipLoc,
        expansionID = resolvedExpansionID,
        expansionEvidence = expansionEvidence,
        name = name,
        maxStack = maxStack or 1,
    }
    item.categoryKey, item.categoryEvidence = GBO:ClassifyDepositItem(item)
    return item
end

function GBO:ReadDepositBagSlot(bag, slot)
    return readBagSlot(bag, slot)
end

local function profileCategoryMatches(profile, item)
    if profile.exactItemIDs and profile.exactItemIDs[item.itemID] then
        return true, "exact item ID"
    end
    if not item.categoryKey
        or not profile.categories
        or not profile.categories[item.categoryKey]
    then
        return false
    end
    return true, item.categoryEvidence
end

local function profileExpansionMatches(profile, item)
    if profile.allExpansions then
        return true
    end
    return item.expansionID ~= nil
        and profile.expansions
        and profile.expansions[item.expansionID]
        and true
        or false
end

function GBO:InspectDepositProfile(tab)
    local profile = self:GetDepositProfile(tab, false)
    local result = {
        tab = tonumber(tab),
        enabled = profile and profile.enabled or false,
        matchingItems = 0,
        matchingStacks = 0,
        categoryItems = 0,
        expansionMismatches = 0,
        unknownExpansions = 0,
        blockedItems = 0,
        boundItems = 0,
        lockedItems = 0,
        unavailableItems = 0,
        unclassifiedItems = 0,
    }
    if not profile then
        return result
    end

    local maximumBag = NUM_BAG_SLOTS or 4
    for bag = 0, maximumBag do
        local numSlots = getContainerNumSlots and getContainerNumSlots(bag) or 0
        for slot = 1, numSlots do
            local item = readBagSlot(bag, slot)
            if item then
                local categoryMatches, matchEvidence =
                    profileCategoryMatches(profile, item)
                if categoryMatches then
                    result.categoryItems = result.categoryItems + item.count
                    if not result.firstCategoryMatch then
                        result.firstCategoryMatch = item
                    end
                    if matchEvidence ~= "exact item ID"
                        and not profileExpansionMatches(profile, item)
                    then
                        result.expansionMismatches =
                            result.expansionMismatches + item.count
                        if item.expansionID == nil then
                            result.unknownExpansions =
                                result.unknownExpansions + item.count
                        end
                        if not result.firstExpansionMismatch then
                            result.firstExpansionMismatch = item
                        end
                    elseif item.bound then
                        result.blockedItems = result.blockedItems + item.count
                        result.boundItems = result.boundItems + item.count
                        if not result.firstBound then
                            result.firstBound = item
                        end
                    elseif item.locked then
                        result.blockedItems = result.blockedItems + item.count
                        result.lockedItems = result.lockedItems + item.count
                        if not result.firstLocked then
                            result.firstLocked = item
                        end
                    elseif not item.link then
                        result.blockedItems = result.blockedItems + item.count
                        result.unavailableItems =
                            result.unavailableItems + item.count
                    else
                        result.matchingItems = result.matchingItems + item.count
                        result.matchingStacks = result.matchingStacks + 1
                        if not result.firstMatch then
                            result.firstMatch = item
                        end
                    end
                elseif not item.bound
                    and not item.locked
                    and self:IsUnclassifiedDepositMaterial(item)
                then
                    result.unclassifiedItems =
                        result.unclassifiedItems + item.count
                    if not result.firstUnclassified then
                        result.firstUnclassified = item
                    end
                end
            end
        end
    end
    return result
end

local function sameBagItem(slot, expectedItemID, expectedCount)
    if expectedCount <= 0 then
        return slot == nil
    end
    return slot
        and slot.itemID == expectedItemID
        and slot.count == expectedCount
end

local function enabledProfileRouting()
    local profiles = GBO:GetDepositProfiles(false) or {}
    local routing = {
        categories = {},
        exactItemIDs = {},
    }
    local tabs = {}
    for tab = 1, GetNumGuildBankTabs() do
        local profile = GBO:GetDepositProfile(tab, false)
        if profile
            and profile.enabled
            and (
                next(profile.categories)
                or next(profile.exactItemIDs)
            )
        then
            tabs[tab] = profile
            for categoryKey, enabled in pairs(profile.categories) do
                if enabled then
                    routing.categories[categoryKey] =
                        routing.categories[categoryKey] or {}
                    table.insert(routing.categories[categoryKey], {
                        tab = tab,
                        allExpansions = profile.allExpansions,
                        expansions = profile.expansions,
                    })
                end
            end
            for itemID, enabled in pairs(profile.exactItemIDs) do
                if enabled then
                    routing.exactItemIDs[tonumber(itemID)] = tab
                end
            end
        end
    end
    return routing, tabs
end

local function routeBagItem(routing, item)
    local exactTab = routing.exactItemIDs[item.itemID]
    if exactTab then
        return exactTab, "exact item ID"
    end
    if not item.categoryKey then
        return nil
    end
    local categoryRoutes = routing.categories[item.categoryKey] or {}
    for _, route in ipairs(categoryRoutes) do
        if route.allExpansions
            or item.expansionID ~= nil
                and route.expansions[item.expansionID]
        then
            return route.tab, item.categoryEvidence
        end
    end
    return nil
end

local function readEligibleBagItems(routing)
    local items = {}
    local maximumBag = NUM_BAG_SLOTS or 4
    for bag = 0, maximumBag do
        local numSlots = getContainerNumSlots and getContainerNumSlots(bag) or 0
        for slot = 1, numSlots do
            local item = readBagSlot(bag, slot)
            local tab, routeEvidence
            if item then
                tab, routeEvidence = routeBagItem(routing, item)
            end
            if item and tab and not item.locked and not item.bound and item.link then
                item.targetTab = tab
                item.routeEvidence = routeEvidence
                item.planCategoryKey =
                    item.categoryKey or ("item:" .. tostring(item.itemID))
                table.insert(items, item)
            end
        end
    end
    table.sort(items, function(left, right)
        if left.targetTab ~= right.targetTab then
            return left.targetTab < right.targetTab
        end
        if left.bag ~= right.bag then
            return left.bag < right.bag
        end
        return left.slot < right.slot
    end)
    return items
end

local function cloneBankSlots(tab)
    local slots = {}
    local empty = {}
    for slot = 1, GBO.MAX_SLOTS do
        local item = GBO:ReadSlot(tab, slot)
        if item.link and not item.locked then
            local _, _, _, _, _, _, _, maxStack = getItemInfo(item.link)
            slots[slot] = {
                itemID = item.itemID,
                link = item.link,
                count = item.count,
                maxStack = maxStack or 1,
            }
        elseif not item.link and not item.locked then
            table.insert(empty, slot)
        end
    end
    return slots, empty
end

local function addPlannedMove(tabPlan, source, sourceCount, amount, targetSlot, target)
    table.insert(tabPlan.operations, {
        sourceBag = source.bag,
        sourceSlot = source.slot,
        sourceItemID = source.itemID,
        sourceLink = source.link,
        sourceCountBefore = sourceCount,
        amount = amount,
        targetTab = source.targetTab,
        targetSlot = targetSlot,
        targetItemID = target and target.itemID or nil,
        targetCountBefore = target and target.count or 0,
    })
    tabPlan.moves = tabPlan.moves + 1
    tabPlan.itemCount = tabPlan.itemCount + amount
    tabPlan.categoryCounts[source.planCategoryKey] =
        (tabPlan.categoryCounts[source.planCategoryKey] or 0) + amount
end

local function planTab(profile, tab, sources)
    local name, _, isViewable, canDeposit = GetGuildBankTabInfo(tab)
    local tabPlan = {
        tab = tab,
        name = name,
        label = profile.label ~= "" and profile.label or name or ("Tab " .. tab),
        viewable = isViewable and true or false,
        canDeposit = canDeposit and true or false,
        moves = 0,
        itemCount = 0,
        sourceStacks = 0,
        skippedItems = 0,
        operations = {},
        categoryCounts = {},
    }

    if not tabPlan.viewable or not tabPlan.canDeposit then
        for _, source in ipairs(sources) do
            tabPlan.skippedItems = tabPlan.skippedItems + source.count
        end
        return tabPlan
    end

    local bankSlots, emptySlots = cloneBankSlots(tab)
    local emptyPosition = 1
    for _, source in ipairs(sources) do
        local remaining = source.count
        local sourceCount = source.count
        local plannedForSource = false

        for targetSlot = 1, GBO.MAX_SLOTS do
            local target = bankSlots[targetSlot]
            if remaining > 0
                and target
                and target.itemID == source.itemID
                and target.link == source.link
                and target.count < target.maxStack
            then
                local amount = math.min(remaining, target.maxStack - target.count)
                addPlannedMove(
                    tabPlan,
                    source,
                    sourceCount,
                    amount,
                    targetSlot,
                    target
                )
                target.count = target.count + amount
                remaining = remaining - amount
                sourceCount = sourceCount - amount
                plannedForSource = true
            end
        end

        if remaining > 0 then
            local targetSlot = emptySlots[emptyPosition]
            if targetSlot then
                emptyPosition = emptyPosition + 1
                addPlannedMove(
                    tabPlan,
                    source,
                    sourceCount,
                    remaining,
                    targetSlot,
                    nil
                )
                bankSlots[targetSlot] = {
                    itemID = source.itemID,
                    link = source.link,
                    count = remaining,
                    maxStack = source.maxStack,
                }
                sourceCount = sourceCount - remaining
                remaining = 0
                plannedForSource = true
            end
        end

        if plannedForSource then
            tabPlan.sourceStacks = tabPlan.sourceStacks + 1
        end
        tabPlan.skippedItems = tabPlan.skippedItems + remaining
    end
    return tabPlan
end

local function buildDepositPlan()
    local routing, profiles = enabledProfileRouting()
    local sources = readEligibleBagItems(routing)
    local byTab = {}
    for tab in pairs(profiles) do
        byTab[tab] = {}
    end
    for _, source in ipairs(sources) do
        table.insert(byTab[source.targetTab], source)
    end

    local plan = {
        builtAt = now(),
        tabs = {},
        order = {},
        totalMoves = 0,
        totalItems = 0,
        totalStacks = 0,
        skippedItems = 0,
    }
    for tab = 1, GetNumGuildBankTabs() do
        local profile = profiles[tab]
        if profile then
            local tabPlan = planTab(profile, tab, byTab[tab] or {})
            plan.tabs[tab] = tabPlan
            table.insert(plan.order, tab)
            plan.totalMoves = plan.totalMoves + tabPlan.moves
            plan.totalItems = plan.totalItems + tabPlan.itemCount
            plan.totalStacks = plan.totalStacks + tabPlan.sourceStacks
            plan.skippedItems = plan.skippedItems + tabPlan.skippedItems
        end
    end
    return plan
end

local function filterDepositPlan(plan, selectedTabs)
    local filtered = {
        builtAt = plan and plan.builtAt,
        tabs = {},
        order = {},
        totalMoves = 0,
        totalItems = 0,
        totalStacks = 0,
        skippedItems = 0,
    }
    if not plan then
        return filtered
    end

    for _, plannedTab in ipairs(plan.order) do
        if not selectedTabs or selectedTabs[plannedTab] then
            local tabPlan = plan.tabs[plannedTab]
            filtered.tabs[plannedTab] = tabPlan
            table.insert(filtered.order, plannedTab)
            filtered.totalMoves = filtered.totalMoves + tabPlan.moves
            filtered.totalItems = filtered.totalItems + tabPlan.itemCount
            filtered.totalStacks = filtered.totalStacks + tabPlan.sourceStacks
            filtered.skippedItems = filtered.skippedItems + tabPlan.skippedItems
        end
    end
    return filtered
end

function GBO:GetDepositPlan()
    return depositor.plan
end

function GBO:GetDepositPlanScope(tab)
    local plan = depositor.plan
    if not plan then
        return nil
    end

    local selectedTabs
    if tab ~= nil then
        selectedTabs = {}
        local selectedTab = tonumber(tab)
        if selectedTab then
            selectedTabs[selectedTab] = true
        end
    end
    local scoped = filterDepositPlan(plan, selectedTabs)
    local destinationCount = 0
    for _, plannedTab in ipairs(scoped.order) do
        if scoped.tabs[plannedTab].moves > 0 then
            destinationCount = destinationCount + 1
        end
    end
    return {
        totalMoves = scoped.totalMoves,
        totalItems = scoped.totalItems,
        destinationCount = destinationCount,
    }
end

function GBO:GetDepositPlanSummary()
    if depositor.scanning then
        return "Scanning bags and assigned tabs..."
    end
    local plan = depositor.plan
    if not plan or plan.totalMoves == 0 then
        return nil
    end
    local destinationCount = 0
    for _, tab in ipairs(plan.order) do
        if plan.tabs[tab].moves > 0 then
            destinationCount = destinationCount + 1
        end
    end
    return string.format(
        "%d items in %d deposits across %d tab%s",
        plan.totalItems,
        plan.totalMoves,
        destinationCount,
        destinationCount == 1 and "" or "s"
    )
end

local function finishPlanRefresh(generation)
    if depositor.generation ~= generation or not depositor.scanning then
        return
    end
    depositor.scanning = false
    depositor.plan = buildDepositPlan()
    local callback = depositor.scanCallback
    depositor.scanCallback = nil
    if callback then
        callback(depositor.plan)
    end
end

local function queryNextPlanTab(generation)
    if depositor.generation ~= generation or not depositor.scanning then
        return
    end
    if not GBO:IsBankOpen() then
        depositor.scanning = false
        return
    end

    local tab = depositor.scanTabs[depositor.scanPosition]
    if not tab then
        finishPlanRefresh(generation)
        return
    end

    QueryGuildBankTab(tab)
    depositor.scanPosition = depositor.scanPosition + 1
    C_Timer.After(GBO.defaults.depositPlanTabDelay, function()
        queryNextPlanTab(generation)
    end)
end

function GBO:RefreshDepositPlan(callback)
    if depositor.running or not self:IsBankOpen() then
        return false
    end
    if self:IsDiagnosticRunning()
        or self:IsScanRunning()
        or (self.IsSortRunning and self:IsSortRunning())
    then
        return false
    end

    depositor.generation = depositor.generation + 1
    local generation = depositor.generation
    depositor.plan = nil
    depositor.scanCallback = callback
    depositor.scanTabs = {}
    depositor.scanPosition = 1

    local _, profiles = enabledProfileRouting()
    for tab = 1, GetNumGuildBankTabs() do
        if profiles[tab] then
            table.insert(depositor.scanTabs, tab)
        end
    end
    if #depositor.scanTabs == 0 then
        depositor.scanning = false
        depositor.plan = buildDepositPlan()
        depositor.scanCallback = nil
        if callback then
            callback(depositor.plan)
        end
        return true
    end

    depositor.scanning = true
    queryNextPlanTab(generation)
    return true
end

local function buildReport(ok, reason)
    local client = GBO.client or {}
    local lines = {
        "Guild Bank Organizer smart deposit report",
        string.format("addon=%s", GBO.version),
        string.format(
            "client=%s build=%s interface=%s",
            tostring(client.version or "?"),
            tostring(client.build or "?"),
            tostring(client.interfaceVersion or "?")
        ),
        string.format("realm=%s player=%s", tostring(GetRealmName()), tostring(UnitName("player"))),
        string.format(
            "result=%s stage=%s reason=%s",
            ok and "PASS" or "FAIL",
            tostring(depositor.stage or "?"),
            tostring(reason)
        ),
        string.format(
            "planned=%d issued=%d confirmed=%d retries=%d items=%d average=%.3fs skipped=%d",
            depositor.estimatedTotal or 0,
            depositor.issued,
            depositor.confirmed,
            depositor.retries or 0,
            depositor.depositedItems,
            depositor.averageSeconds or 0,
            depositor.skippedItems or 0
        ),
        string.format("bagEvents=%d slotEvents=%d uiErrors=%d %s",
            depositor.bagEvents,
            depositor.slotEvents,
            #depositor.uiErrors,
            GBO:GetLatencySummary()
        ),
        "timeline:",
    }
    for _, entry in ipairs(depositor.timeline) do
        table.insert(lines, entry)
    end
    local report = table.concat(lines, "\n")
    return report, {
        type = "deposit",
        savedAt = GetServerTime(),
        ok = ok,
        reason = reason,
        issuedMoves = depositor.issued,
        confirmedMoves = depositor.confirmed,
        retries = depositor.retries or 0,
        depositedItems = depositor.depositedItems,
        averageMoveSeconds = depositor.averageSeconds,
        skippedItems = depositor.skippedItems,
        report = report,
    }
end

local function finishDeposit(ok, reason)
    if not depositor.running then
        return
    end
    addTimeline(string.format("FINISH %s: %s", ok and "PASS" or "FAIL", reason))
    local report, savedRun = buildReport(ok, reason)
    depositor.running = false
    depositor.generation = depositor.generation + 1
    depositor.plan = nil
    GBO.lastReport = report
    GBO.lastOutcome = {
        ok = ok,
        reason = reason,
        type = "deposit",
    }
    GBO:SaveRun(savedRun)
    GBO:Print(string.format(
        "%s: %s. %d items in %d confirmed deposits.",
        ok and "Deposit complete" or "Deposit stopped",
        reason,
        depositor.depositedItems,
        depositor.confirmed
    ))
    if GBO:IsBankOpen() then
        C_Timer.After(0.20, function()
            if not depositor.running and GBO:IsBankOpen() then
                GBO:RefreshDepositPlan()
            end
        end)
    end
end

local function expectedBankTarget(move)
    local target = GBO:ReadSlot(move.targetTab, move.targetSlot)
    return target
        and not target.locked
        and target.itemID == move.sourceItemID
        and target.count == move.targetCountBefore + move.amount
end

local function unchangedBankTarget(move)
    local target = GBO:ReadSlot(move.targetTab, move.targetSlot)
    if not target or target.locked then
        return false
    end
    if move.targetItemID then
        return target.itemID == move.targetItemID
            and target.count == move.targetCountBefore
            and target.link == move.sourceLink
    end
    return target.link == nil
end

function GBO:RetryUnchangedDeposit()
    if not depositor.running
        or depositor.stage ~= "waiting"
        or not depositor.retryPending
    then
        return
    end

    local move = depositor.move
    local source = readBagSlot(move.sourceBag, move.sourceSlot)
    local expectedSourceCount = move.sourceCountBefore - move.amount
    if sameBagItem(source, move.sourceItemID, expectedSourceCount)
        and expectedBankTarget(move)
    then
        depositor.retryPending = nil
        self:CheckDepositMove()
        return
    end

    if not sameBagItem(source, move.sourceItemID, move.sourceCountBefore)
        or source.locked
        or not unchangedBankTarget(move)
        or self:GetCursorType()
    then
        finishDeposit(
            false,
            "deposit timed out and state changed while preparing a safe retry"
        )
        return
    end

    move.retryCount = (move.retryCount or 0) + 1
    depositor.retries = depositor.retries + 1
    depositor.retryPending = nil
    addTimeline(string.format(
        "safe retry %d: source and destination remained unchanged after refresh",
        move.retryCount
    ))
    self:IssueDepositMove(move, true)
end

function GBO:CheckDepositMove()
    if not depositor.running or depositor.stage ~= "waiting" then
        return
    end
    if not self:IsBankOpen() then
        finishDeposit(false, "guild bank closed during deposit")
        return
    end
    if self:GetCursorType() then
        ClearCursor()
        finishDeposit(false, "deposit left an item on the cursor")
        return
    end

    local move = depositor.move
    local source = readBagSlot(move.sourceBag, move.sourceSlot)
    local expectedSourceCount = move.sourceCountBefore - move.amount
    if sameBagItem(source, move.sourceItemID, expectedSourceCount)
        and expectedBankTarget(move)
    then
        local elapsed = math.max(0, now() - depositor.moveIssuedAt)
        depositor.confirmed = depositor.confirmed + 1
        depositor.depositedItems = depositor.depositedItems + move.amount
        depositor.totalSeconds = depositor.totalSeconds + elapsed
        depositor.averageSeconds = depositor.totalSeconds / depositor.confirmed
        addTimeline(string.format(
            "confirmed deposit %d: bag %d/%d -> T%d/S%d amount=%d in %.3fs",
            depositor.confirmed,
            move.sourceBag,
            move.sourceSlot,
            move.targetTab,
            move.targetSlot,
            move.amount,
            elapsed
        ))
        depositor.move = nil
        depositor.moveIssuedAt = nil
        depositor.retryPending = nil
        if depositor.stopRequested then
            finishDeposit(false, "stopped by user after the active deposit settled")
        else
            depositor.stage = "planning"
            schedule(self.defaults.depositQuietPeriod, function()
                GBO:PlanNextDeposit()
            end)
        end
        return
    end

    if depositor.retryPending then
        return
    end

    if now() - depositor.moveIssuedAt >= self.defaults.operationTimeout then
        if (move.retryCount or 0) < self.defaults.depositMaxRetries then
            depositor.retryPending = true
            addTimeline(string.format(
                "deposit timed out; refreshing T%d before one unchanged-state retry",
                move.targetTab
            ))
            QueryGuildBankTab(move.targetTab)
            schedule(self.defaults.depositRetryDelay, function()
                GBO:RetryUnchangedDeposit()
            end)
            return
        end
        finishDeposit(false, "deposit did not reach its expected bag and bank state")
        return
    end
    schedule(self.defaults.depositPollInterval, function()
        GBO:CheckDepositMove()
    end)
end

function GBO:IssueDepositMove(move, isRetry)
    if not depositor.running then
        return
    end
    if depositor.issued >= self.defaults.depositMaxMoves then
        finishDeposit(false, "deposit safety limit reached")
        return
    end
    if InCombatLockdown and InCombatLockdown() then
        finishDeposit(false, "combat started during deposit")
        return
    end

    local source = readBagSlot(move.sourceBag, move.sourceSlot)
    local target = self:ReadSlot(move.targetTab, move.targetSlot)
    if not sameBagItem(source, move.sourceItemID, move.sourceCountBefore) then
        finishDeposit(false, "bag contents changed before a planned deposit")
        return
    end
    if source.locked or target.locked then
        finishDeposit(false, "source or destination became locked")
        return
    end
    if move.targetItemID then
        if target.itemID ~= move.targetItemID
            or target.count ~= move.targetCountBefore
            or target.link ~= move.sourceLink
        then
            finishDeposit(false, "destination stack changed before deposit")
            return
        end
    elseif target.link then
        finishDeposit(false, "empty destination changed before deposit")
        return
    end
    if self:GetCursorType() then
        finishDeposit(false, "cursor must be empty before depositing")
        return
    end

    addTimeline(string.format(
        "%s deposit %d: bag %d/%d -> T%d/S%d amount=%d",
        isRetry and "retry" or "issue",
        depositor.issued + 1,
        move.sourceBag,
        move.sourceSlot,
        move.targetTab,
        move.targetSlot,
        move.amount
    ))
    if move.amount < source.count then
        splitContainerItem(move.sourceBag, move.sourceSlot, move.amount)
    else
        pickupContainerItem(move.sourceBag, move.sourceSlot)
    end
    if not self:GetCursorType() then
        finishDeposit(false, "bag pickup did not place an item on the cursor")
        return
    end

    PickupGuildBankItem(move.targetTab, move.targetSlot)
    depositor.issued = depositor.issued + 1
    if self:GetCursorType() then
        ClearCursor()
        finishDeposit(false, "guild-bank deposit left an item on the cursor")
        return
    end

    depositor.move = move
    depositor.moveIssuedAt = now()
    depositor.retryPending = nil
    depositor.stage = "waiting"
    schedule(self.defaults.depositPollInterval, function()
        GBO:CheckDepositMove()
    end)
end

local function selectedPlan()
    return filterDepositPlan(buildDepositPlan(), depositor.selectedTabs)
end

local function finishVerification()
    if not depositor.running or depositor.stage ~= "verifying" then
        return
    end
    local remaining = selectedPlan()
    if remaining.totalMoves > 0 then
        addTimeline("final refresh found additional deposit work; resuming")
        depositor.stage = "planning"
        GBO:PlanNextDeposit()
        return
    end
    depositor.skippedItems = remaining.skippedItems
    finishDeposit(true, remaining.skippedItems > 0
        and "eligible items deposited; some items had no available space"
        or "all planned items were deposited"
    )
end

local function queryVerificationTab()
    if not depositor.running or depositor.stage ~= "verifying" then
        return
    end
    local tab = depositor.verifyTabs[depositor.verifyPosition]
    if not tab then
        finishVerification()
        return
    end
    QueryGuildBankTab(tab)
    depositor.verifyPosition = depositor.verifyPosition + 1
    schedule(GBO.defaults.depositPlanTabDelay, queryVerificationTab)
end

local function settleAndVerify()
    depositor.stage = "settling"
    depositor.finalizeStartedAt = now()
    addTimeline(string.format(
        "settling %.2fs before final server refresh",
        GBO.defaults.depositFinalDelay
    ))
    schedule(GBO.defaults.depositFinalDelay, function()
        depositor.stage = "verifying"
        depositor.verifyTabs = {}
        depositor.verifyPosition = 1
        for tab in pairs(depositor.selectedTabs or {}) do
            table.insert(depositor.verifyTabs, tab)
        end
        table.sort(depositor.verifyTabs)
        queryVerificationTab()
    end)
end

function GBO:PlanNextDeposit()
    if not depositor.running then
        return
    end
    if depositor.stopRequested then
        finishDeposit(false, "stopped by user")
        return
    end
    if not self:IsBankOpen() then
        finishDeposit(false, "guild bank closed during deposit")
        return
    end
    if InCombatLockdown and InCombatLockdown() then
        finishDeposit(false, "combat started during deposit")
        return
    end

    depositor.stage = "planning"
    local plan = selectedPlan()
    depositor.estimatedTotal = depositor.confirmed + plan.totalMoves
    depositor.estimatedRemaining = plan.totalMoves
    depositor.skippedItems = plan.skippedItems
    for _, tab in ipairs(plan.order) do
        local tabPlan = plan.tabs[tab]
        if tabPlan.operations[1] then
            self:IssueDepositMove(tabPlan.operations[1])
            return
        end
    end
    settleAndVerify()
end

function GBO:StartDeposit(tab, refreshed)
    if depositor.running then
        self:Print("A smart-deposit operation is already running.")
        return false
    end
    if depositor.scanning then
        self:Print("Wait for the current Smart Deposit scan to finish.")
        return false
    end
    if self:IsDiagnosticRunning()
        or self:IsScanRunning()
        or (self.IsSortRunning and self:IsSortRunning())
    then
        self:Print("Stop or finish the current guild-bank operation first.")
        return false
    end
    if not self:IsBankOpen() then
        self:Print("Open the guild bank first.")
        return false
    end
    if InCombatLockdown and InCombatLockdown() then
        self:Print("Smart Deposit cannot start during combat.")
        return false
    end
    if not refreshed then
        self:Print("Refreshing bags and assigned tabs before depositing...")
        return self:RefreshDepositPlan(function()
            if GBO:IsBankOpen() then
                GBO:StartDeposit(tab, true)
            end
        end)
    end

    local plan = buildDepositPlan()
    local selectedTabs = {}
    if tab then
        tab = tonumber(tab)
        if not tab or not plan.tabs[tab] or plan.tabs[tab].moves == 0 then
            self:Print("No planned deposits are available for that tab.")
            return false
        end
        selectedTabs[tab] = true
    else
        for _, plannedTab in ipairs(plan.order) do
            if plan.tabs[plannedTab].moves > 0 then
                selectedTabs[plannedTab] = true
            end
        end
    end
    if not next(selectedTabs) then
        self:Print("No assigned bag items currently have guild-bank space.")
        return false
    end
    local scopedPlan = filterDepositPlan(plan, selectedTabs)

    depositor.generation = depositor.generation + 1
    depositor.running = true
    depositor.scanning = false
    depositor.stage = "planning"
    depositor.startedAt = now()
    depositor.selectedTabs = selectedTabs
    depositor.estimatedTotal = scopedPlan.totalMoves
    depositor.estimatedRemaining = scopedPlan.totalMoves
    depositor.issued = 0
    depositor.confirmed = 0
    depositor.depositedItems = 0
    depositor.totalSeconds = 0
    depositor.averageSeconds = nil
    depositor.retries = 0
    depositor.skippedItems = scopedPlan.skippedItems
    depositor.bagEvents = 0
    depositor.slotEvents = 0
    depositor.uiErrors = {}
    depositor.timeline = {}
    depositor.move = nil
    depositor.retryPending = nil
    depositor.stopRequested = nil
    self.lastOutcome = nil

    addTimeline(string.format(
        "smart deposit started: %d planned moves for %d items; %.2fs quiet period",
        scopedPlan.totalMoves,
        scopedPlan.totalItems,
        self.defaults.depositQuietPeriod
    ))
    self:Print(string.format(
        "Smart Deposit: %d items in %d planned deposits.",
        scopedPlan.totalItems,
        scopedPlan.totalMoves
    ))
    self:PlanNextDeposit()
    return true
end

function GBO:AbortDeposit(reason)
    if depositor.scanning and not depositor.running then
        depositor.generation = depositor.generation + 1
        depositor.scanning = false
        depositor.scanCallback = nil
        return
    end
    if not depositor.running then
        return
    end
    depositor.stopRequested = true
    addTimeline("stop requested: " .. tostring(reason or "cancelled"))
    if depositor.stage ~= "waiting" then
        finishDeposit(false, reason or "stopped by user")
    end
end

function GBO:IsDepositRunning()
    return depositor.running
end

function GBO:IsDepositScanning()
    return depositor.scanning
end

function GBO:GetDepositProgress()
    if not depositor.running then
        return nil
    end
    local total = depositor.estimatedTotal or 0
    local remaining = math.max(0, total - depositor.confirmed)
    local secondsPerMove = math.max(
        depositor.averageSeconds or 0.15,
        self.defaults.depositPollInterval
    ) + self.defaults.depositQuietPeriod
    local eta = remaining * secondsPerMove + self.defaults.depositFinalDelay
    return {
        stage = depositor.stage,
        total = total,
        completed = depositor.confirmed,
        remaining = remaining,
        percent = total > 0 and depositor.confirmed / total or 0,
        etaSeconds = eta,
        etaText = self:FormatSortDuration(eta),
        depositedItems = depositor.depositedItems,
        secondsPerMove = secondsPerMove,
    }
end

function GBO:GetDepositStatus()
    if depositor.scanning then
        return "Scanning bags and assigned tabs..."
    end
    if not depositor.running then
        return self:GetDepositPlanSummary() or "No smart deposits are currently planned."
    end
    local progress = self:GetDepositProgress()
    local stageNames = {
        planning = "Planning deposits",
        waiting = "Depositing",
        settling = "Finalizing deposits",
        verifying = "Verifying deposits",
    }
    return string.format(
        "%s • %d of %d confirmed",
        stageNames[depositor.stage] or tostring(depositor.stage),
        progress.completed,
        progress.total
    )
end

local function refreshForGuildBank()
    if GBO:HasEnabledDepositProfiles() then
        C_Timer.After(0.50, function()
            if GBO:IsBankOpen() and not depositor.running then
                GBO:RefreshDepositPlan()
            end
        end)
    else
        depositor.plan = buildDepositPlan()
    end
end

local function clearForGuildBank()
    if depositor.running or depositor.scanning then
        GBO:AbortDeposit("bank closed")
    end
    depositor.plan = nil
end

GBO:On("GUILDBANKFRAME_OPENED", refreshForGuildBank)
GBO:On("GUILDBANKFRAME_CLOSED", clearForGuildBank)

GBO:On("PLAYER_INTERACTION_MANAGER_FRAME_SHOW", function(_, interactionType)
    if GBO:IsGuildBankInteraction(interactionType) then
        refreshForGuildBank()
    end
end)

GBO:On("PLAYER_INTERACTION_MANAGER_FRAME_HIDE", function(_, interactionType)
    if GBO:IsGuildBankInteraction(interactionType) then
        clearForGuildBank()
    end
end)

GBO:On("BAG_UPDATE_DELAYED", function()
    if depositor.running then
        depositor.bagEvents = depositor.bagEvents + 1
        if depositor.stage == "waiting" then
            schedule(0.01, function()
                GBO:CheckDepositMove()
            end)
        end
    elseif GBO:IsBankOpen() and GBO:HasEnabledDepositProfiles() then
        depositor.idleRefreshGeneration =
            depositor.idleRefreshGeneration + 1
        local refreshGeneration = depositor.idleRefreshGeneration
        C_Timer.After(0.30, function()
            if refreshGeneration == depositor.idleRefreshGeneration
                and not depositor.running
                and not depositor.scanning
                and GBO:IsBankOpen()
            then
                GBO:RefreshDepositPlan()
            end
        end)
    end
end)

GBO:On("ITEM_UNLOCKED", function()
    if not depositor.running
        and not depositor.scanning
        and GBO:IsBankOpen()
        and GBO:HasEnabledDepositProfiles()
    then
        depositor.idleRefreshGeneration =
            depositor.idleRefreshGeneration + 1
        local refreshGeneration = depositor.idleRefreshGeneration
        C_Timer.After(0.10, function()
            if refreshGeneration == depositor.idleRefreshGeneration
                and not depositor.running
                and not depositor.scanning
                and GBO:IsBankOpen()
            then
                GBO:RefreshDepositPlan()
            end
        end)
    end
end)

GBO:On("GUILDBANKBAGSLOTS_CHANGED", function()
    if depositor.running then
        depositor.slotEvents = depositor.slotEvents + 1
        if depositor.stage == "waiting" then
            schedule(0.01, function()
                GBO:CheckDepositMove()
            end)
        end
    end
end)

GBO:On("UI_ERROR_MESSAGE", function(_, errorType, message)
    if depositor.running then
        table.insert(depositor.uiErrors, string.format(
            "%s: %s",
            tostring(errorType),
            tostring(message)
        ))
    end
end)
