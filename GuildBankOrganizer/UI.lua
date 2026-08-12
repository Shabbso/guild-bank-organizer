local _, GBO = ...
local unpack = unpack or table.unpack

local organizerFrame
local advancedFrame
local depositSettingsFrame
local autoSelectGeneration = 0
local autoSelectPending
local refreshGeneration = 0
local loadDepositSettings

local COLORS = {
    panel = {0.035, 0.045, 0.050, 0.98},
    header = {0.020, 0.025, 0.030, 1},
    surface = {0.070, 0.082, 0.088, 1},
    surfaceHover = {0.095, 0.115, 0.122, 1},
    border = {0.17, 0.20, 0.21, 1},
    accent = {0.10, 0.78, 0.82, 1},
    gold = {1.00, 0.82, 0.18, 1},
    muted = {0.62, 0.65, 0.66, 1},
}

local function setButtonEnabled(button, enabled)
    if enabled then
        button:Enable()
    else
        button:Disable()
    end
end

local function createButton(parent, text, width, height, callback)
    local button = CreateFrame("Button", nil, parent)
    button:SetSize(width, height or 24)
    button:SetNormalFontObject(GameFontNormalSmall)
    button:SetText(text)
    button:SetScript("OnClick", callback)
    button.Background = button:CreateTexture(nil, "BACKGROUND")
    button.Background:SetAllPoints()
    button.Background:SetColorTexture(unpack(COLORS.surface))
    button.Top = button:CreateTexture(nil, "BORDER")
    button.Top:SetPoint("TOPLEFT", 0, 0)
    button.Top:SetPoint("TOPRIGHT", 0, 0)
    button.Top:SetHeight(1)
    button.Top:SetColorTexture(unpack(COLORS.border))
    button.Bottom = button:CreateTexture(nil, "BORDER")
    button.Bottom:SetPoint("BOTTOMLEFT", 0, 0)
    button.Bottom:SetPoint("BOTTOMRIGHT", 0, 0)
    button.Bottom:SetHeight(1)
    button.Bottom:SetColorTexture(unpack(COLORS.border))
    button.Left = button:CreateTexture(nil, "BORDER")
    button.Left:SetPoint("TOPLEFT", 0, 0)
    button.Left:SetPoint("BOTTOMLEFT", 0, 0)
    button.Left:SetWidth(1)
    button.Left:SetColorTexture(unpack(COLORS.border))
    button.Right = button:CreateTexture(nil, "BORDER")
    button.Right:SetPoint("TOPRIGHT", 0, 0)
    button.Right:SetPoint("BOTTOMRIGHT", 0, 0)
    button.Right:SetWidth(1)
    button.Right:SetColorTexture(unpack(COLORS.border))
    button:SetScript("OnEnter", function(self)
        if self:IsEnabled() then
            self.Background:SetColorTexture(unpack(COLORS.surfaceHover))
        end
    end)
    button:SetScript("OnLeave", function(self)
        self.Background:SetColorTexture(unpack(COLORS.surface))
    end)
    button:SetScript("OnDisable", function(self)
        self.Background:SetColorTexture(0.035, 0.040, 0.043, 1)
    end)
    button:SetScript("OnEnable", function(self)
        self.Background:SetColorTexture(unpack(COLORS.surface))
    end)
    return button
end

local function stylePrimaryButton(button)
    local function setBorder(red, green, blue, alpha)
        button.Top:SetColorTexture(red, green, blue, alpha)
        button.Bottom:SetColorTexture(red, green, blue, alpha)
        button.Left:SetColorTexture(red, green, blue, alpha)
        button.Right:SetColorTexture(red, green, blue, alpha)
    end
    local function applyEnabledStyle(self)
        self.Background:SetColorTexture(0.15, 0.105, 0.020, 1)
        setBorder(unpack(COLORS.gold))
    end

    button:SetScript("OnEnter", function(self)
        if self:IsEnabled() then
            self.Background:SetColorTexture(0.22, 0.16, 0.035, 1)
        end
    end)
    button:SetScript("OnLeave", function(self)
        if self:IsEnabled() then
            applyEnabledStyle(self)
        end
    end)
    button:SetScript("OnDisable", function(self)
        self.Background:SetColorTexture(0.035, 0.040, 0.043, 1)
        setBorder(unpack(COLORS.border))
    end)
    button:SetScript("OnEnable", applyEnabledStyle)
    applyEnabledStyle(button)
end

local function createLabel(parent, text, x, y)
    local label = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetPoint("TOPLEFT", x, y)
    label:SetText(text)
    return label
end

local function createInput(parent, width, x, y)
    local input = CreateFrame("EditBox", nil, parent)
    input:SetSize(width, 24)
    input:SetPoint("TOPLEFT", x, y)
    input:SetFontObject(ChatFontNormal)
    input:SetTextInsets(7, 7, 0, 0)
    input:SetAutoFocus(false)
    input:SetJustifyH("CENTER")
    local background = input:CreateTexture(nil, "BACKGROUND")
    background:SetAllPoints()
    background:SetColorTexture(0.018, 0.024, 0.027, 1)
    local border = input:CreateTexture(nil, "BORDER")
    border:SetPoint("TOPLEFT", -1, 1)
    border:SetPoint("BOTTOMRIGHT", 1, -1)
    border:SetColorTexture(unpack(COLORS.border))
    local inset = input:CreateTexture(nil, "ARTWORK")
    inset:SetPoint("TOPLEFT", 0, 0)
    inset:SetPoint("BOTTOMRIGHT", 0, 0)
    inset:SetColorTexture(0.018, 0.024, 0.027, 1)
    input:SetScript("OnEscapePressed", function(self)
        self:ClearFocus()
    end)
    input:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
    end)
    return input
end

local function createCheckBox(parent, text, x, y, callback)
    local check = CreateFrame("CheckButton", nil, parent)
    check:SetPoint("TOPLEFT", x, y)
    check:SetSize(20, 20)
    check.Box = check:CreateTexture(nil, "BACKGROUND")
    check.Box:SetAllPoints()
    check.Box:SetColorTexture(0.018, 0.024, 0.027, 1)
    check.Mark = check:CreateTexture(nil, "ARTWORK")
    check.Mark:SetPoint("TOPLEFT", 4, -4)
    check.Mark:SetPoint("BOTTOMRIGHT", -4, 4)
    check.Mark:SetColorTexture(unpack(COLORS.accent))
    check.Mark:Hide()

    local nativeSetChecked = check.SetChecked
    check.gboChecked = false
    check.SetChecked = function(self, checked)
        checked = checked and true or false
        self.gboChecked = checked
        nativeSetChecked(self, checked)
        if checked then
            self.Mark:Show()
        else
            self.Mark:Hide()
        end
    end
    check.GetChecked = function(self)
        return self.gboChecked
    end
    check:SetScript("OnClick", function(self)
        self:SetChecked(not self.gboChecked)
        if callback then
            callback(self)
        end
    end)

    local label = parent:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    label:SetPoint("LEFT", check, "RIGHT", 3, 0)
    label:SetText(text)
    check.Label = label
    return check
end

local function createSolidTexture(parent, layer, red, green, blue, alpha)
    local texture = parent:CreateTexture(nil, layer or "BACKGROUND")
    texture:SetColorTexture(red, green, blue, alpha or 1)
    return texture
