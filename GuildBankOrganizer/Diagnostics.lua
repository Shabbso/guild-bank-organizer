local _, GBO = ...

local diagnostic = {
    running = false,
    generation = 0,
}

local function now()
    return GetTime()
end

local function addTimeline(message)
    if not diagnostic.running then
        return
    end

    local elapsed = now() - diagnostic.startedAt
    local entry = string.format("%8.3f  %s", elapsed, tostring(message))
    table.insert(diagnostic.timeline, entry)

    while #diagnostic.timeline > GBO.defaults.maxTimelineEntries do
        table.remove(diagnostic.timeline, 1)
    end
end

local function snapshotPair()
    return GBO:ReadSlot(diagnostic.tab, diagnostic.originalSlot),
        GBO:ReadSlot(diagnostic.tab, diagnostic.otherSlot)
end

local function expectedReady()
    local source = GBO:ReadSlot(diagnostic.tab, diagnostic.activeSource)
    local target = GBO:ReadSlot(diagnostic.tab, diagnostic.activeTarget)

    if source.locked or target.locked then
        return false, "source or destination is locked", source, target
    end
    if not GBO:MatchesTrackedItem(source, diagnostic.item) then
        return false, "tracked item is not in the expected source", source, target
    end
    if not GBO:IsEmpty(target) then
        return false, "expected destination is not empty", source, target
    end
    return true, nil, source, target
end

local function buildReport(ok, reason)
    local client = GBO.client or {}
    local lines = {
        "Guild Bank Organizer diagnostic report",
        string.format("addon=%s", GBO.version),
        string.format(
            "client=%s build=%s interface=%s",
            tostring(client.version or "?"),
            tostring(client.build or "?"),
            tostring(client.interfaceVersion or "?")
        ),
        string.format("locale=%s", tostring(GetLocale and GetLocale() or "?")),
        string.format("realm=%s player=%s", tostring(GetRealmName()), tostring(UnitName("player"))),
        string.format("result=%s reason=%s", ok and "PASS" or "FAIL", tostring(reason)),
        string.format(
            "tab=%d original=%d other=%d cadence=%.2fs requested=%d issued=%d corrective=%d",
            diagnostic.tab,
            diagnostic.originalSlot,
            diagnostic.otherSlot,
            diagnostic.cadence,
            diagnostic.totalMoves,
            diagnostic.issued,
            diagnostic.correctiveMoves
        ),
        string.format(
            "slotEvents=%d lockEvents=%d uiErrors=%d blockedPolls=%d %s",
            diagnostic.slotEvents,
            diagnostic.lockEvents,
            #diagnostic.uiErrors,
            diagnostic.blockedPolls,
            GBO:GetLatencySummary()
        ),
        "timeline:",
    }

    for index = 1, #diagnostic.timeline do
        table.insert(lines, diagnostic.timeline[index])
    end

    return table.concat(lines, "\n"), {
        savedAt = GetServerTime(),
        ok = ok,
        reason = reason,
        tab = diagnostic.tab,
        originalSlot = diagnostic.originalSlot,
        otherSlot = diagnostic.otherSlot,
        cadence = diagnostic.cadence,
        requestedMoves = diagnostic.totalMoves,
        issuedMoves = diagnostic.issued,
        correctiveMoves = diagnostic.correctiveMoves,
        slotEvents = diagnostic.slotEvents,
        lockEvents = diagnostic.lockEvents,
        uiErrors = diagnostic.uiErrors,
        blockedPolls = diagnostic.blockedPolls,
        report = table.concat(lines, "\n"),
    }
end

