local _, GBO = ...

local sorter = {
    running = false,
    generation = 0,
}

local getItemInfo = (C_Item and C_Item.GetItemInfo) or GetItemInfo
local ITEM_CLASS_WEAPON = Enum and Enum.ItemClass and Enum.ItemClass.Weapon or 2
local ITEM_CLASS_ARMOR = Enum and Enum.ItemClass and Enum.ItemClass.Armor or 4

local inventoryOrder = {
    INVTYPE_AMMO = 0,
    INVTYPE_HEAD = 1,
    INVTYPE_NECK = 2,
    INVTYPE_SHOULDER = 3,
    INVTYPE_BODY = 4,
    INVTYPE_CHEST = 5,
    INVTYPE_ROBE = 5,
    INVTYPE_WAIST = 6,
    INVTYPE_LEGS = 7,
    INVTYPE_FEET = 8,
    INVTYPE_WRIST = 9,
    INVTYPE_HAND = 10,
    INVTYPE_FINGER = 11,
    INVTYPE_TRINKET = 12,
    INVTYPE_CLOAK = 13,
    INVTYPE_WEAPON = 14,
    INVTYPE_SHIELD = 15,
    INVTYPE_2HWEAPON = 16,
    INVTYPE_WEAPONMAINHAND = 18,
    INVTYPE_WEAPONOFFHAND = 19,
    INVTYPE_HOLDABLE = 20,
    INVTYPE_RANGED = 21,
    INVTYPE_THROWN = 22,
    INVTYPE_RANGEDRIGHT = 23,
    INVTYPE_RELIC = 24,
    INVTYPE_TABARD = 25,
}

local function now()
    return GetTime()
end

local function addTimeline(message)
    if not sorter.running then
        return
    end

    table.insert(sorter.timeline, string.format(
        "%8.3f  %s",
        now() - sorter.startedAt,
        tostring(message)
    ))
    while #sorter.timeline > GBO.defaults.maxTimelineEntries do
        table.remove(sorter.timeline, 1)
    end
end

local function primaryLess(left, right)
    if left.itemLevel ~= right.itemLevel then
        return left.itemLevel > right.itemLevel
    end
    if left.sellPrice ~= right.sellPrice then
        return left.sellPrice > right.sellPrice
    end
    if left.name ~= right.name then
        return left.name < right.name
    end
    if left.itemID ~= right.itemID then
        return left.itemID < right.itemID
    end
    if left.count ~= right.count then
        return left.count < right.count
    end
    return left.slot < right.slot
end

-- This follows the familiar default bag-sort ordering used by ElvUI on Mists:
-- partial stacks of the same item first, then quality, item class/subclass,
-- equipment slot, item level, vendor value, and item name.
local function defaultSortItemLess(left, right)
    if left.itemID == right.itemID then
        if left.count ~= right.count then
            return left.count < right.count
        end
        return left.slot < right.slot
    end

    if left.quality ~= right.quality then
        return left.quality > right.quality
    end
    if left.classID ~= right.classID then
        return left.classID < right.classID
    end

    if left.classID == ITEM_CLASS_ARMOR or left.classID == ITEM_CLASS_WEAPON then
        local leftEquip = inventoryOrder[left.equipLoc] or -1
        local rightEquip = inventoryOrder[right.equipLoc] or -1
        if leftEquip ~= rightEquip then
            return leftEquip < rightEquip
        end
        return primaryLess(left, right)
    end

    if left.subclassID ~= right.subclassID then
        return left.subclassID < right.subclassID
    end
    return primaryLess(left, right)
end

function GBO:SortItemLess(left, right)
    if self.db and self.db.settings and self.db.settings.sortInverted then
        return defaultSortItemLess(right, left)
    end
    return defaultSortItemLess(left, right)
end

local function readItemMetadata(item)
    if not getItemInfo then
        return nil
    end

    local name, _, quality, itemLevel, _, _, _, maxStack, equipLoc, _, sellPrice,
        classID, subclassID = getItemInfo(item.link or item.itemID)
    if not name then
        return nil
    end

    item.name = name
    item.quality = quality or item.quality or 0
    item.itemLevel = itemLevel or 0
    item.maxStack = maxStack or 1
    item.equipLoc = equipLoc or ""
    item.sellPrice = sellPrice or 0
    item.classID = classID or 99
    item.subclassID = subclassID or 99
    return item
end