end

local function addPanelBorder(frame)
    local top = createSolidTexture(frame, "BORDER", unpack(COLORS.border))
    top:SetPoint("TOPLEFT", 0, 0)
    top:SetPoint("TOPRIGHT", 0, 0)
    top:SetHeight(1)
    local bottom = createSolidTexture(frame, "BORDER", unpack(COLORS.border))
    bottom:SetPoint("BOTTOMLEFT", 0, 0)
    bottom:SetPoint("BOTTOMRIGHT", 0, 0)
    bottom:SetHeight(1)
    local left = createSolidTexture(frame, "BORDER", unpack(COLORS.border))
    left:SetPoint("TOPLEFT", 0, 0)
    left:SetPoint("BOTTOMLEFT", 0, 0)
    left:SetWidth(1)
    local right = createSolidTexture(frame, "BORDER", unpack(COLORS.border))
    right:SetPoint("TOPRIGHT", 0, 0)
    right:SetPoint("BOTTOMRIGHT", 0, 0)
    right:SetWidth(1)
end

local function createPanel(name, width, height, title)
    local frame = CreateFrame("Frame", name, UIParent)
    frame:SetSize(width, height)
    frame:SetFrameStrata("DIALOG")
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    frame:SetClampedToScreen(true)

    local background = createSolidTexture(frame, "BACKGROUND", unpack(COLORS.panel))
    background:SetAllPoints()
    frame.Header = createSolidTexture(frame, "BACKGROUND", unpack(COLORS.header))
    frame.Header:SetPoint("TOPLEFT", 1, -1)
    frame.Header:SetPoint("TOPRIGHT", -1, -1)
    frame.Header:SetHeight(29)
    addPanelBorder(frame)

    frame.TitleText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    frame.TitleText:SetPoint("TOPLEFT", 12, -9)
    frame.TitleText:SetText(title)
    frame.TitleText:SetTextColor(unpack(COLORS.gold))

    frame.Close = createButton(frame, "x", 24, 22, function()
        frame:Hide()
    end)
    frame.Close:SetPoint("TOPRIGHT", -4, -4)
    return frame
end

local function createProgressBar(parent)
    local bar = CreateFrame("StatusBar", nil, parent)
    bar:SetSize(398, 18)
    bar:SetMinMaxValues(0, 1)
    bar:SetValue(0)
    bar:SetStatusBarTexture(
        "Interface\\AddOns\\GuildBankOrganizer\\Media\\ProgressFill"
    )

    local background = createSolidTexture(bar, "BACKGROUND", 0.015, 0.055, 0.07, 0.95)
    background:SetAllPoints()

    local top = createSolidTexture(bar, "BORDER", 0.64, 0.43, 0.10, 1)
    top:SetPoint("TOPLEFT", -1, 1)
    top:SetPoint("TOPRIGHT", 1, 1)
    top:SetHeight(1)

    local bottom = createSolidTexture(bar, "BORDER", 0.64, 0.43, 0.10, 1)
    bottom:SetPoint("BOTTOMLEFT", -1, -1)
    bottom:SetPoint("BOTTOMRIGHT", 1, -1)
    bottom:SetHeight(1)

    local left = createSolidTexture(bar, "BORDER", 0.64, 0.43, 0.10, 1)
    left:SetPoint("TOPLEFT", -1, 1)
    left:SetPoint("BOTTOMLEFT", -1, -1)
    left:SetWidth(1)

    local right = createSolidTexture(bar, "BORDER", 0.64, 0.43, 0.10, 1)
    right:SetPoint("TOPRIGHT", 1, 1)
    right:SetPoint("BOTTOMRIGHT", 1, -1)
    right:SetWidth(1)

    bar.Text = bar:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    bar.Text:SetPoint("CENTER", 0, 0)
    bar.Text:SetText("Move count and ETA appear when sorting")
    return bar
end

local function currentTab()
    if not GBO:IsBankOpen() or not GetCurrentGuildBankTab then
        return nil
    end
    return GetCurrentGuildBankTab()
end

local function isBusy()
    return GBO:IsDiagnosticRunning()
        or GBO:IsScanRunning()
        or (GBO.IsSortRunning and GBO:IsSortRunning())
        or (GBO.IsDepositRunning
            and (GBO:IsDepositRunning() or GBO:IsDepositScanning()))
end

local function stopCurrentOperation()
    if GBO.IsSortRunning and GBO:IsSortRunning() then
        GBO:AbortSort("stopped from organizer panel")
    elseif GBO.IsDepositRunning and
        (GBO:IsDepositRunning() or GBO:IsDepositScanning())
    then
        GBO:AbortDeposit("stopped from organizer panel")
    elseif GBO:IsScanRunning() then
        GBO:CancelScan("stopped from organizer panel")
    elseif GBO:IsDiagnosticRunning() then
        GBO:AbortDiagnostic("stopped from organizer panel")
    end
end

local function depositCurrentTab()
    local tab = currentTab()
    if tab then
        GBO:StartDeposit(tab)
    end
end

local function depositAllTabs()
    GBO:StartDeposit()
end

local function formatDepositCount(scope)
    return string.format(
        "%d item%s in %d deposit%s",
        scope.totalItems,
        scope.totalItems == 1 and "" or "s",
        scope.totalMoves,
        scope.totalMoves == 1 and "" or "s"
    )
end

local function formatAllDepositCount(scope)
    return string.format(
        "%s across %d tab%s",
        formatDepositCount(scope),
        scope.destinationCount,
        scope.destinationCount == 1 and "" or "s"
    )
end

local function formatRoutingConflict(conflict)
    local tabLabels = {}
    for _, tab in ipairs(conflict.tabs or {}) do
        table.insert(tabLabels, "Tab " .. tostring(tab))
    end
    return string.format(
        "%s has equally specific %s / %s routes to %s. Choose one destination.",
        tostring(conflict.name or ("Item " .. tostring(conflict.itemID))),
        tostring(GBO:GetDepositCategoryName(conflict.categoryKey) or "Exact item"),
        tostring(GBO:GetDepositExpansionName(conflict.expansionID) or "Unknown expansion"),
        table.concat(tabLabels, " and ")
    )
end

local function updateSelectionDescription()
    if not advancedFrame then
        return
    end

    local tab = currentTab()
    local sourceSlot = tonumber(advancedFrame.SourceInput:GetText())
    local emptySlot = tonumber(advancedFrame.EmptyInput:GetText())
    if not tab or not sourceSlot or not emptySlot then
        advancedFrame.SelectionText:SetText("Click Auto Select or enter source and empty slot numbers.")
        return
    end

    advancedFrame.SelectionText:SetText(
        GBO:DescribeSlot(GBO:ReadSlot(tab, sourceSlot))
        .. "\n"
        .. GBO:DescribeSlot(GBO:ReadSlot(tab, emptySlot))
    )
end