local function finishDiagnostic(ok, reason)
    if not diagnostic.running then
        return
    end

    addTimeline(string.format("FINISH %s: %s", ok and "PASS" or "FAIL", tostring(reason)))
    local report, savedRun = buildReport(ok, reason)
    diagnostic.running = false
    diagnostic.generation = diagnostic.generation + 1
    GBO.lastReport = report
    GBO.lastOutcome = {
        ok = ok,
        reason = reason,
    }
    GBO:SaveRun(savedRun)

    GBO:Print(string.format(
        "%s: %s. Issued %d/%d moves; %d slot events, %d lock events, %d UI errors.",
        ok and "Diagnostic passed" or "Diagnostic failed",
        tostring(reason),
        diagnostic.issued,
        diagnostic.totalMoves,
        diagnostic.slotEvents,
        diagnostic.lockEvents,
        #diagnostic.uiErrors
    ))
    GBO:Print("Use /gbo report to copy the full timeline.")
end

local function verifyRestored()
    if not diagnostic.running then
        return
    end

    local original, other = snapshotPair()
    addTimeline("restore check: " .. GBO:DescribeSlot(original) .. " | " .. GBO:DescribeSlot(other))

    if original.locked or other.locked then
        diagnostic.restoreWaitStarted = diagnostic.restoreWaitStarted or now()
        if now() - diagnostic.restoreWaitStarted < GBO.defaults.operationTimeout then
            local generation = diagnostic.generation
            C_Timer.After(0.10, function()
                if diagnostic.running and diagnostic.generation == generation then
                    verifyRestored()
                end
            end)
        else
            finishDiagnostic(false, "final slots remained locked; no corrective move was attempted")
        end
        return
    end
    diagnostic.restoreWaitStarted = nil

    if GBO:MatchesTrackedItem(original, diagnostic.item) and GBO:IsEmpty(other) then
        if diagnostic.abortReason then
            finishDiagnostic(false, diagnostic.abortReason .. "; item returned to its original slot")
        else
            finishDiagnostic(true, "item returned to its original slot")
        end
        return
    end

    if GBO:IsEmpty(original)
        and GBO:MatchesTrackedItem(other, diagnostic.item)
        and diagnostic.correctiveMoves < 2
    then
        if diagnostic.restoreNotBefore and now() < diagnostic.restoreNotBefore then
            if not diagnostic.restoreBackoffScheduled then
                diagnostic.restoreBackoffScheduled = true
                local delay = diagnostic.restoreNotBefore - now()
                addTimeline(string.format(
                    "waiting %.3fs before the first corrective move",
                    delay
                ))
                local generation = diagnostic.generation
                C_Timer.After(delay, function()
                    if diagnostic.running and diagnostic.generation == generation then
                        diagnostic.restoreBackoffScheduled = false
                        QueryGuildBankTab(diagnostic.tab)
                        C_Timer.After(0.5, function()
                            if diagnostic.running and diagnostic.generation == generation then
                                verifyRestored()
                            end
                        end)
                    end
                end)
            end
            return
        end

        diagnostic.correctiveMoves = diagnostic.correctiveMoves + 1
        addTimeline(string.format(
            "corrective move %d: T%d/S%d -> T%d/S%d",
            diagnostic.correctiveMoves,
            diagnostic.tab,
            diagnostic.otherSlot,
            diagnostic.tab,
            diagnostic.originalSlot
        ))
        PickupGuildBankItem(diagnostic.tab, diagnostic.otherSlot)
        PickupGuildBankItem(diagnostic.tab, diagnostic.originalSlot)
        if GBO:GetCursorType() then
            addTimeline("corrective drop left the cursor occupied; clearing it back to origin")
            ClearCursor()
        end

        local generation = diagnostic.generation
        C_Timer.After(GBO.defaults.settleDelay, function()
            if diagnostic.running and diagnostic.generation == generation then
                QueryGuildBankTab(diagnostic.tab)
                C_Timer.After(0.5, function()
                    if diagnostic.running and diagnostic.generation == generation then
                        verifyRestored()
                    end
                end)
            end
        end)
        return
    end

    finishDiagnostic(false, "final slots did not match and could not be restored safely")
end

