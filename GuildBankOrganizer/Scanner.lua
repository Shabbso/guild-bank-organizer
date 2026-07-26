local _, GBO = ...

local scan = {
    active = false,
    generation = 0,
}

local function resetScan()
    scan.active = false
    scan.waiting = false
    scan.tabs = nil
    scan.position = nil
    scan.results = nil
    scan.callback = nil
end

local function finishScan()
    if not scan.active then
        return
    end

    local results = scan.results
    local callback = scan.callback
    resetScan()
    GBO.lastScan = results

    local occupied = 0
    local locked = 0
    for _, tabResult in pairs(results.tabs) do
        occupied = occupied + tabResult.occupied
        locked = locked + tabResult.locked
    end

    GBO:Print(string.format(
        "Scan complete: %d occupied slots across %d tabs; %d locked slots skipped.",
        occupied,
        #results.order,
        locked
    ))

    if callback then
        callback(results)
    end
end

local function readCurrentTab(via)
    if not scan.active or not scan.waiting then
        return
    end

    local tab = scan.tabs[scan.position]
    local name, icon, isViewable, canDeposit, numWithdrawals, remainingWithdrawals =
        GetGuildBankTabInfo(tab)
    local tabResult = {
        tab = tab,
        name = name,
        icon = icon,
        isViewable = isViewable and true or false,
        canDeposit = canDeposit and true or false,
        numWithdrawals = numWithdrawals,
        remainingWithdrawals = remainingWithdrawals,
        occupied = 0,
        locked = 0,
        completedVia = via,
        slots = {},
    }

    for slot = 1, GBO.MAX_SLOTS do
        local item = GBO:ReadSlot(tab, slot)
        if item.link then
            if item.locked then
                tabResult.locked = tabResult.locked + 1
            else
                tabResult.occupied = tabResult.occupied + 1
                tabResult.slots[slot] = item
            end
        end
    end

    scan.results.tabs[tab] = tabResult
    table.insert(scan.results.order, tab)
    scan.waiting = false
    scan.position = scan.position + 1

    if scan.position > #scan.tabs then
        finishScan()
        return
    end

    local generation = scan.generation
    C_Timer.After(GBO.defaults.scanTabDelay, function()
        if scan.active and scan.generation == generation then
            GBO:QueryNextScanTab()
        end
    end)
end

function GBO:QueryNextScanTab()
    if not scan.active or not self:IsBankOpen() then
        self:CancelScan("bank is not open")
        return
    end

    local tab = scan.tabs[scan.position]
    if not tab then
        finishScan()
        return
    end

    scan.waiting = true
    local generation = scan.generation
    QueryGuildBankTab(tab)

    C_Timer.After(self.defaults.scanQueryTimeout, function()
        if scan.active and scan.waiting and scan.generation == generation then
            readCurrentTab("timeout")
        end
    end)
end

function GBO:StartScan(callback)
    if scan.active then
        self:Print("A guild-bank scan is already running.")
        return false
    end
    if self:IsDiagnosticRunning() then
        self:Print("Stop the diagnostic before starting a scan.")
        return false
    end
    if self.IsSortRunning and self:IsSortRunning() then
        self:Print("Stop the guild-bank sort before starting a scan.")
        return false
    end
    if self.IsDepositRunning and (self:IsDepositRunning() or self:IsDepositScanning()) then
        self:Print("Stop or finish Smart Deposit before starting a scan.")
        return false
    end
    if not self:IsBankOpen() then
        self:Print("Open the guild bank first.")
        return false
    end

    local tabs = {}
    for tab = 1, GetNumGuildBankTabs() do
        local _, _, isViewable = GetGuildBankTabInfo(tab)
        if isViewable then
            table.insert(tabs, tab)
        end
    end

    if #tabs == 0 then
        self:Print("No viewable guild-bank tabs were found.")
        return false
    end

    scan.generation = scan.generation + 1
    scan.active = true
    scan.waiting = false
    scan.tabs = tabs
    scan.position = 1
    scan.callback = callback
    scan.results = {
        startedAt = GetServerTime(),
        tabs = {},
        order = {},
    }

    self:Print(string.format("Scanning %d viewable guild-bank tabs...", #tabs))
    self:QueryNextScanTab()
    return true
end

function GBO:CancelScan(reason)
    if not scan.active then
        return
    end
    scan.generation = scan.generation + 1
    resetScan()
    self:Print("Scan stopped: " .. tostring(reason or "cancelled"))
end

function GBO:IsScanRunning()
    return scan.active
end

GBO:On("GUILDBANKBAGSLOTS_CHANGED", function()
    if scan.active and scan.waiting then
        local generation = scan.generation
        C_Timer.After(0, function()
            if scan.active and scan.waiting and scan.generation == generation then
                readCurrentTab("event")
            end
        end)
    end
end)