local function completeAutoSelect(generation)
    if not advancedFrame
        or not autoSelectPending
        or autoSelectPending.generation ~= generation
    then
        return
    end

    local tab = autoSelectPending.tab
    if currentTab() ~= tab then
        autoSelectPending = nil
        advancedFrame.ActionText:SetText("The selected tab changed. Click Auto Select again.")
        return
    end

    local source
    for slot = 1, GBO.MAX_SLOTS do
        local item = GBO:ReadSlot(tab, slot)
        if item.link and not item.locked then
            source = item
            break
        end
    end

    local destination
    for slot = GBO.MAX_SLOTS, 1, -1 do
        local item = GBO:ReadSlot(tab, slot)
        if not item.link and not item.locked then
            destination = item
            break
        end
    end

    autoSelectPending = nil
    if not source then
        advancedFrame.ActionText:SetText("No unlocked occupied source slot was found.")
        return
    end
    if not destination then
        advancedFrame.ActionText:SetText("No empty diagnostic destination was found.")
        return
    end

    advancedFrame.SourceInput:SetText(tostring(source.slot))
    advancedFrame.EmptyInput:SetText(tostring(destination.slot))
    advancedFrame.ActionText:SetText(string.format(
        "Selected item:%s x%d in slot %d and empty slot %d.",
        tostring(source.itemID or "?"),
        source.count or 0,
        source.slot,
        destination.slot
    ))
    updateSelectionDescription()
end

local function beginAutoSelect()
    if not advancedFrame then
        return
    end
    if not GBO:IsBankOpen() then
        advancedFrame.ActionText:SetText("Open the guild bank first.")
        return
    end
    if isBusy() then
        advancedFrame.ActionText:SetText("Stop or finish the current operation first.")
        return
    end

    local tab = currentTab()
    autoSelectGeneration = autoSelectGeneration + 1
    autoSelectPending = {
        generation = autoSelectGeneration,
        tab = tab,
    }
    advancedFrame.ActionText:SetText(string.format("Refreshing tab %d before selecting slots...", tab))
    QueryGuildBankTab(tab)

    local generation = autoSelectGeneration
    C_Timer.After(GBO.defaults.scanQueryTimeout, function()
        if autoSelectPending and autoSelectPending.generation == generation then
            completeAutoSelect(generation)
        end
    end)
end

local function runDiagnosticFromInputs(forceCadence, forceMoves)
    if not GBO:IsBankOpen() then
        advancedFrame.ActionText:SetText("Open the guild bank first.")
        return
    end

    local cadence = forceCadence or tonumber(advancedFrame.TestCadenceInput:GetText())
    local moves = forceMoves or tonumber(advancedFrame.MovesInput:GetText())
    if forceCadence then
        advancedFrame.TestCadenceInput:SetText(string.format("%.2f", forceCadence))
    end
    if forceMoves then
        advancedFrame.MovesInput:SetText(tostring(forceMoves))
    end

    GBO:StartDiagnostic(
        currentTab(),
        tonumber(advancedFrame.SourceInput:GetText()),
        tonumber(advancedFrame.EmptyInput:GetText()),
        cadence,
        moves
    )
end

local function applySortCadence()
    local cadence = tonumber(advancedFrame.SortCadenceInput:GetText())
    if not cadence
        or cadence < GBO.defaults.sortMinimumCadence
        or cadence > 5.0
    then
        advancedFrame.ActionText:SetText(string.format(
            "Sort speed must be between %.2f and 5.00 seconds.",
            GBO.defaults.sortMinimumCadence
        ))
        return
    end

    GBO.db.settings.sortCadence = cadence
    advancedFrame.ActionText:SetText(string.format(
        "Sort cadence saved as %.2f seconds per move.",
        cadence
    ))
    GBO:RefreshOrganizerUI()
end

local function updateAutoOpen(check)
    GBO.db.settings.autoOpen = check:GetChecked() and true or false
    advancedFrame.SettingsText:SetText(
        GBO.db.settings.autoOpen
            and "The compact organizer will open with the guild bank."
            or "Use /gbo when you want to open the compact organizer."
    )
end

local function updateSortDirection(check)
    if isBusy() then
        check:SetChecked(GBO.db.settings.sortInverted)
        advancedFrame.SettingsText:SetText("Finish the current operation before changing sort direction.")
        return
    end

    GBO.db.settings.sortInverted = check:GetChecked() and true or false
    advancedFrame.SettingsText:SetText(
        GBO.db.settings.sortInverted
            and "Reverse bag-style ordering is enabled."
            or "Normal bag-style ordering is enabled."
    )
    GBO:RefreshOrganizerUI()
end