local function settleAndVerify()
    if not diagnostic.running then
        return
    end

    diagnostic.stage = "settling"
    addTimeline(string.format("settling for %.1fs before server-truth query", GBO.defaults.settleDelay))
    local generation = diagnostic.generation
    C_Timer.After(GBO.defaults.settleDelay, function()
        if not diagnostic.running or diagnostic.generation ~= generation then
            return
        end
        diagnostic.stage = "refreshing"
        diagnostic.refreshScheduled = false
        addTimeline("QueryGuildBankTab for final verification")
        QueryGuildBankTab(diagnostic.tab)

        C_Timer.After(GBO.defaults.scanQueryTimeout, function()
            if diagnostic.running
                and diagnostic.generation == generation
                and diagnostic.stage == "refreshing"
                and not diagnostic.refreshScheduled
            then
                diagnostic.refreshScheduled = true
                addTimeline("final query timed out; verifying cached state")
                verifyRestored()
            end
        end)
    end)
end

local function scheduleOperation(delay)
    local generation = diagnostic.generation
    C_Timer.After(delay, function()
        if diagnostic.running and diagnostic.generation == generation then
            GBO:RunDiagnosticOperation()
        end
    end)
end

function GBO:RunDiagnosticOperation()
    if not diagnostic.running or diagnostic.stage ~= "moving" then
        return
    end
    if not self:IsBankOpen() then
        self:AbortDiagnostic("bank closed")
        return
    end

    local cursorType = self:GetCursorType()
    if cursorType then
        self:AbortDiagnostic("cursor is holding " .. tostring(cursorType))
        return
    end

    if diagnostic.issued >= diagnostic.totalMoves then
        settleAndVerify()
        return
    end

    local ready, reason, source, target = expectedReady()
    if not ready then
        diagnostic.blockedPolls = diagnostic.blockedPolls + 1
        if not diagnostic.blockedSince then
            diagnostic.blockedSince = now()
            addTimeline(
                "waiting: " .. reason .. " | "
                .. self:DescribeSlot(source) .. " | " .. self:DescribeSlot(target)
            )
        end

        if now() - diagnostic.blockedSince >= self.defaults.operationTimeout then
            self:AbortDiagnostic("operation timed out: " .. reason)
            return
        end

        scheduleOperation(0.10)
        return
    end

    if diagnostic.blockedSince then
        addTimeline(string.format("expected state became ready after %.3fs", now() - diagnostic.blockedSince))
        diagnostic.blockedSince = nil
    end

    local moveNumber = diagnostic.issued + 1
    addTimeline(string.format(
        "issue %d/%d: T%d/S%d -> T%d/S%d",
        moveNumber,
        diagnostic.totalMoves,
        diagnostic.tab,
        diagnostic.activeSource,
        diagnostic.tab,
        diagnostic.activeTarget
    ))

    PickupGuildBankItem(diagnostic.tab, diagnostic.activeSource)
    PickupGuildBankItem(diagnostic.tab, diagnostic.activeTarget)

    diagnostic.issued = moveNumber
    diagnostic.lastIssuedAt = now()
    diagnostic.activeSource, diagnostic.activeTarget =
        diagnostic.activeTarget, diagnostic.activeSource

    local postSource = self:ReadSlot(diagnostic.tab, diagnostic.activeSource)
    local postTarget = self:ReadSlot(diagnostic.tab, diagnostic.activeTarget)
    addTimeline(
        "immediate: " .. self:DescribeSlot(postSource) .. " | " .. self:DescribeSlot(postTarget)
    )

    local postCursor = self:GetCursorType()
    if postCursor then
        addTimeline("cursor remained occupied after drop; clearing it back to origin")
        ClearCursor()
        diagnostic.restoreNotBefore = now() + self.defaults.sortFailureBackoff
        self:AbortDiagnostic("drop left an item on the cursor")
        return
    end

    scheduleOperation(diagnostic.cadence)
end

