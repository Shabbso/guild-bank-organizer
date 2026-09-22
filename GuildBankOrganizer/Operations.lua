local _, GBO = ...

function GBO:ScheduleOperation(state, delay, callback)
    local generation = state.generation
    C_Timer.After(delay, function()
        if state.generation == generation
            and (state.running or state.scanning or state.active)
        then
            callback()
        end
    end)
end

function GBO:CheckBankAction(tab, withdraw, selected)
    if not self:IsBankOpen() then return false, "guild bank is closed" end
    if InCombatLockdown and InCombatLockdown() then
        return false, "combat is active"
    end
    if self:GetCursorType() then return false, "cursor must be empty" end
    if type(tab) ~= "number" or tab ~= math.floor(tab)
        or tab < 1 or tab > GetNumGuildBankTabs()
    then
        return false, "select a purchased guild-bank tab"
    end
    if selected and GetCurrentGuildBankTab() ~= tab then
        return false, "selected guild-bank tab changed"
    end
    local _, _, view, deposit, allowed, remaining = GetGuildBankTabInfo(tab)
    if not view or not deposit then return false, "tab access changed" end
    if withdraw and (allowed == nil or remaining == nil
        or allowed == 0 or remaining == 0)
    then
        return false, "tab needs available withdrawal permission"
    end
    return true
end

function GBO:AppendTimeline(state, message)
    if not state.running then return end
    table.insert(state.timeline, string.format("%8.3f  %s",
        GetTime() - state.startedAt, tostring(message)))
    while #state.timeline > self.defaults.maxTimelineEntries do
        table.remove(state.timeline, 1)
    end
end

-- WoW's slot event carries no tab or request ID. Two sequential requests
-- with post-query activity and stable, unlocked snapshots are conservative
-- evidence of a refreshed view, not a protocol-level server acknowledgement.
local pending
local lastQueryAt

function GBO:CancelBankRead(owner)
    if pending and pending.owner == owner then pending = nil end
end

function GBO:IsBankReadPending()
    return pending ~= nil
end

local function signature(tab)
    local parts = {}
    for slot = 1, GBO.MAX_SLOTS do
        local item = GBO:ReadSlot(tab, slot)
        if item.locked then return nil end
        parts[#parts + 1] = string.format("%d:%s:%d", slot,
            tostring(item.link or ""), item.count or 0)
    end
    return table.concat(parts, "\031")
end

local function finish(request, ok, reason)
    if pending ~= request then return end
    pending = nil
    request.callback(ok, reason)
end

local query
query = function(request)
    if pending ~= request then return end
    if not GBO:IsBankOpen() then
        finish(request, false, "guild bank closed during refresh")
        return
    end
    local _, _, view = GetGuildBankTabInfo(request.tab)
    if not view then
        finish(request, false, "tab is no longer viewable")
        return
    end
    -- Retain the published scanner's minimum query spacing across owners.
    local wait = lastQueryAt and GBO.defaults.scanTabDelay - (GetTime() - lastQueryAt) or 0
    if wait > 0 then
        if not request.queued then
            request.queued = true
            C_Timer.After(math.max(0.01, wait), function()
                request.queued = false
                query(request)
            end)
        end
        return
    end
    lastQueryAt = GetTime()
    request.phase = request.phase + 1
    request.events = 0
    local phase = request.phase
    GBO:AppendTimeline(request.owner, string.format("refresh T%d query %d", request.tab, phase))
    QueryGuildBankTab(request.tab)
    C_Timer.After(GBO.defaults.scanQueryTimeout, function()
        if pending == request and request.phase == phase then
            finish(request, false, "verification incomplete: bank refresh timed out")
        end
    end)
end

function GBO:ReadBankTab(owner, tab, callback)
    if self.CancelDepositPreview then self:CancelDepositPreview(owner) end
    if pending then return false, "another bank refresh is active" end
    if not self:IsBankOpen() then return false, "guild bank is closed" end
    if type(tab) ~= "number" or tab ~= math.floor(tab)
        or tab < 1 or tab > GetNumGuildBankTabs()
    then
        return false, "invalid guild-bank tab"
    end
    pending = { owner = owner, tab = tab, callback = callback, phase = 0 }
    query(pending)
    return true
end

GBO:On("GUILDBANKBAGSLOTS_CHANGED", function()
    local request = pending
    if not request or request.queued or request.phase == 0 then return end
    request.events = request.events + 1
    local phase, events = request.phase, request.events
    C_Timer.After(0.10, function()
        if pending ~= request or request.phase ~= phase
            or request.events ~= events
        then return end
        if not GBO:IsBankOpen() then
            finish(request, false, "guild bank closed during refresh")
            return
        end
        local _, _, view = GetGuildBankTabInfo(request.tab)
        if not view then
            finish(request, false, "tab is no longer viewable")
            return
        end
        local snapshot = signature(request.tab)
        if snapshot and snapshot == request.previous then
            finish(request, true)
        elseif phase >= 3 then
            finish(request, false, "verification incomplete: tab is locked or changing")
        else
            request.previous = snapshot
            query(request)
        end
    end)
end)