function GBO:RefreshOrganizerUI()
    local tab = currentTab()
    local busy = isBusy()
    local sorting = self.IsSortRunning and self:IsSortRunning()
    local depositing = self.IsDepositRunning and self:IsDepositRunning()
    local depositScanning = self.IsDepositScanning and self:IsDepositScanning()
    local depositPlan = self.GetDepositPlan and self:GetDepositPlan()
    local depositsAvailable = depositPlan and depositPlan.totalMoves > 0
    local currentScope = tab and self.GetDepositPlanScope
        and self:GetDepositPlanScope(tab)
    local allScope = self.GetDepositPlanScope and self:GetDepositPlanScope()
    local routingConflict = self.GetFirstDepositRoutingConflict
        and self:GetFirstDepositRoutingConflict()
    local currentDepositsAvailable = currentScope and currentScope.totalMoves > 0
    local allDepositsAvailable = allScope and allScope.totalMoves > 0

    if organizerFrame then
        if tab then
            local name = GetGuildBankTabInfo(tab)
            organizerFrame.TabText:SetText(string.format(
                "Tab %d%s",
                tab,
                name and (" — " .. name) or ""
            ))
        else
            organizerFrame.TabText:SetText("Guild bank is closed")
        end

        setButtonEnabled(organizerFrame.SortButton, tab and not busy)
        if busy then
            organizerFrame.DepositCurrentButton:Hide()
            organizerFrame.DepositAllButton:Hide()
            organizerFrame.DepositStopButton:Show()
            setButtonEnabled(organizerFrame.DepositStopButton, true)
        else
            organizerFrame.DepositCurrentButton:Show()
            organizerFrame.DepositAllButton:Show()
            organizerFrame.DepositStopButton:Hide()
            setButtonEnabled(
                organizerFrame.DepositCurrentButton,
                tab and currentDepositsAvailable
            )
            setButtonEnabled(
                organizerFrame.DepositAllButton,
                tab and allDepositsAvailable
            )
        end

        if depositing then
            organizerFrame.StatusText:SetText(self:GetDepositStatus())
        elseif depositScanning then
            organizerFrame.StatusText:SetText("Scanning bags and assigned tabs...")
        elseif sorting then
            organizerFrame.StatusText:SetText(self:GetSortStatus())
        elseif self:IsDiagnosticRunning() then
            organizerFrame.StatusText:SetText("Advanced diagnostic is running.")
        elseif self:IsScanRunning() then
            organizerFrame.StatusText:SetText("Scanning guild-bank tabs...")
        elseif routingConflict then
            organizerFrame.StatusText:SetText(
                "Smart Deposit needs attention: resolve a routing conflict."
            )
        elseif depositsAvailable then
            organizerFrame.StatusText:SetText(
                "Smart Deposit ready. Choose this tab or all configured tabs."
            )
        elseif self.lastOutcome then
            organizerFrame.StatusText:SetText(string.format(
                "%s: %s",
                self.lastOutcome.ok and "Done" or "Stopped",
                tostring(self.lastOutcome.reason)
            ))
        else
            organizerFrame.StatusText:SetText("Ready. Start sorting to calculate moves and ETA.")
        end

        if depositing then
            local progress = self:GetDepositProgress()
            local progressMaximum = progress.total > 0 and progress.total or 1
            organizerFrame.ProgressBar:SetMinMaxValues(0, progressMaximum)
            organizerFrame.ProgressBar:SetValue(progress.completed)
            organizerFrame.ProgressBar.Text:SetText(string.format(
                "%d / %d confirmed • %d left • about %s",
                progress.completed,
                progress.total,
                progress.remaining,
                progress.etaText
            ))
        elseif depositScanning then
            organizerFrame.ProgressBar:SetMinMaxValues(0, 1)
            organizerFrame.ProgressBar:SetValue(0)
            organizerFrame.ProgressBar.Text:SetText("Checking bags and deposit profiles...")
        elseif sorting then
            local progress = self:GetSortProgress()
            local progressMaximum = progress.total and progress.total > 0
                and progress.total
                or 1
            organizerFrame.ProgressBar:SetMinMaxValues(0, progressMaximum)
            organizerFrame.ProgressBar:SetValue(progress.completed or 0)
            if progress.total == 0 then
                organizerFrame.ProgressBar.Text:SetText("No moves needed • completing the final server check")
            elseif progress.total and progress.remaining == 0 then
                organizerFrame.ProgressBar.Text:SetText(string.format(
                    "All %d moves confirmed • final server check",
                    progress.total
                ))
            elseif progress.total then
                organizerFrame.ProgressBar.Text:SetText(string.format(
                    "%d / %d confirmed • %d left • about %s",
                    progress.completed,
                    progress.total,
                    progress.remaining,
                    progress.etaText or "calculating"
                ))
            else
                organizerFrame.ProgressBar.Text:SetText("Reading the tab and calculating the plan...")
            end
        elseif depositsAvailable then
            organizerFrame.ProgressBar:SetMinMaxValues(0, depositPlan.totalMoves)
            organizerFrame.ProgressBar:SetValue(0)
            organizerFrame.ProgressBar.Text:SetText(string.format(
                "%d items • %d deposits available",
                depositPlan.totalItems,
                depositPlan.totalMoves
            ))
        else
            organizerFrame.ProgressBar:SetMinMaxValues(0, 1)
            organizerFrame.ProgressBar:SetValue(0)
            organizerFrame.ProgressBar.Text:SetText("Move count and ETA appear when sorting")
        end

        if busy then
            if depositing then
                organizerFrame.SmartHint:SetText(
                    "Depositing selected items. Stop waits for the active move to settle."
                )
            elseif depositScanning then
                organizerFrame.SmartHint:SetText("Checking bags and assigned tabs...")
            else
                organizerFrame.SmartHint:SetText(
                    "Finish or stop the active organizer operation before depositing."
                )
            end
            organizerFrame.SetupButton:SetText(
                self:HasEnabledDepositProfiles() and "Edit" or "Set Up"
            )
        elseif routingConflict then
            organizerFrame.SmartHint:SetText(formatRoutingConflict(routingConflict))
            organizerFrame.SetupButton:SetText("Resolve")
        elseif not self:HasEnabledDepositProfiles() then
            organizerFrame.SmartHint:SetText(
                "Choose what belongs in each tab. Setup takes two steps."
            )
            organizerFrame.SetupButton:SetText("Set Up")
        elseif allDepositsAvailable then
            local currentText = currentDepositsAvailable
                and formatDepositCount(currentScope)
                or "No matching items"
            organizerFrame.SmartHint:SetText(string.format(
                "This tab: %s\nAll configured tabs: %s",
                currentText,
                formatAllDepositCount(allScope)
            ))
            organizerFrame.SetupButton:SetText("Edit")
        else
            organizerFrame.SmartHint:SetText(
                "No matching bag items are ready right now."
            )
            organizerFrame.SetupButton:SetText("Edit")
        end

        local cadence = self.db and self.db.settings and self.db.settings.sortCadence
            or self.defaults.cadence
        organizerFrame.FooterText:SetText(string.format(
            "v%s • %s order • %.2fs per move",
            tostring(self.version),
            self.db and self.db.settings and self.db.settings.sortInverted and "Reverse" or "Normal",
            cadence
        ))
    end

    if advancedFrame then
        if tab then
            local name = GetGuildBankTabInfo(tab)
            advancedFrame.TabText:SetText(string.format(
                "Current tab: %d%s",
                tab,
                name and (" — " .. name) or ""
            ))
        else
            advancedFrame.TabText:SetText("Current tab: guild bank is closed")
        end

        setButtonEnabled(advancedFrame.AutoButton, tab and not busy)
        setButtonEnabled(advancedFrame.ScanButton, tab and not busy)
        setButtonEnabled(advancedFrame.SmokeButton, tab and not busy)
        setButtonEnabled(advancedFrame.RunButton, tab and not busy)
        setButtonEnabled(advancedFrame.StopButton, busy)
        setButtonEnabled(advancedFrame.ReportButton, self.lastReport ~= nil
            or (self.db and self.db.runs and self.db.runs[1] ~= nil))
        advancedFrame.AutoOpenCheck:SetChecked(self.db.settings.autoOpen)
        advancedFrame.ReverseCheck:SetChecked(self.db.settings.sortInverted)

        if depositing or depositScanning then
            advancedFrame.StatusText:SetText(self:GetDepositStatus())
        elseif sorting then
            advancedFrame.StatusText:SetText(self:GetSortStatus())
        elseif self:IsDiagnosticRunning() then
            advancedFrame.StatusText:SetText(self:GetDiagnosticStatus())
        elseif self:IsScanRunning() then
            advancedFrame.StatusText:SetText("Scanning viewable guild-bank tabs...")
        elseif self.lastOutcome then
            advancedFrame.StatusText:SetText(string.format(
                "%s: %s",
                self.lastOutcome.ok and "PASS" or "FAIL",
                tostring(self.lastOutcome.reason)
            ))
        else
            advancedFrame.StatusText:SetText("Advanced diagnostics are ready.")
        end
    end

    if depositSettingsFrame and depositSettingsFrame:IsShown() then
        if tab
            and depositSettingsFrame.LastBankTab ~= tab
            and loadDepositSettings
        then
            loadDepositSettings(tab)
        end
        setButtonEnabled(depositSettingsFrame.SaveButton, tab and not busy)
        setButtonEnabled(depositSettingsFrame.ScanButton, tab and not busy)
    end
end

local function scheduleRefresh()
    refreshGeneration = refreshGeneration + 1
    local generation = refreshGeneration

    local function refresh()
        local organizerVisible = organizerFrame and organizerFrame:IsShown()
        local advancedVisible = advancedFrame and advancedFrame:IsShown()
        local depositSettingsVisible =
            depositSettingsFrame and depositSettingsFrame:IsShown()
        if refreshGeneration ~= generation
            or not organizerVisible and not advancedVisible and not depositSettingsVisible
        then
            return
        end
        GBO:RefreshOrganizerUI()
        C_Timer.After(0.25, refresh)
    end

    refresh()
end

local function anchorBesideGuildBank(frame)
    if GuildBankFrame then
        frame:SetPoint("TOPLEFT", GuildBankFrame, "TOPRIGHT", 8, 0)
    else
        frame:SetPoint("CENTER")
    end
end