local function preflightAndBegin()
    if not diagnostic.running then
        return
    end

    local name, _, isViewable, canDeposit, numWithdrawals, remainingWithdrawals =
        GetGuildBankTabInfo(diagnostic.tab)
    local source, target = snapshotPair()

    addTimeline(string.format(
        "preflight tab=%s view=%s deposit=%s withdrawals=%s remaining=%s",
        tostring(name),
        tostring(isViewable),
        tostring(canDeposit),
        tostring(numWithdrawals),
        tostring(remainingWithdrawals)
    ))
    addTimeline("preflight slots: " .. GBO:DescribeSlot(source) .. " | " .. GBO:DescribeSlot(target))

    if not isViewable then
        finishDiagnostic(false, "tab is not viewable")
        return
    end
    if numWithdrawals == nil or remainingWithdrawals == nil then
        finishDiagnostic(false, "could not confirm guild-bank withdrawal permissions")
        return
    end
    if not canDeposit or numWithdrawals == 0 or remainingWithdrawals == 0 then
        finishDiagnostic(false, "tab needs both deposit and available withdrawal permission")
        return
    end
    if source.locked or target.locked then
        finishDiagnostic(false, "source or destination is locked")
        return
    end
    if GBO:IsEmpty(source) then
        finishDiagnostic(false, "source slot is empty")
        return
    end
    if not GBO:IsEmpty(target) then
        finishDiagnostic(false, "destination slot must be empty")
        return
    end
    if GBO:GetCursorType() then
        finishDiagnostic(false, "cursor must be empty")
        return
    end

    diagnostic.item = {
        link = source.link,
        itemID = source.itemID,
        count = source.count,
    }
    diagnostic.activeSource = diagnostic.originalSlot
    diagnostic.activeTarget = diagnostic.otherSlot
    diagnostic.stage = "moving"
    addTimeline(string.format(
        "begin item:%s x%d at %.2fs cadence",
        tostring(source.itemID or "?"),
        source.count,
        diagnostic.cadence
    ))
    GBO:Print(string.format(
        "Diagnostic started: item:%s x%d, T%d/S%d <-> S%d, %d moves at %.2fs.",
        tostring(source.itemID or "?"),
        source.count,
        diagnostic.tab,
        diagnostic.originalSlot,
        diagnostic.otherSlot,
        diagnostic.totalMoves,
        diagnostic.cadence
    ))
    GBO:RunDiagnosticOperation()
end

function GBO:StartDiagnostic(tab, sourceSlot, emptySlot, cadence, moves)
    if diagnostic.running then
        self:Print("A diagnostic is already running. Use /gbo stop first.")
        return false
    end
    if self:IsScanRunning() then
        self:Print("Wait for the current scan to finish.")
        return false
    end
    if self.IsSortRunning and self:IsSortRunning() then
        self:Print("Stop the guild-bank sort before starting a diagnostic.")
        return false
    end
    if self.IsDepositRunning and (self:IsDepositRunning() or self:IsDepositScanning()) then
        self:Print("Stop or finish Smart Deposit before starting a diagnostic.")
        return false
    end
    if not self:IsBankOpen() then
        self:Print("Open the guild bank first.")
        return false
    end

    tab = tonumber(tab)
    sourceSlot = tonumber(sourceSlot)
    emptySlot = tonumber(emptySlot)
    cadence = tonumber(cadence) or self.defaults.cadence
    moves = tonumber(moves) or self.defaults.moves

    if not tab or tab < 1 or tab > GetNumGuildBankTabs() then
        self:Print("Tab must be between 1 and the number of purchased guild-bank tabs.")
        return false
    end
    if GetCurrentGuildBankTab() ~= tab then
        self:Print(string.format("Select guild-bank tab %d before starting this test.", tab))
        return false
    end
    if not sourceSlot or sourceSlot < 1 or sourceSlot > self.MAX_SLOTS
        or not emptySlot or emptySlot < 1 or emptySlot > self.MAX_SLOTS
        or sourceSlot == emptySlot
    then
        self:Print("Source and destination must be different slot numbers from 1 to 98.")
        return false
    end
    if cadence < 0.40 or cadence > 5.0 then
        self:Print("Cadence must be between 0.40 and 5.00 seconds.")
        return false
    end
    if moves < 2 or moves > 100 or moves % 2 ~= 0 then
        self:Print("Moves must be an even number between 2 and 100.")
        return false
    end

    diagnostic.generation = diagnostic.generation + 1
    diagnostic.running = true
    self.lastOutcome = nil
    diagnostic.stage = "preflight"
    diagnostic.startedAt = now()
    diagnostic.tab = tab
    diagnostic.originalSlot = sourceSlot
    diagnostic.otherSlot = emptySlot
    diagnostic.cadence = cadence
    diagnostic.totalMoves = moves
    diagnostic.issued = 0
    diagnostic.correctiveMoves = 0
    diagnostic.slotEvents = 0
    diagnostic.lockEvents = 0
    diagnostic.blockedPolls = 0
    diagnostic.blockedSince = nil
    diagnostic.uiErrors = {}
    diagnostic.timeline = {}
    diagnostic.refreshScheduled = false
    diagnostic.preflightScheduled = false
    diagnostic.abortReason = nil
    diagnostic.restoreWaitStarted = nil
    diagnostic.restoreNotBefore = nil
    diagnostic.restoreBackoffScheduled = false

    addTimeline("diagnostic requested; querying tab before preflight")
    QueryGuildBankTab(tab)
    local generation = diagnostic.generation
    C_Timer.After(self.defaults.scanQueryTimeout, function()
        if diagnostic.running and diagnostic.generation == generation
            and diagnostic.stage == "preflight"
            and not diagnostic.preflightScheduled
        then
            diagnostic.preflightScheduled = true
            addTimeline("preflight query timed out; checking cached state")
            preflightAndBegin()
        end
    end)
    return true