function GBO:ReadSortSnapshot(tab)
    local snapshot = {
        tab = tab,
        items = {},
        bySlot = {},
        empty = 0,
        locked = 0,
        missingItemInfo = 0,
    }

    for slot = 1, self.MAX_SLOTS do
        local item = self:ReadSlot(tab, slot)
        if item.link then
            if item.locked then
                snapshot.locked = snapshot.locked + 1
            end
            if not readItemMetadata(item) then
                snapshot.missingItemInfo = snapshot.missingItemInfo + 1
            end
            snapshot.bySlot[slot] = item
            table.insert(snapshot.items, item)
        else
            snapshot.empty = snapshot.empty + 1
        end
    end

    return snapshot
end

local function sameIdentity(left, right)
    if not left or not right then
        return left == nil and right == nil
    end
    return left.itemID == right.itemID and left.count == right.count
end

local function sameStackableItem(left, right)
    return left and right
        and left.itemID == right.itemID
        and left.link == right.link
end

function GBO:FindStackMove(snapshot)
    for targetSlot = 1, self.MAX_SLOTS do
        local target = snapshot.bySlot[targetSlot]
        if target and target.maxStack > 1 and target.count < target.maxStack then
            for sourceSlot = self.MAX_SLOTS, 1, -1 do
                local source = snapshot.bySlot[sourceSlot]
                if sourceSlot ~= targetSlot
                    and sameStackableItem(source, target)
                    and source.count < source.maxStack
                then
                    local amount = math.min(source.count, target.maxStack - target.count)
                    if amount > 0 then
                        return {
                            kind = "stack",
                            source = sourceSlot,
                            target = targetSlot,
                            amount = amount,
                            split = amount < source.count,
                            sourceItem = source,
                            targetItem = target,
                        }
                    end
                end
            end
        end
    end
end

function GBO:FindOrderMove(snapshot)
    local desired = {}
    for index = 1, #snapshot.items do
        desired[index] = snapshot.items[index]
    end
    table.sort(desired, function(left, right)
        return self:SortItemLess(left, right)
    end)

    for destination = 1, #desired do
        local wanted = desired[destination]
        local current = snapshot.bySlot[destination]
        if not sameIdentity(current, wanted) then
            for source = destination + 1, self.MAX_SLOTS do
                if sameIdentity(snapshot.bySlot[source], wanted) then
                    return {
                        kind = "sort",
                        source = source,
                        target = destination,
                        sourceItem = snapshot.bySlot[source],
                        targetItem = current,
                    }
                end
            end
        end
    end
end

local function copyItem(item)
    if not item then
        return nil
    end

    local copy = {}
    for key, value in pairs(item) do
        copy[key] = value
    end
    return copy
end

local function rebuildVirtualSnapshot(snapshot)
    snapshot.items = {}
    snapshot.empty = 0
    for slot = 1, GBO.MAX_SLOTS do
        local item = snapshot.bySlot[slot]
        if item then
            item.slot = slot
            table.insert(snapshot.items, item)
        else
            snapshot.empty = snapshot.empty + 1
        end
    end
end

local function cloneSnapshot(snapshot)
    local copy = {
        tab = snapshot.tab,
        items = {},
        bySlot = {},
        empty = snapshot.empty,
        locked = 0,
        missingItemInfo = 0,
    }
    for slot = 1, GBO.MAX_SLOTS do
        if snapshot.bySlot[slot] then
            copy.bySlot[slot] = copyItem(snapshot.bySlot[slot])
        end
    end
    rebuildVirtualSnapshot(copy)
    return copy
end

local function applyVirtualMove(snapshot, move)
    if move.kind == "stack" then
        local source = snapshot.bySlot[move.source]
        local target = snapshot.bySlot[move.target]
        source.count = source.count - move.amount
        target.count = target.count + move.amount
        if source.count <= 0 then
            snapshot.bySlot[move.source] = nil
        end
    else
        local source = snapshot.bySlot[move.source]
        local target = snapshot.bySlot[move.target]
        snapshot.bySlot[move.source] = target
        snapshot.bySlot[move.target] = source
    end
    rebuildVirtualSnapshot(snapshot)
end

function GBO:EstimateSortMoves(snapshot)
    local virtual = cloneSnapshot(snapshot)
    for count = 0, self.defaults.sortMaxMoves do
        local move = self:FindStackMove(virtual)
        if not move then
            move = self:FindOrderMove(virtual)
        end
        if not move then
            return count
        end
        if count == self.defaults.sortMaxMoves then
            return nil
        end
        applyVirtualMove(virtual, move)
    end