local function createOrganizerFrame()
    local frame = createPanel(
        "GuildBankOrganizerFrame",
        430,
        292,
        "Guild Bank Organizer"
    )
    anchorBesideGuildBank(frame)

    frame.BrandIcon = frame:CreateTexture(nil, "ARTWORK")
    frame.BrandIcon:SetSize(32, 32)
    frame.BrandIcon:SetPoint("TOPLEFT", 16, -42)
    frame.BrandIcon:SetTexture("Interface\\AddOns\\GuildBankOrganizer\\Media\\Icon")

    frame.TabText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    frame.TabText:SetPoint("TOPLEFT", 58, -42)
    frame.TabText:SetTextColor(unpack(COLORS.gold))

    frame.StatusText = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    frame.StatusText:SetPoint("TOPLEFT", 58, -60)
    frame.StatusText:SetPoint("TOPRIGHT", -16, -60)
    frame.StatusText:SetJustifyH("LEFT")
    frame.StatusText:SetText("Ready.")

    frame.ProgressBar = createProgressBar(frame)
    frame.ProgressBar:SetPoint("TOPLEFT", 16, -84)

    frame.SortButton = createButton(frame, "Sort This Tab", 398, 34, function()
        GBO:StartSortCurrentTab()
    end)
    frame.SortButton:SetPoint("TOPLEFT", 16, -112)

    frame.SetupCard = createSolidTexture(
        frame,
        "BACKGROUND",
        0.050,
        0.062,
        0.067,
        1
    )
    frame.SetupCard:SetPoint("TOPLEFT", 16, -154)
    frame.SetupCard:SetPoint("BOTTOMRIGHT", -16, 28)

    frame.SmartTitle = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    frame.SmartTitle:SetPoint("TOPLEFT", 28, -164)
    frame.SmartTitle:SetText("Smart Deposit")
    frame.SmartTitle:SetTextColor(unpack(COLORS.gold))
    frame.SmartHint = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    frame.SmartHint:SetPoint("TOPLEFT", 28, -194)
    frame.SmartHint:SetPoint("TOPRIGHT", -28, -194)
    frame.SmartHint:SetJustifyH("LEFT")
    frame.SmartHint:SetText("Choose what belongs in each tab.")

    frame.SetupButton = createButton(frame, "Set Up", 70, 28, function()
        local conflict = GBO.GetFirstDepositRoutingConflict
            and GBO:GetFirstDepositRoutingConflict()
        GBO:ShowDepositSettingsUI(
            conflict and conflict.tabs and conflict.tabs[1]
        )
    end)
    frame.SetupButton:SetPoint("TOPRIGHT", -26, -159)

    frame.DepositCurrentButton = createButton(
        frame,
        "Deposit This Tab",
        182,
        30,
        depositCurrentTab
    )
    frame.DepositCurrentButton:SetPoint("TOPLEFT", 28, -226)
    stylePrimaryButton(frame.DepositCurrentButton)

    frame.DepositAllButton = createButton(
        frame,
        "Deposit All Tabs",
        182,
        30,
        depositAllTabs
    )
    frame.DepositAllButton:SetPoint(
        "LEFT",
        frame.DepositCurrentButton,
        "RIGHT",
        8,
        0
    )

    frame.DepositStopButton = createButton(
        frame,
        "Stop",
        372,
        30,
        stopCurrentOperation
    )
    frame.DepositStopButton:SetPoint("TOPLEFT", 28, -226)
    frame.DepositStopButton:Hide()

    frame.AdvancedButton = createButton(frame, "Settings", 72, 20, function()
        GBO:ShowAdvancedUI()
    end)
    frame.AdvancedButton:SetPoint("BOTTOMLEFT", 8, 4)

    frame.FooterText = frame:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    frame.FooterText:SetPoint("BOTTOMRIGHT", -12, 8)
    frame.FooterText:SetText("Normal bag-style order • 1.25s per move")

    frame:SetScript("OnShow", scheduleRefresh)
    frame:SetScript("OnHide", function()
        if not advancedFrame or not advancedFrame:IsShown() then
            refreshGeneration = refreshGeneration + 1
        end
    end)
    frame:Hide()
    return frame
end

local function createAdvancedFrame()
    local frame = createPanel(
        "GuildBankOrganizerAdvancedFrame",
        470,
        500,
        "Guild Bank Organizer  /  Settings"
    )
    anchorBesideGuildBank(frame)
    frame.Close:Hide()
    frame.HeaderBackButton = createButton(frame, "< Back to Organizer", 134, 22, function()
        frame:Hide()
        if GBO:IsBankOpen() then
            GBO:ShowOrganizerUI()
        end
    end)
    frame.HeaderBackButton:SetPoint("TOPRIGHT", -4, -4)

    local intro = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    intro:SetPoint("TOPLEFT", 16, -34)
    intro:SetPoint("TOPRIGHT", -16, -34)
    intro:SetJustifyH("LEFT")
    intro:SetText("Settings, diagnostic tools, and copyable troubleshooting reports.")

    createLabel(frame, "Organizer settings", 20, -66)

    frame.AutoOpenCheck = createCheckBox(
        frame,
        "Open automatically with the guild bank",
        18,
        -82,
        updateAutoOpen
    )
    frame.ReverseCheck = createCheckBox(
        frame,
        "Reverse sort direction",
        260,
        -82,
        updateSortDirection
    )

    createLabel(frame, "Seconds per sort move", 20, -126)
    frame.SortCadenceInput = createInput(frame, 70, 172, -120)
    frame.SortCadenceInput:SetText("1.25")
    frame.SpeedButton = createButton(frame, "Save Sort Speed", 125, 24, applySortCadence)
    frame.SpeedButton:SetPoint("TOPLEFT", 232, -120)

    frame.DepositSettingsButton = createButton(
        frame,
        "Smart Deposits",
        96,
        24,
        function()
            GBO:ShowDepositSettingsUI()
        end
    )
    frame.DepositSettingsButton:SetPoint("TOPLEFT", 360, -120)

    frame.SettingsText = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    frame.SettingsText:SetPoint("TOPLEFT", 20, -154)
    frame.SettingsText:SetPoint("TOPRIGHT", -20, -154)
    frame.SettingsText:SetJustifyH("LEFT")
    frame.SettingsText:SetText("Normal bag-style ordering is enabled.")

    createLabel(frame, "Diagnostics", 20, -188)

    frame.TabText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    frame.TabText:SetPoint("TOPLEFT", 20, -214)

    createLabel(frame, "Test source", 20, -247)
    createLabel(frame, "Test empty", 130, -247)
    createLabel(frame, "Test cadence", 240, -247)
    createLabel(frame, "Moves", 350, -247)

    frame.SourceInput = createInput(frame, 70, 20, -267)
    frame.EmptyInput = createInput(frame, 70, 130, -267)
    frame.TestCadenceInput = createInput(frame, 70, 240, -267)
    frame.MovesInput = createInput(frame, 70, 350, -267)
    frame.TestCadenceInput:SetText("1.25")
    frame.MovesInput:SetText("10")
    frame.SourceInput:SetScript("OnTextChanged", updateSelectionDescription)
    frame.EmptyInput:SetScript("OnTextChanged", updateSelectionDescription)

    frame.SelectionText = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    frame.SelectionText:SetPoint("TOPLEFT", 20, -303)
    frame.SelectionText:SetPoint("TOPRIGHT", -20, -303)
    frame.SelectionText:SetJustifyH("LEFT")
    frame.SelectionText:SetText("Click Auto Select or enter source and empty slot numbers.")

    frame.ActionText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    frame.ActionText:SetPoint("TOPLEFT", 20, -345)
    frame.ActionText:SetPoint("TOPRIGHT", -20, -345)
    frame.ActionText:SetJustifyH("LEFT")
    frame.ActionText:SetText("Use ordinary, replaceable items for movement diagnostics.")

    frame.AutoButton = createButton(frame, "Auto Select", 100, 24, beginAutoSelect)
    frame.AutoButton:SetPoint("TOPLEFT", 20, -372)

    frame.ScanButton = createButton(frame, "Scan Tabs", 100, 24, function()
        GBO:StartScan()
    end)
    frame.ScanButton:SetPoint("LEFT", frame.AutoButton, "RIGHT", 8, 0)

    frame.SmokeButton = createButton(frame, "Smoke Test", 100, 24, function()
        runDiagnosticFromInputs(1.50, 2)
    end)
    frame.SmokeButton:SetPoint("LEFT", frame.ScanButton, "RIGHT", 8, 0)

    frame.RunButton = createButton(frame, "Run Test", 100, 24, function()
        runDiagnosticFromInputs()
    end)
    frame.RunButton:SetPoint("LEFT", frame.SmokeButton, "RIGHT", 8, 0)

    frame.StopButton = createButton(frame, "Stop", 110, 24, stopCurrentOperation)
    frame.StopButton:SetPoint("TOPLEFT", 20, -410)

    frame.ReportButton = createButton(frame, "Copy Report", 110, 24, function()
        GBO:ShowReport()
    end)
    frame.ReportButton:SetPoint("LEFT", frame.StopButton, "RIGHT", 10, 0)

    local helpButton = createButton(frame, "Help", 110, 24, function()
        GBO:PrintHelp()
    end)
    helpButton:SetPoint("LEFT", frame.ReportButton, "RIGHT", 10, 0)

    frame.StatusText = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    frame.StatusText:SetPoint("TOPLEFT", 20, -452)
    frame.StatusText:SetPoint("TOPRIGHT", -20, -452)
    frame.StatusText:SetJustifyH("LEFT")
    frame.StatusText:SetText("Advanced diagnostics are ready.")

    frame:SetScript("OnShow", function()
        frame.SortCadenceInput:SetText(string.format("%.2f", GBO.db.settings.sortCadence))
        frame.AutoOpenCheck:SetChecked(GBO.db.settings.autoOpen)
        frame.ReverseCheck:SetChecked(GBO.db.settings.sortInverted)
        scheduleRefresh()
    end)
    frame:SetScript("OnHide", function()
        autoSelectGeneration = autoSelectGeneration + 1
        autoSelectPending = nil
        if not organizerFrame or not organizerFrame:IsShown() then
            refreshGeneration = refreshGeneration + 1
        end
    end)
    frame:Hide()
    return frame