end

function GBO:AbortDiagnostic(reason)
    if not diagnostic.running then
        return
    end

    reason = reason or "cancelled"
    local cursorType = self:GetCursorType()
    if self:IsBankOpen() and diagnostic.item and not cursorType then
        diagnostic.abortReason = reason
        diagnostic.stage = "aborting"
        addTimeline("abort requested; attempting safe restoration")
        verifyRestored()
    else
        finishDiagnostic(false, reason)
    end
end

function GBO:IsDiagnosticRunning()
    return diagnostic.running
end

function GBO:GetDiagnosticStatus()
    if not diagnostic.running then
        return "No diagnostic is running."
    end
    return string.format(
        "Stage=%s, issued=%d/%d, cadence=%.2fs, events=%d/%d, blocked polls=%d.",
        tostring(diagnostic.stage),
        diagnostic.issued,
        diagnostic.totalMoves,
        diagnostic.cadence,
        diagnostic.slotEvents,
        diagnostic.lockEvents,
        diagnostic.blockedPolls
    )
end

GBO:On("GUILDBANKBAGSLOTS_CHANGED", function()
    if not diagnostic.running then
        return
    end

    diagnostic.slotEvents = diagnostic.slotEvents + 1
    addTimeline("event GUILDBANKBAGSLOTS_CHANGED")

    if diagnostic.stage == "preflight" and not diagnostic.preflightScheduled then
        diagnostic.preflightScheduled = true
        local generation = diagnostic.generation
        C_Timer.After(0.25, function()
            if diagnostic.running and diagnostic.generation == generation
                and diagnostic.stage == "preflight"
            then
                preflightAndBegin()
            end
        end)
    elseif diagnostic.stage == "refreshing" and not diagnostic.refreshScheduled then
        diagnostic.refreshScheduled = true
        local generation = diagnostic.generation
        C_Timer.After(0.25, function()
            if diagnostic.running and diagnostic.generation == generation then
                verifyRestored()
            end
        end)
    end
end)

GBO:On("GUILDBANK_ITEM_LOCK_CHANGED", function()
    if diagnostic.running then
        diagnostic.lockEvents = diagnostic.lockEvents + 1
        addTimeline("event GUILDBANK_ITEM_LOCK_CHANGED")
    end
end)

GBO:On("UI_ERROR_MESSAGE", function(_, errorType, message)
    if diagnostic.running then
        local entry = string.format("%s: %s", tostring(errorType), tostring(message))
        table.insert(diagnostic.uiErrors, entry)
        addTimeline("UI_ERROR_MESSAGE " .. entry)
    end
end)