end

local function expectedItem(item, count)
    if not item or not count or count <= 0 then
        return nil
    end
    return {
        itemID = item.itemID,
        count = count,
    }
end

local function buildExpected(move)
    if move.kind == "stack" then
        return {
            [move.source] = expectedItem(
                move.sourceItem,
                move.sourceItem.count - move.amount
            ),
            [move.target] = expectedItem(
                move.targetItem,
                move.targetItem.count + move.amount
            ),
        }
    end

    return {
        [move.source] = expectedItem(
            move.targetItem,
            move.targetItem and move.targetItem.count
        ),
        [move.target] = expectedItem(move.sourceItem, move.sourceItem.count),
    }
end

local function slotMatchesExpected(slot, expected)
    if not expected then
        return GBO:IsEmpty(slot)
    end
    return slot.itemID == expected.itemID and slot.count == expected.count
end

local function buildReport(ok, reason)
    local client = GBO.client or {}
    local tabName = GetGuildBankTabInfo(sorter.tab)
    local lines = {
        "Guild Bank Organizer sort report",
        string.format("addon=%s", GBO.version),
        string.format(
            "client=%s build=%s interface=%s",
            tostring(client.version or "?"),
            tostring(client.build or "?"),
            tostring(client.interfaceVersion or "?")
        ),
        string.format("locale=%s", tostring(GetLocale and GetLocale() or "?")),
        string.format("realm=%s player=%s", tostring(GetRealmName()), tostring(UnitName("player"))),
        string.format(
            "result=%s stage=%s reason=%s",
            ok and "PASS" or "FAIL",
            tostring(sorter.stage or "?"),
            tostring(reason)
        ),
        string.format(
            "tab=%d name=%s initialItems=%d cadence=%.2fs direction=%s estimated=%s issued=%d confirmed=%d stacked=%d sorted=%d average=%.2fs",
            sorter.tab,
            tostring(tabName or "?"),
            sorter.initialItems or 0,
            sorter.cadence,
            GBO.db and GBO.db.settings and GBO.db.settings.sortInverted and "reverse" or "normal",
            tostring(sorter.estimatedTotal or "?"),
            sorter.issued,
            sorter.confirmedMoves,
            sorter.stacked,
            sorter.sorted,
            sorter.averageMoveSeconds or sorter.cadence
        ),
        string.format("slotEvents=%d uiErrors=%d %s", sorter.slotEvents, #sorter.uiErrors, GBO:GetLatencySummary()),
        "timeline:",
    }

    for index = 1, #sorter.timeline do
        table.insert(lines, sorter.timeline[index])
    end

    local report = table.concat(lines, "\n")
    return report, {
        type = "sort",
        savedAt = GetServerTime(),
        ok = ok,
        reason = reason,
        tab = sorter.tab,
        cadence = sorter.cadence,
        issuedMoves = sorter.issued,
        confirmedMoves = sorter.confirmedMoves,
        estimatedMoves = sorter.estimatedTotal,
        averageMoveSeconds = sorter.averageMoveSeconds,
        stackedMoves = sorter.stacked,
        sortedMoves = sorter.sorted,
        slotEvents = sorter.slotEvents,
        uiErrors = sorter.uiErrors,
        report = report,
    }
end

local function finishSort(ok, reason)
    if not sorter.running then
        return
    end

    addTimeline(string.format("FINISH %s: %s", ok and "PASS" or "FAIL", tostring(reason)))
    local report, savedRun = buildReport(ok, reason)
    sorter.running = false
    sorter.generation = sorter.generation + 1
    GBO.lastReport = report
    GBO.lastOutcome = {
        ok = ok,
        reason = reason,
        type = "sort",
    }
    GBO:SaveRun(savedRun)
    GBO:Print(string.format(
        "%s: %s. %d moves (%d stack, %d sort).",
        ok and "Sort complete" or "Sort stopped",
        tostring(reason),
        sorter.issued,
        sorter.stacked,
        sorter.sorted
    ))
    GBO:Print("Use /gbo report to copy the full sort timeline.")
end

local function schedule(delay, callback)
    local generation = sorter.generation
    C_Timer.After(delay, function()
        if sorter.running and sorter.generation == generation then
            callback()
        end
    end)
end

local function failAfterBackoff(reason)
    if not sorter.running then
        return
    end

    sorter.stage = "recovering"
    sorter.failureReason = reason
    addTimeline(string.format(
        "backing off %.1fs before final refresh: %s",
        GBO.defaults.sortFailureBackoff,
        tostring(reason)
    ))
    schedule(GBO.defaults.sortFailureBackoff, function()
        if GBO:IsBankOpen() then
            QueryGuildBankTab(sorter.tab)
            schedule(0.5, function()
                finishSort(false, sorter.failureReason)
            end)
        else
            finishSort(false, sorter.failureReason)
        end
    end)
end

local function readExpectedState()
    local source = GBO:ReadSlot(sorter.tab, sorter.move.source)
    local target = GBO:ReadSlot(sorter.tab, sorter.move.target)
    return source, target,
        slotMatchesExpected(source, sorter.expected[sorter.move.source])
        and slotMatchesExpected(target, sorter.expected[sorter.move.target])
end

function GBO:CheckSortMove()
    if not sorter.running or sorter.stage ~= "waiting" then
        return
    end
    if not self:IsBankOpen() then
        finishSort(false, "guild bank closed while sorting")
        return
    end
    if GetCurrentGuildBankTab() ~= sorter.tab then
        finishSort(false, "selected guild-bank tab changed")
        return
    end
    if self:GetCursorType() then
        ClearCursor()
        failAfterBackoff("cursor was occupied while confirming a move")
        return
    end

    local source, target, matches = readExpectedState()
    if not source.locked and not target.locked and matches then
        addTimeline(string.format(
            "confirmed move %d: %s | %s",
            sorter.issued,
            self:DescribeSlot(source),
            self:DescribeSlot(target)
        ))
        local confirmationSeconds = sorter.moveIssuedAt
            and math.max(0, now() - sorter.moveIssuedAt)
            or sorter.cadence
        sorter.confirmedMoves = sorter.confirmedMoves + 1
        sorter.totalMoveSeconds = sorter.totalMoveSeconds + confirmationSeconds
        sorter.averageMoveSeconds = sorter.totalMoveSeconds / sorter.confirmedMoves
        sorter.move = nil
        sorter.expected = nil
        sorter.waitStarted = nil
        sorter.moveIssuedAt = nil
        if sorter.stopRequested then
            finishSort(false, "stopped by user after the active move settled")
        else
            self:PlanNextSortMove()
        end
        return
    end

    sorter.waitStarted = sorter.waitStarted or now()
    if now() - sorter.waitStarted >= self.defaults.operationTimeout then
        addTimeline("confirmation timeout: " .. self:DescribeSlot(source) .. " | " .. self:DescribeSlot(target))
        failAfterBackoff("move did not reach its expected unlocked state")
        return
    end

    schedule(0.10, function()
        GBO:CheckSortMove()
    end)
end

function GBO:IssueSortMove(move)
    if not sorter.running then
        return
    end
    if sorter.issued >= self.defaults.sortMaxMoves then
        finishSort(false, "move safety limit reached")
        return
    end
    if InCombatLockdown and InCombatLockdown() then
        finishSort(false, "combat started while sorting")
        return
    end

    local source = self:ReadSlot(sorter.tab, move.source)
    local target = self:ReadSlot(sorter.tab, move.target)
    if source.locked or target.locked then
        failAfterBackoff("source or destination became locked before a move")
        return
    end
    if not sameIdentity(source, move.sourceItem)
        or not sameIdentity(target.link and target or nil, move.targetItem)
    then
        failAfterBackoff("tab contents changed before a planned move")
        return
    end
    if self:GetCursorType() then
        failAfterBackoff("cursor must be empty before sorting")
        return
    end

    addTimeline(string.format(
        "issue %d %s: T%d/S%d -> S%d%s",
        sorter.issued + 1,
        move.kind,
        sorter.tab,
        move.source,
        move.target,
        move.split and (" amount=" .. move.amount) or ""
    ))

    if move.split then
        SplitGuildBankItem(sorter.tab, move.source, move.amount)
    else
        PickupGuildBankItem(sorter.tab, move.source)
    end

    if not self:GetCursorType() then
        failAfterBackoff("pickup did not place the expected item on the cursor")
        return
    end

    PickupGuildBankItem(sorter.tab, move.target)
    sorter.issued = sorter.issued + 1
    sorter.moveIssuedAt = now()
    if move.kind == "stack" then
        sorter.stacked = sorter.stacked + 1
    else
        sorter.sorted = sorter.sorted + 1
    end

    if self:GetCursorType() then
        addTimeline("drop left an item on the cursor; clearing it and stopping")
        ClearCursor()
        failAfterBackoff("drop left an item on the cursor")
        return
    end

    sorter.move = move
    sorter.expected = buildExpected(move)
    sorter.waitStarted = now()
    sorter.stage = "waiting"
    schedule(sorter.cadence, function()
        GBO:CheckSortMove()
    end)
end

local function finalVerify()
    if not sorter.running or sorter.stage ~= "verifying" then
        return
    end

    local snapshot = GBO:ReadSortSnapshot(sorter.tab)
    if snapshot.locked > 0 then
        failAfterBackoff("slots remained locked during final verification")
        return
    end
    if snapshot.missingItemInfo > 0 then
        failAfterBackoff("item information was unavailable during final verification")
        return
    end

    local stackMove = GBO:FindStackMove(snapshot)
    local orderMove = not stackMove and GBO:FindOrderMove(snapshot)
    if stackMove or orderMove then
        addTimeline("final refresh found more work; resuming the convergent sort")
        sorter.stage = "planning"
        GBO:PlanNextSortMove()
        return
    end

    finishSort(true, "tab is stacked, compacted, and sorted")
end

local function settleAndVerify()
    sorter.stage = "settling"
    sorter.finalizeStartedAt = now()
    addTimeline(string.format("settling %.1fs before final server-truth query", GBO.defaults.settleDelay))
    schedule(GBO.defaults.settleDelay, function()
        sorter.stage = "verifying"
        sorter.verifyScheduled = false
        QueryGuildBankTab(sorter.tab)
        schedule(GBO.defaults.scanQueryTimeout, function()
            if sorter.stage == "verifying" and not sorter.verifyScheduled then
                sorter.verifyScheduled = true
                addTimeline("final query timed out; checking cached state")
                finalVerify()
            end
        end)
    end)
end

function GBO:PlanNextSortMove()
    if not sorter.running then
        return
    end
    if sorter.stopRequested then
        finishSort(false, "stopped by user")
        return
    end
    if not self:IsBankOpen() then
        finishSort(false, "guild bank closed while sorting")
        return
    end
    if GetCurrentGuildBankTab() ~= sorter.tab then
        finishSort(false, "selected guild-bank tab changed")
        return
    end
    if InCombatLockdown and InCombatLockdown() then
        finishSort(false, "combat started while sorting")
        return
    end

    sorter.stage = "planning"
    local snapshot = self:ReadSortSnapshot(sorter.tab)
    if snapshot.locked > 0 then
        sorter.lockWaitStarted = sorter.lockWaitStarted or now()
        if now() - sorter.lockWaitStarted < self.defaults.operationTimeout then
            schedule(0.10, function()
                GBO:PlanNextSortMove()
            end)
        else
            failAfterBackoff("one or more guild-bank slots remained locked")
        end
        return
    end
    sorter.lockWaitStarted = nil

    if snapshot.missingItemInfo > 0 then
        sorter.infoWaitStarted = sorter.infoWaitStarted or now()
        if now() - sorter.infoWaitStarted < self.defaults.operationTimeout then
            QueryGuildBankTab(sorter.tab)
            schedule(0.25, function()
                GBO:PlanNextSortMove()
            end)
        else
            finishSort(false, "item information could not be loaded")
        end
        return
    end
    sorter.infoWaitStarted = nil

    local estimatedRemaining = self:EstimateSortMoves(snapshot)
    if estimatedRemaining then
        local priorTotal = sorter.estimatedTotal
        sorter.estimatedRemaining = estimatedRemaining
        sorter.estimatedTotal = sorter.confirmedMoves + estimatedRemaining
        if not sorter.initialEstimate then
            sorter.initialEstimate = sorter.estimatedTotal
            addTimeline(string.format(
                "plan estimated %d moves; approximately %s including final verification",
                sorter.estimatedTotal,
                self:FormatSortDuration(
                    sorter.estimatedTotal * sorter.cadence
                    + self.defaults.settleDelay
                    + 0.5
                )
            ))
            self:Print(string.format(
                "Plan: %d moves, about %s including the final check.",
                sorter.estimatedTotal,
                self:FormatSortDuration(
                    sorter.estimatedTotal * sorter.cadence
                    + self.defaults.settleDelay
                    + 0.5
                )
            ))
        elseif priorTotal ~= sorter.estimatedTotal then
            addTimeline(string.format(
                "plan refined from %s to %d estimated moves",
                tostring(priorTotal or "?"),
                sorter.estimatedTotal
            ))
        end
    end

    local move = self:FindStackMove(snapshot)
    if not move then
        move = self:FindOrderMove(snapshot)
    end
    if move then
        self:IssueSortMove(move)
    else
        settleAndVerify()
    end
end

local function preflight()
    if not sorter.running or sorter.stage ~= "preflight" then
        return
    end

    local name, _, isViewable, canDeposit, numWithdrawals, remainingWithdrawals =
        GetGuildBankTabInfo(sorter.tab)
    addTimeline(string.format(
        "preflight tab=%s view=%s deposit=%s withdrawals=%s remaining=%s",
        tostring(name),
        tostring(isViewable),
        tostring(canDeposit),
        tostring(numWithdrawals),
        tostring(remainingWithdrawals)
    ))

    if not isViewable then
        finishSort(false, "tab is not viewable")
        return
    end
    if numWithdrawals == nil or remainingWithdrawals == nil then
        finishSort(false, "could not confirm guild-bank withdrawal permissions")
        return
    end
    if not canDeposit or numWithdrawals == 0 or remainingWithdrawals == 0 then
        finishSort(false, "tab needs deposit and available withdrawal permission")
        return
    end
    if GBO:GetCursorType() then
        finishSort(false, "cursor must be empty before sorting")
        return
    end

    local snapshot = GBO:ReadSortSnapshot(sorter.tab)
    addTimeline(string.format(
        "snapshot occupied=%d empty=%d locked=%d missingInfo=%d",
        #snapshot.items,
        snapshot.empty,
        snapshot.locked,
        snapshot.missingItemInfo
    ))
    sorter.initialItems = #snapshot.items
    GBO:PlanNextSortMove()
end

function GBO:StartSort(tab, cadence)
    if sorter.running then
        self:Print("A guild-bank sort is already running.")
        return false
    end
    if self:IsDiagnosticRunning() or self:IsScanRunning() then
        self:Print("Stop or finish the current guild-bank operation first.")
        return false
    end
    if self.IsDepositRunning and (self:IsDepositRunning() or self:IsDepositScanning()) then
        self:Print("Stop or finish Smart Deposit first.")
        return false
    end
    if not self:IsBankOpen() then
        self:Print("Open the guild bank first.")
        return false
    end
    if InCombatLockdown and InCombatLockdown() then
        self:Print("Guild-bank sorting cannot start during combat.")
        return false
    end

    tab = tonumber(tab) or GetCurrentGuildBankTab()
    cadence = tonumber(cadence)
        or (self.db and self.db.settings and self.db.settings.sortCadence)
        or self.defaults.cadence

    if not tab or tab < 1 or tab > GetNumGuildBankTabs() then
        self:Print("Select a purchased guild-bank tab first.")
        return false
    end
    if GetCurrentGuildBankTab() ~= tab then
        self:Print(string.format("Select guild-bank tab %d before sorting it.", tab))
        return false
    end
    if cadence < self.defaults.sortMinimumCadence or cadence > 5.0 then
        self:Print(string.format(
            "Sort cadence must be between %.2f and 5.00 seconds.",
            self.defaults.sortMinimumCadence
        ))
        return false
    end

    sorter.generation = sorter.generation + 1
    sorter.running = true
    sorter.stage = "preflight"
    sorter.startedAt = now()
    sorter.tab = tab
    sorter.cadence = cadence
    sorter.issued = 0
    sorter.confirmedMoves = 0
    sorter.totalMoveSeconds = 0
    sorter.averageMoveSeconds = nil
    sorter.estimatedRemaining = nil
    sorter.estimatedTotal = nil
    sorter.initialEstimate = nil
    sorter.stacked = 0
    sorter.sorted = 0
    sorter.slotEvents = 0
    sorter.uiErrors = {}
    sorter.timeline = {}
    sorter.move = nil
    sorter.expected = nil
    sorter.waitStarted = nil
    sorter.moveIssuedAt = nil
    sorter.finalizeStartedAt = nil
    sorter.lockWaitStarted = nil
    sorter.infoWaitStarted = nil
    sorter.stopRequested = nil
    sorter.preflightScheduled = false
    sorter.verifyScheduled = false
    self.lastOutcome = nil

    addTimeline("sort requested; querying selected tab before preflight")
    self:Print(string.format(
        "Sorting guild-bank tab %d at %.2f seconds per move. Leave the tab selected.",
        tab,
        cadence
    ))
    QueryGuildBankTab(tab)
    schedule(self.defaults.scanQueryTimeout, function()
        if sorter.stage == "preflight" and not sorter.preflightScheduled then
            sorter.preflightScheduled = true
            addTimeline("preflight query timed out; checking cached state")
            preflight()
        end
    end)
    return true
end

function GBO:StartSortCurrentTab()
    return self:StartSort()
end

function GBO:AbortSort(reason)
    if not sorter.running then
        return
    end
    sorter.stopRequested = true
    addTimeline("stop requested: " .. tostring(reason or "cancelled"))
    if sorter.stage ~= "waiting" then
        finishSort(false, reason or "stopped by user")
    end
end

function GBO:IsSortRunning()
    return sorter.running
end

function GBO:FormatSortDuration(seconds)
    seconds = math.max(0, math.ceil(tonumber(seconds) or 0))
    if seconds < 60 then
        return string.format("%ds", seconds)
    end

    local minutes = math.floor(seconds / 60)
    local remainder = seconds % 60
    if minutes < 60 then
        return string.format("%dm %02ds", minutes, remainder)
    end

    local hours = math.floor(minutes / 60)
    return string.format("%dh %02dm", hours, minutes % 60)
end

function GBO:GetSortProgress()
    if not sorter.running then
        return nil
    end

    local total = sorter.estimatedTotal
    local completed = sorter.confirmedMoves or 0
    local remaining = total and math.max(0, total - completed) or nil
    local secondsPerMove = math.max(
        sorter.cadence or self.defaults.cadence,
        sorter.averageMoveSeconds or 0
    )
    local eta

    if sorter.stage == "settling" then
        eta = math.max(
            0,
            self.defaults.settleDelay - (now() - (sorter.finalizeStartedAt or now()))
        ) + 0.5
    elseif sorter.stage == "verifying" then
        eta = 0.5
    elseif sorter.stage ~= "recovering" and remaining then
        eta = remaining * secondsPerMove + self.defaults.settleDelay + 0.5
        if sorter.stage == "waiting" and sorter.moveIssuedAt and remaining > 0 then
            eta = math.max(0.1, secondsPerMove - (now() - sorter.moveIssuedAt))
                + math.max(0, remaining - 1) * secondsPerMove
                + self.defaults.settleDelay
                + 0.5
        end
    end

    return {
        stage = sorter.stage,
        total = total,
        completed = completed,
        remaining = remaining,
        percent = total and total > 0 and completed / total or 0,
        etaSeconds = eta,
        etaText = eta and self:FormatSortDuration(eta) or nil,
        secondsPerMove = secondsPerMove,
        issued = sorter.issued,
        stacked = sorter.stacked,
        sorted = sorter.sorted,
    }
end

function GBO:GetSortStatus()
    if not sorter.running then
        return "Ready to sort the selected tab."
    end
    local stageNames = {
        preflight = "Preparing",
        planning = "Planning",
        waiting = "Sorting",
        settling = "Finalizing",
        verifying = "Verifying",
        recovering = "Recovering",
    }
    local progress = self:GetSortProgress()
    if progress and progress.total then
        return string.format(
            "%s • %d of %d moves confirmed",
            stageNames[sorter.stage] or tostring(sorter.stage),
            progress.completed,
            progress.total
        )
    end
    return string.format("%s • calculating moves and ETA", stageNames[sorter.stage] or tostring(sorter.stage))
end

GBO:On("GUILDBANKBAGSLOTS_CHANGED", function()
    if not sorter.running then
        return
    end

    sorter.slotEvents = sorter.slotEvents + 1
    if sorter.stage == "preflight" and not sorter.preflightScheduled then
        sorter.preflightScheduled = true
        schedule(0.25, preflight)
    elseif sorter.stage == "verifying" and not sorter.verifyScheduled then
        sorter.verifyScheduled = true
        schedule(0.25, finalVerify)
    end
end)

GBO:On("UI_ERROR_MESSAGE", function(_, errorType, message)
    if sorter.running then
        table.insert(sorter.uiErrors, string.format("%s: %s", tostring(errorType), tostring(message)))
    end
end)