end

loadDepositSettings = function(tab)
    if not depositSettingsFrame then
        return
    end
    depositSettingsFrame.ScanGeneration =
        (depositSettingsFrame.ScanGeneration or 0) + 1
    tab = tonumber(tab) or currentTab()
    if not tab or tab < 1 or tab > GetNumGuildBankTabs() then
        depositSettingsFrame.StatusText:SetText(
            "Enter a purchased guild-bank tab number."
        )
        return
    end

    local name = GetGuildBankTabInfo(tab)
    local profile = GBO:GetDepositProfile(tab, false)
    depositSettingsFrame.LoadingProfile = true
    depositSettingsFrame.LastBankTab = currentTab()
    depositSettingsFrame.SelectedTab = tab
    depositSettingsFrame.TabInput:SetText(tostring(tab))
    depositSettingsFrame.TabTitle:SetText(string.format(
        "Tab %d%s",
        tab,
        name and (" — " .. name) or ""
    ))
    depositSettingsFrame.LabelInput:SetText(profile and profile.label or "")
    depositSettingsFrame.EnabledCheck:SetChecked(
        profile and profile.enabled or profile == nil
    )
    for key, check in pairs(depositSettingsFrame.CategoryChecks) do
        check:SetChecked(
            profile and profile.categories and profile.categories[key] or false
        )
    end
    depositSettingsFrame.AllExpansionsCheck:SetChecked(
        not profile or profile.allExpansions ~= false
    )
    for expansionID, check in pairs(depositSettingsFrame.ExpansionChecks) do
        check:SetChecked(
            profile
                and not profile.allExpansions
                and profile.expansions
                and profile.expansions[expansionID]
                or false
        )
    end
    local exactItemIDs = {}
    if profile and profile.exactItemIDs then
        for itemID in pairs(profile.exactItemIDs) do
            table.insert(exactItemIDs, tonumber(itemID))
        end
    end
    table.sort(exactItemIDs)
    local exactText = {}
    for _, itemID in ipairs(exactItemIDs) do
        table.insert(exactText, tostring(itemID))
    end
    depositSettingsFrame.ExactItemsInput:SetText(table.concat(exactText, ", "))
    depositSettingsFrame.LoadingProfile = false
    depositSettingsFrame.StatusText:SetText(
        "Step 2: choose categories, then save. Hover a category to see its rule."
    )
    depositSettingsFrame.StatusText:SetTextColor(1, 1, 1)
end

local function saveDepositSettings()
    local frame = depositSettingsFrame
    if not frame then
        return
    end
    local tab = tonumber(frame.TabInput:GetText())
    local categories = {}
    local count = 0
    for key, check in pairs(frame.CategoryChecks) do
        if check:GetChecked() then
            categories[key] = true
            count = count + 1
        end
    end
    local expansions = {}
    for expansionID, check in pairs(frame.ExpansionChecks) do
        if check:GetChecked() then
            expansions[expansionID] = true
        end
    end
    local exactItemIDs = {}
    for itemID in string.gmatch(frame.ExactItemsInput:GetText() or "", "%d+") do
        exactItemIDs[tonumber(itemID)] = true
    end

    local ok, reason = GBO:SaveDepositProfile(
        tab,
        frame.EnabledCheck:GetChecked(),
        frame.LabelInput:GetText(),
        categories,
        frame.AllExpansionsCheck:GetChecked(),
        expansions,
        exactItemIDs
    )
    if not ok then
        frame.StatusText:SetText(tostring(reason))
        return
    end

    frame.SelectedTab = tab
    local savedProfile = GBO:GetDepositProfile(tab, false)
    frame.EnabledCheck:SetChecked(savedProfile and savedProfile.enabled)
    frame.StatusText:SetText(savedProfile and savedProfile.enabled
        and string.format(
            "Saved and active! %d categor%s route to Tab %d. Next: Back to Organizer.",
            count,
            count == 1 and "y" or "ies",
            tab
        )
        or "Saved, but this profile is paused. Enable it and save to include it in scans."
    )
    frame.StatusText:SetTextColor(unpack(COLORS.accent))
    GBO:RefreshOrganizerUI()
end

local function createDepositSettingsFrame()
    local frame = createPanel(
        "GuildBankOrganizerDepositSettingsFrame",
        470,
        670,
        "Guild Bank Organizer  /  Smart Deposit"
    )
    anchorBesideGuildBank(frame)
    frame.Close:Hide()
    frame.HeaderBackButton = createButton(frame, "< Back to Organizer", 134, 22, function()
        frame:Hide()
        if GBO:IsBankOpen() then
            GBO:ShowOrganizerUI()
        end
    end)
    frame.HeaderBackButton:SetPoint("TOPRIGHT", -4, -4)

    local intro = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    intro:SetPoint("TOPLEFT", 18, -34)
    intro:SetPoint("TOPRIGHT", -18, -34)
    intro:SetJustifyH("LEFT")
    intro:SetText(
        "1. Pick a destination tab.  2. Choose what belongs there.  3. Save and scan."
    )

    createLabel(frame, "1  Destination tab", 20, -72)
    frame.TabInput = createInput(frame, 54, 58, -66)
    frame.UseCurrentButton = createButton(frame, "Use Current", 100, 24, function()
        loadDepositSettings(currentTab())
    end)
    frame.UseCurrentButton:SetPoint("TOPLEFT", 124, -66)
    frame.LoadButton = createButton(frame, "Load Tab", 90, 24, function()
        loadDepositSettings(frame.TabInput:GetText())
    end)
    frame.LoadButton:SetPoint("TOPLEFT", 234, -66)

    frame.TabTitle = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    frame.TabTitle:SetPoint("TOPLEFT", 334, -72)
    frame.TabTitle:SetPoint("TOPRIGHT", -18, -72)
    frame.TabTitle:SetJustifyH("RIGHT")

    createLabel(frame, "Name", 20, -112)
    frame.LabelInput = createInput(frame, 210, 112, -106)
    frame.LabelInput:SetJustifyH("LEFT")
    frame.EnabledCheck = createCheckBox(
        frame,
        "Enable this tab profile",
        330,
        -106,
        function() end
    )

    createLabel(frame, "2  Items that belong in this tab", 20, -150)
    local categoryHint = frame:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontDisableSmall"
    )
    categoryHint:SetPoint("TOPLEFT", 250, -151)
    categoryHint:SetText("Hover for the exact rule")

    frame.CategoryChecks = {}
    local categories = GBO:GetDepositCategoryCatalog()
    local rowCount = math.max(1, math.ceil(#categories / 2))
    local categoryTop = -170
    local categoryRowSpacing = 22
    local columnX = {18, 238}
    for index, category in ipairs(categories) do
        local column = math.floor((index - 1) / rowCount) + 1
        local row = (index - 1) % rowCount
        local check = createCheckBox(
            frame,
            category.name,
            columnX[column],
            categoryTop - (row * categoryRowSpacing),
            function(self)
                if self:GetChecked() then
                    frame.EnabledCheck:SetChecked(true)
                end
            end
        )
        check.Label:SetWidth(190)
        check.Label:SetJustifyH("LEFT")
        check:SetScript("OnEnter", function(self)
            if GameTooltip then
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetText(category.name)
                GameTooltip:AddLine(category.description, 1, 1, 1, true)
                GameTooltip:AddLine("Rule: " .. category.evidence, 0.35, 0.85, 0.90, true)
                GameTooltip:Show()
            end
        end)
        check:SetScript("OnLeave", function()
            if GameTooltip then
                GameTooltip:Hide()
            end
        end)
        frame.CategoryChecks[category.key] = check
    end

    local expansionY = categoryTop - (rowCount * categoryRowSpacing) - 8
    createLabel(frame, "Expansion", 20, expansionY)
    frame.AllExpansionsCheck = createCheckBox(
        frame,
        "All",
        78,
        expansionY + 3,
        function(check)
            if check:GetChecked() then
                for _, expansionCheck in pairs(frame.ExpansionChecks or {}) do
                    expansionCheck:SetChecked(false)
                end
            end
        end
    )
    frame.ExpansionChecks = {}
    local expansionX = {132, 194, 256, 318, 380}
    for index, expansion in ipairs(GBO:GetDepositExpansionCatalog()) do
        local check = createCheckBox(
            frame,
            expansion.shortName,
            expansionX[index],
            expansionY + 3,
            function(self)
                if self:GetChecked() then
                    frame.AllExpansionsCheck:SetChecked(false)
                end
            end
        )
        check.Label:SetWidth(58)
        frame.ExpansionChecks[expansion.id] = check
    end
    local expansionHelp = frame:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    expansionHelp:SetPoint("TOPLEFT", 20, expansionY - 27)
    expansionHelp:SetPoint("TOPRIGHT", -20, expansionY - 27)
    expansionHelp:SetJustifyH("LEFT")
    expansionHelp:SetText(
        "Use Mists for current-expansion materials, or choose several eras for an older-material tab."
    )

    local exactItemsY = expansionY - 62
    createLabel(frame, "Exact item IDs (optional)", 20, exactItemsY)
    frame.ExactItemsInput = createInput(frame, 250, 170, exactItemsY + 6)
    frame.ExactItemsInput:SetJustifyH("LEFT")
    frame.ExactItemsInput:SetScript("OnTextChanged", function(self)
        if not frame.LoadingProfile
            and string.find(self:GetText() or "", "%d")
        then
            frame.EnabledCheck:SetChecked(true)
        end
    end)
    local exactHelp = frame:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    exactHelp:SetPoint("TOPLEFT", 20, exactItemsY - 26)
    exactHelp:SetPoint("TOPRIGHT", -20, exactItemsY - 26)
    exactHelp:SetJustifyH("LEFT")
    exactHelp:SetText(
        "Comma-separated IDs override categories. Useful for unusual lockboxes or crafted items."
    )

    frame.SaveButton = createButton(frame, "Save Tab Profile", 145, 28, saveDepositSettings)
    frame.SaveButton:SetPoint("BOTTOMLEFT", 20, 58)
    frame.ScanButton = createButton(frame, "Scan Bags Now", 125, 28, function()
        frame.ScanGeneration = (frame.ScanGeneration or 0) + 1
        local generation = frame.ScanGeneration
        local tab = tonumber(frame.TabInput:GetText())

        local function runScan(lockAttempt)
            if not frame:IsShown() or frame.ScanGeneration ~= generation then
                return
            end
            local inspection = GBO:InspectDepositProfile(tab)
            if not inspection.enabled then
                frame.StatusText:SetTextColor(1, 0.82, 0.18)
                frame.StatusText:SetText(inspection.categoryItems > 0
                    and string.format(
                        "Found %d matching bag item%s, but this profile is paused. Enable it and Save.",
                        inspection.categoryItems,
                        inspection.categoryItems == 1 and "" or "s"
                    )
                    or "This profile is paused. Enable it and Save before scanning."
                )
                return
            end

            if inspection.lockedItems > 0 and lockAttempt < 4 then
                local item = inspection.firstLocked
                frame.StatusText:SetTextColor(1, 0.82, 0.18)
                frame.StatusText:SetText(string.format(
                    "Waiting for %s (item %s) to unlock... attempt %d of 4.",
                    item and item.name or "a matching bag item",
                    item and item.itemID or "?",
                    lockAttempt + 1
                ))
                C_Timer.After(0.75, function()
                    runScan(lockAttempt + 1)
                end)
                return
            end

            if GBO:RefreshDepositPlan(function(plan)
                if not frame:IsShown()
                    or frame.ScanGeneration ~= generation
                then
                    return
                end
                frame.StatusText:SetTextColor(1, 1, 1)
                local tabPlan = plan and plan.tabs and plan.tabs[tab]
                if tabPlan and tabPlan.moves > 0 then
                    frame.StatusText:SetText(string.format(
                        "Ready: %d item%s in %d deposit%s for this tab. Back to Organizer to deposit.",
                        tabPlan.itemCount,
                        tabPlan.itemCount == 1 and "" or "s",
                        tabPlan.moves,
                        tabPlan.moves == 1 and "" or "s"
                    ))
                    return
                end

                local currentInspection = GBO:InspectDepositProfile(tab)
                if currentInspection.lockedItems > 0 then
                    local item = currentInspection.firstLocked
                    frame.StatusText:SetText(string.format(
                        "%s (item %s) stayed locked for 3 seconds. Move the cursor away, close auction actions, then scan again.",
                        item and item.name or "A matching bag item",
                        item and item.itemID or "?"
                    ))
                elseif currentInspection.unclassifiedItems > 0 then
                    local item = currentInspection.firstUnclassified
                    if currentInspection.boundItems > 0 then
                        local boundItem = currentInspection.firstBound
                        frame.StatusText:SetText(string.format(
                            "%s (item %s) is not assigned to a supported category. %s (item %s) also matches this profile but is soulbound.",
                            item and item.name or "A bag material",
                            item and item.itemID or "?",
                            boundItem and boundItem.name or "Another bag item",
                            boundItem and boundItem.itemID or "?"
                        ))
                    else
                        frame.StatusText:SetText(string.format(
                            "%s (item %s) is not covered by this MoP profession catalog. Add its item ID temporarily and report it so the generated rules can be audited.",
                            item and item.name or "A bag material",
                            item and item.itemID or "?"
                        ))
                    end
                elseif currentInspection.boundItems > 0 then
                    local item = currentInspection.firstBound
                    frame.StatusText:SetText(string.format(
                        "%s (item %s) is marked soulbound by the game and cannot enter a guild bank.",
                        item and item.name or "A matching bag item",
                        item and item.itemID or "?"
                    ))
                elseif currentInspection.expansionMismatches > 0 then
                    local item = currentInspection.firstExpansionMismatch
                    local expansionText = item and item.expansionID ~= nil
                        and GBO:GetDepositExpansionName(item.expansionID)
                        or "an unknown expansion"
                    frame.StatusText:SetText(string.format(
                        "The expansion filter excludes %s (item %s, %s).",
                        item and item.name or "the first category match",
                        item and item.itemID or "?",
                        expansionText
                    ))
                elseif currentInspection.matchingItems > 0 then
                    frame.StatusText:SetText(string.format(
                        "Found %d matching item%s, but this tab has no available space or deposit access.",
                        currentInspection.matchingItems,
                        currentInspection.matchingItems == 1 and "" or "s"
                    ))
                elseif currentInspection.unavailableItems > 0 then
                    frame.StatusText:SetText(
                        "A matching bag item is still loading. Wait a moment and scan again."
                    )
                else
                    frame.StatusText:SetText(
                        "Scan complete. No bag items match this profile's categories and expansion filter."
                    )
                end
            end) then
                frame.StatusText:SetTextColor(1, 1, 1)
                frame.StatusText:SetText("Scanning bags and this destination tab...")
            end
        end

        runScan(0)
    end)
    frame.ScanButton:SetPoint("LEFT", frame.SaveButton, "RIGHT", 10, 0)
    frame.CloseButton = createButton(frame, "< Back to Organizer", 140, 28, function()
        frame:Hide()
        if GBO:IsBankOpen() then
            GBO:ShowOrganizerUI()
        end
    end)
    frame.CloseButton:SetPoint("LEFT", frame.ScanButton, "RIGHT", 10, 0)

    frame.StatusText = frame:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontHighlightSmall"
    )
    frame.StatusText:SetPoint("BOTTOMLEFT", 20, 25)
    frame.StatusText:SetPoint("BOTTOMRIGHT", -20, 25)
    frame.StatusText:SetJustifyH("LEFT")

    frame:SetScript("OnShow", function()
        loadDepositSettings(currentTab() or 1)
        scheduleRefresh()
    end)
    frame:SetScript("OnHide", function()
        if not organizerFrame or not organizerFrame:IsShown() then
            if not advancedFrame or not advancedFrame:IsShown() then
                refreshGeneration = refreshGeneration + 1
            end
        end
    end)
    frame:Hide()
    return frame
end

function GBO:ShowOrganizerUI()
    organizerFrame = organizerFrame or createOrganizerFrame()
    if advancedFrame then
        advancedFrame:Hide()
    end
    if depositSettingsFrame then
        depositSettingsFrame:Hide()
    end
    organizerFrame:Show()
    self:RefreshOrganizerUI()
end

function GBO:ShowAdvancedUI()
    advancedFrame = advancedFrame or createAdvancedFrame()
    if organizerFrame then
        organizerFrame:Hide()
    end
    if depositSettingsFrame then
        depositSettingsFrame:Hide()
    end
    advancedFrame:Show()
    self:RefreshOrganizerUI()
end

function GBO:ShowDepositSettingsUI(tab)
    if not self:IsBankOpen() then
        self:Print("Open the guild bank before configuring Smart Deposits.")
        return
    end
    depositSettingsFrame =
        depositSettingsFrame or createDepositSettingsFrame()
    if organizerFrame then
        organizerFrame:Hide()
    end
    if advancedFrame then
        advancedFrame:Hide()
    end
    depositSettingsFrame:Show()
    loadDepositSettings(tonumber(tab) or currentTab())
    self:RefreshOrganizerUI()
end

function GBO:ShowTestUI()
    self:ShowAdvancedUI()
end

function GBO:HideOrganizerUI()
    if organizerFrame then
        organizerFrame:Hide()
    end
    if advancedFrame then
        advancedFrame:Hide()
    end
    if depositSettingsFrame then
        depositSettingsFrame:Hide()
    end
end

GBO:On("GUILDBANKBAGSLOTS_CHANGED", function()
    GBO:RefreshOrganizerUI()
    if autoSelectPending then
        local generation = autoSelectPending.generation
        C_Timer.After(0.10, function()
            if autoSelectPending and autoSelectPending.generation == generation then
                completeAutoSelect(generation)
            end
        end)
    end
end)

GBO:On("GUILDBANK_UPDATE_TABS", function()
    GBO:RefreshOrganizerUI()
end)

local function showForGuildBank()
    if GBO.db and GBO.db.settings and GBO.db.settings.autoOpen ~= false then
        GBO:ShowOrganizerUI()
    end
end

local function hideForGuildBank()
    GBO:HideOrganizerUI()
end

GBO:On("GUILDBANKFRAME_OPENED", showForGuildBank)
GBO:On("GUILDBANKFRAME_CLOSED", hideForGuildBank)

GBO:On("PLAYER_INTERACTION_MANAGER_FRAME_SHOW", function(_, interactionType)
    if GBO:IsGuildBankInteraction(interactionType) then
        showForGuildBank()
    end
end)

GBO:On("PLAYER_INTERACTION_MANAGER_FRAME_HIDE", function(_, interactionType)
    if GBO:IsGuildBankInteraction(interactionType) then
        hideForGuildBank()
    end
end)
