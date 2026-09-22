local _, GBO = ...
local UI = GBO.UI

function UI.currentTab()
    if not GBO:IsBankOpen() or not GetCurrentGuildBankTab then
        return nil
    end
    return GetCurrentGuildBankTab()
end

function UI.isBusy()
    return GBO:IsVerificationRunning() or GBO:IsDiagnosticRunning()
        or GBO:IsScanRunning()
        or (GBO.IsSortRunning and GBO:IsSortRunning())
        or (GBO.IsDepositRunning
            and (GBO:IsDepositRunning() or GBO:IsDepositScanning()))
end

function UI.stopCurrentOperation()
    if GBO:IsVerificationRunning() then
        GBO:AbortVerification()
    elseif GBO.IsSortRunning and GBO:IsSortRunning() then
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

function UI.depositCurrentTab()
    local tab = UI.currentTab()
    if tab then
        GBO:StartDeposit(tab)
    end
end

function UI.depositAllTabs()
    GBO:StartDeposit()
end

function UI.formatDepositCount(scope)
    return string.format(
        "%d item%s in %d deposit%s",
        scope.totalItems,
        scope.totalItems == 1 and "" or "s",
        scope.totalMoves,
        scope.totalMoves == 1 and "" or "s"
    )
end

function UI.formatAllDepositCount(scope)
    return string.format(
        "%s across %d tab%s",
        UI.formatDepositCount(scope),
        scope.destinationCount,
        scope.destinationCount == 1 and "" or "s"
    )
end

UI.ROUTE_EXACT_PRIORITY = 3

function UI.formatRoutingConflict(conflict)
    local tabLabels = {}
    for _, tab in ipairs(conflict.tabs or {}) do
        table.insert(tabLabels, "Tab " .. tostring(tab))
    end
    if conflict.priority == UI.ROUTE_EXACT_PRIORITY
        or conflict.categoryKey == nil
    then
        return string.format(
            "%s has exact item-ID routes to %s. Choose one destination.",
            tostring(conflict.name or ("Item " .. tostring(conflict.itemID))),
            table.concat(tabLabels, " and ")
        )
    end
    return string.format(
        "%s has equally specific %s / %s routes to %s. Choose one destination.",
        tostring(conflict.name or ("Item " .. tostring(conflict.itemID))),
        tostring(GBO:GetDepositCategoryName(conflict.categoryKey) or "Exact item"),
        tostring(GBO:GetDepositExpansionName(conflict.expansionID) or "Unknown expansion"),
        table.concat(tabLabels, " and ")
    )
end

function UI.updateSelectionDescription()
    if not UI.advancedFrame then
        return
    end

    local tab = UI.currentTab()
    local sourceSlot = tonumber(UI.advancedFrame.SourceInput:GetText())
    local emptySlot = tonumber(UI.advancedFrame.EmptyInput:GetText())
    if not tab or not sourceSlot or not emptySlot then
        UI.advancedFrame.SelectionText:SetText("Click Auto Select or enter source and empty slot numbers.")
        return
    end

    UI.advancedFrame.SelectionText:SetText(
        GBO:DescribeSlot(GBO:ReadSlot(tab, sourceSlot))
        .. "\n"
        .. GBO:DescribeSlot(GBO:ReadSlot(tab, emptySlot))
    )
end

function UI.completeAutoSelect(generation)
    if not UI.advancedFrame
        or not UI.autoSelectPending
        or UI.autoSelectPending.generation ~= generation
    then
        return
    end

    local tab = UI.autoSelectPending.tab
    if UI.currentTab() ~= tab then
        UI.autoSelectPending = nil
        UI.advancedFrame.ActionText:SetText("The selected tab changed. Click Auto Select again.")
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

    UI.autoSelectPending = nil
    if not source then
        UI.advancedFrame.ActionText:SetText("No unlocked occupied source slot was found.")
        return
    end
    if not destination then
        UI.advancedFrame.ActionText:SetText("No empty diagnostic destination was found.")
        return
    end

    UI.advancedFrame.SourceInput:SetText(tostring(source.slot))
    UI.advancedFrame.EmptyInput:SetText(tostring(destination.slot))
    UI.advancedFrame.ActionText:SetText(string.format(
        "Selected item:%s x%d in slot %d and empty slot %d.",
        tostring(source.itemID or "?"),
        source.count or 0,
        source.slot,
        destination.slot
    ))
    UI.updateSelectionDescription()
end

function UI.beginAutoSelect()
    if not UI.advancedFrame then
        return
    end
    if not GBO:IsBankOpen() then
        UI.advancedFrame.ActionText:SetText("Open the guild bank first.")
        return
    end
    if UI.isBusy() then
        UI.advancedFrame.ActionText:SetText("Stop or finish the current operation first.")
        return
    end

    local tab = UI.currentTab()
    UI.autoSelectGeneration = UI.autoSelectGeneration + 1
    UI.autoSelectPending = {
        generation = UI.autoSelectGeneration,
        tab = tab,
    }
    UI.advancedFrame.ActionText:SetText(string.format("Refreshing tab %d before selecting slots...", tab))
    local owner = UI.autoSelectPending
    local generation = UI.autoSelectGeneration
    local started, reason = GBO:ReadBankTab(owner, tab, function(ok, why)
        if UI.autoSelectPending ~= owner then return end
        if ok then UI.completeAutoSelect(generation)
        else
            UI.autoSelectPending = nil
            UI.advancedFrame.ActionText:SetText(why)
        end
    end)
    if not started then
        UI.autoSelectPending = nil
        UI.advancedFrame.ActionText:SetText(reason)
    end
end

function UI.runDiagnosticFromInputs(forceCadence, forceMoves)
    if not GBO:IsBankOpen() then
        UI.advancedFrame.ActionText:SetText("Open the guild bank first.")
        return
    end

    local cadence = forceCadence or tonumber(UI.advancedFrame.TestCadenceInput:GetText())
    local moves = forceMoves or tonumber(UI.advancedFrame.MovesInput:GetText())
    if forceCadence then
        UI.advancedFrame.TestCadenceInput:SetText(string.format("%.2f", forceCadence))
    end
    if forceMoves then
        UI.advancedFrame.MovesInput:SetText(tostring(forceMoves))
    end

    GBO:StartDiagnostic(
        UI.currentTab(),
        tonumber(UI.advancedFrame.SourceInput:GetText()),
        tonumber(UI.advancedFrame.EmptyInput:GetText()),
        cadence,
        moves
    )
end

function UI.applySortCadence()
    local cadence = tonumber(UI.advancedFrame.SortCadenceInput:GetText())
    if not cadence
        or cadence < GBO.defaults.sortMinimumCadence
        or cadence > 5.0
    then
        UI.advancedFrame.ActionText:SetText(string.format(
            "Sort speed must be between %.2f and 5.00 seconds.",
            GBO.defaults.sortMinimumCadence
        ))
        return
    end

    GBO.db.settings.sortCadence = cadence
    UI.advancedFrame.ActionText:SetText(string.format(
        "Sort cadence saved as %.2f seconds per move.",
        cadence
    ))
    GBO:RefreshOrganizerUI()
end

function UI.updateAutoOpen(check)
    GBO.db.settings.autoOpen = check:GetChecked() and true or false
    UI.advancedFrame.SettingsText:SetText(
        GBO.db.settings.autoOpen
            and "The compact organizer will open with the guild bank."
            or "Use /gbo when you want to open the compact organizer."
    )
end

function UI.updateSortDirection(check)
    if UI.isBusy() then
        check:SetChecked(GBO.db.settings.sortInverted)
        UI.advancedFrame.SettingsText:SetText("Finish the current operation before changing sort direction.")
        return
    end

    GBO.db.settings.sortInverted = check:GetChecked() and true or false
    UI.advancedFrame.SettingsText:SetText(
        GBO.db.settings.sortInverted
            and "Reverse bag-style ordering is enabled."
            or "Normal bag-style ordering is enabled."
    )
    GBO:RefreshOrganizerUI()
end

function UI.setDepositMutationControlsEnabled(enabled)
    local frame = UI.depositSettingsFrame
    if not frame then
        return
    end

    for _, control in ipairs({
        frame.TabInput,
        frame.UseCurrentButton,
        frame.LoadButton,
        frame.LabelInput,
        frame.EnabledCheck,
        frame.AllExpansionsCheck,
        frame.ExactItemsInput,
        frame.SaveButton,
        frame.ScanButton,
    }) do
        UI.setButtonEnabled(control, enabled)
    end
    for _, check in pairs(frame.CategoryChecks or {}) do
        UI.setButtonEnabled(check, enabled)
    end
    for _, check in pairs(frame.ExpansionChecks or {}) do
        UI.setButtonEnabled(check, enabled)
    end
end

function GBO:RefreshOrganizerUI()
    local tab = UI.currentTab()
    local busy = UI.isBusy()
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

    if UI.organizerFrame and UI.organizerFrame:IsShown() then
        if tab then
            local name = GetGuildBankTabInfo(tab)
            UI.organizerFrame.TabText:SetText(string.format(
                "Tab %d%s",
                tab,
                name and (" — " .. name) or ""
            ))
        else
            UI.organizerFrame.TabText:SetText("Guild bank is closed")
        end

        UI.setButtonEnabled(UI.organizerFrame.SortButton, tab and not busy)
        UI.setButtonEnabled(UI.organizerFrame.SetupButton, tab and not busy)
        if busy then
            UI.organizerFrame.DepositCurrentButton:Hide()
            UI.organizerFrame.DepositAllButton:Hide()
            UI.organizerFrame.DepositStopButton:Show()
            UI.setButtonEnabled(UI.organizerFrame.DepositStopButton, true)
        else
            UI.organizerFrame.DepositCurrentButton:Show()
            UI.organizerFrame.DepositAllButton:Show()
            UI.organizerFrame.DepositStopButton:Hide()
            UI.setButtonEnabled(
                UI.organizerFrame.DepositCurrentButton,
                tab and currentDepositsAvailable
            )
            UI.setButtonEnabled(
                UI.organizerFrame.DepositAllButton,
                tab and allDepositsAvailable
            )
        end

        if self:IsVerificationRunning() then
            UI.organizerFrame.StatusText:SetText("Checking again without moving items...")
        elseif depositing then
            UI.organizerFrame.StatusText:SetText(self:GetDepositStatus())
        elseif depositScanning then
            UI.organizerFrame.StatusText:SetText("Scanning bags and assigned tabs...")
        elseif sorting then
            UI.organizerFrame.StatusText:SetText(self:GetSortStatus())
        elseif self:IsDiagnosticRunning() then
            UI.organizerFrame.StatusText:SetText("Advanced diagnostic is running.")
        elseif self:IsScanRunning() then
            UI.organizerFrame.StatusText:SetText("Scanning guild-bank tabs...")
        elseif routingConflict then
            UI.organizerFrame.StatusText:SetText(
                "Smart Deposit needs attention: resolve a routing conflict."
            )
        elseif depositsAvailable then
            UI.organizerFrame.StatusText:SetText(
                "Smart Deposit ready. Choose this tab or all configured tabs."
            )
        elseif self.lastOutcome then
            UI.organizerFrame.StatusText:SetText(string.format(
                "%s: %s",
                self.lastOutcome.ok and "Done" or "Stopped",
                tostring(self.lastOutcome.reason)
            ))
        else
            UI.organizerFrame.StatusText:SetText("Ready. Start sorting to calculate moves and ETA.")
        end

        if depositing then
            local progress = self:GetDepositProgress()
            local progressMaximum = progress.total > 0 and progress.total or 1
            UI.organizerFrame.ProgressBar:SetMinMaxValues(0, progressMaximum)
            UI.organizerFrame.ProgressBar:SetValue(progress.completed)
            UI.organizerFrame.ProgressBar.Text:SetText(string.format(
                "%d / %d confirmed • %d left • about %s",
                progress.completed,
                progress.total,
                progress.remaining,
                progress.etaText
            ))
        elseif depositScanning then
            UI.organizerFrame.ProgressBar:SetMinMaxValues(0, 1)
            UI.organizerFrame.ProgressBar:SetValue(0)
            UI.organizerFrame.ProgressBar.Text:SetText("Checking bags and deposit profiles...")
        elseif sorting then
            local progress = self:GetSortProgress()
            local progressMaximum = progress.total and progress.total > 0
                and progress.total
                or 1
            UI.organizerFrame.ProgressBar:SetMinMaxValues(0, progressMaximum)
            UI.organizerFrame.ProgressBar:SetValue(progress.completed or 0)
            if progress.total == 0 then
                UI.organizerFrame.ProgressBar.Text:SetText("No moves needed • completing the final server check")
            elseif progress.total and progress.remaining == 0 then
                UI.organizerFrame.ProgressBar.Text:SetText(string.format(
                    "All %d moves confirmed • final server check",
                    progress.total
                ))
            elseif progress.total then
                UI.organizerFrame.ProgressBar.Text:SetText(string.format(
                    "%d / %d confirmed • %d left • about %s",
                    progress.completed,
                    progress.total,
                    progress.remaining,
                    progress.etaText or "calculating"
                ))
            else
                UI.organizerFrame.ProgressBar.Text:SetText("Reading the tab and calculating the plan...")
            end
        elseif depositsAvailable then
            UI.organizerFrame.ProgressBar:SetMinMaxValues(0, depositPlan.totalMoves)
            UI.organizerFrame.ProgressBar:SetValue(0)
            UI.organizerFrame.ProgressBar.Text:SetText(string.format(
                "%d items • %d deposits available",
                depositPlan.totalItems,
                depositPlan.totalMoves
            ))
        else
            UI.organizerFrame.ProgressBar:SetMinMaxValues(0, 1)
            UI.organizerFrame.ProgressBar:SetValue(0)
            UI.organizerFrame.ProgressBar.Text:SetText("Move count and ETA appear when sorting")
        end

        if busy then
            if depositing then
                UI.organizerFrame.SmartHint:SetText(
                    "Depositing selected items. Stop waits for the active move to settle."
                )
            elseif depositScanning then
                UI.organizerFrame.SmartHint:SetText("Checking bags and assigned tabs...")
            else
                UI.organizerFrame.SmartHint:SetText(
                    "Finish or stop the active organizer operation before depositing."
                )
            end
            UI.organizerFrame.SetupButton:SetText(
                self:HasEnabledDepositProfiles() and "Edit" or "Set Up"
            )
        elseif routingConflict then
            UI.organizerFrame.SmartHint:SetText(UI.formatRoutingConflict(routingConflict))
            UI.organizerFrame.SetupButton:SetText("Resolve")
        elseif not self:HasEnabledDepositProfiles() then
            UI.organizerFrame.SmartHint:SetText(
                "Choose what belongs in each tab. Setup takes two steps."
            )
            UI.organizerFrame.SetupButton:SetText("Set Up")
        elseif allDepositsAvailable then
            local currentText = currentDepositsAvailable
                and UI.formatDepositCount(currentScope)
                or "No matching items"
            UI.organizerFrame.SmartHint:SetText(string.format(
                "This tab: %s\nAll configured tabs: %s",
                currentText,
                UI.formatAllDepositCount(allScope)
            ))
            UI.organizerFrame.SetupButton:SetText("Edit")
        else
            UI.organizerFrame.SmartHint:SetText(
                "No matching bag items are ready right now."
            )
            UI.organizerFrame.SetupButton:SetText("Edit")
        end

        local cadence = self.db and self.db.settings and self.db.settings.sortCadence
            or self.defaults.cadence
        UI.organizerFrame.FooterText:SetText(string.format(
            "v%s • %s order • %.2fs per move",
            tostring(self.version),
            self.db and self.db.settings and self.db.settings.sortInverted and "Reverse" or "Normal",
            cadence
        ))
    end

    if UI.advancedFrame and UI.advancedFrame:IsShown() then
        if tab then
            local name = GetGuildBankTabInfo(tab)
            UI.advancedFrame.TabText:SetText(string.format(
                "Current tab: %d%s",
                tab,
                name and (" — " .. name) or ""
            ))
        else
            UI.advancedFrame.TabText:SetText("Current tab: guild bank is closed")
        end

        UI.setButtonEnabled(UI.advancedFrame.AutoButton, tab and not busy)
        UI.setButtonEnabled(UI.advancedFrame.ScanButton, tab and not busy)
        UI.setButtonEnabled(UI.advancedFrame.SmokeButton, tab and not busy)
        UI.setButtonEnabled(UI.advancedFrame.RunButton, tab and not busy)
        UI.setButtonEnabled(UI.advancedFrame.StopButton, busy)
        UI.setButtonEnabled(UI.advancedFrame.ReportButton, true)
        UI.setButtonEnabled(UI.advancedFrame.VerifyButton, tab and not busy and self.verificationRequest ~= nil)
        UI.advancedFrame.AutoOpenCheck:SetChecked(self.db.settings.autoOpen)
        UI.advancedFrame.ReverseCheck:SetChecked(self.db.settings.sortInverted)
        local recoveryCount = UI.countProfileRecoveryEntries()
        if recoveryCount > 0 then
            UI.advancedFrame.RecoveryText:SetText(string.format(
                "Recovered Smart Deposit data: %d quarantined entr%s. Normalized profiles route items; Copy Report includes recovery details.",
                recoveryCount,
                recoveryCount == 1 and "y" or "ies"
            ))
        else
            UI.advancedFrame.RecoveryText:SetText("")
        end

        if self:IsVerificationRunning() then
            UI.advancedFrame.StatusText:SetText("Checking again without moving items...")
        elseif depositing or depositScanning then
            UI.advancedFrame.StatusText:SetText(self:GetDepositStatus())
        elseif sorting then
            UI.advancedFrame.StatusText:SetText(self:GetSortStatus())
        elseif self:IsDiagnosticRunning() then
            UI.advancedFrame.StatusText:SetText(self:GetDiagnosticStatus())
        elseif self:IsScanRunning() then
            UI.advancedFrame.StatusText:SetText("Scanning viewable guild-bank tabs...")
        elseif self.lastOutcome then
            UI.advancedFrame.StatusText:SetText(string.format(
                "%s: %s",
                self.lastOutcome.ok and "PASS" or "FAIL",
                tostring(self.lastOutcome.reason)
            ))
        else
            UI.advancedFrame.StatusText:SetText("Advanced diagnostics are ready.")
        end
    end

    if UI.depositSettingsFrame and UI.depositSettingsFrame:IsShown() then
        if tab
            and UI.depositSettingsFrame.LastBankTab ~= tab
            and UI.loadDepositSettings
            and UI.flushDepositSettingsDraft
            and not UI.depositSettingsFrame.Flushing
            and not UI.depositSettingsFrame.Navigating
        then
            if UI.flushDepositSettingsDraft("bank-tab") then
                UI.loadDepositSettings(tab)
            end
        end
        UI.setDepositMutationControlsEnabled(tab and not busy)
    end
end

function UI.scheduleRefresh()
    UI.refreshGeneration = UI.refreshGeneration + 1
    local generation = UI.refreshGeneration

    local function refresh()
        local organizerVisible = UI.organizerFrame and UI.organizerFrame:IsShown()
        local advancedVisible = UI.advancedFrame and UI.advancedFrame:IsShown()
        local depositSettingsVisible =
            UI.depositSettingsFrame and UI.depositSettingsFrame:IsShown()
        local categoryReferenceVisible =
            UI.categoryReferenceFrame and UI.categoryReferenceFrame:IsShown()
        if UI.refreshGeneration ~= generation
            or not organizerVisible and not advancedVisible
                and not depositSettingsVisible and not categoryReferenceVisible
        then
            return
        end
        GBO:RefreshOrganizerUI()
        if UI.isBusy() then C_Timer.After(0.25, refresh) end
    end

    refresh()
end

function GBO:RequestUIRefresh()
    if UI.refreshQueued then return end
    UI.refreshQueued = true
    C_Timer.After(0, function()
        UI.refreshQueued = false
        UI.scheduleRefresh()
    end)
end

function UI.anchorBesideGuildBank(frame)
    if GuildBankFrame then
        frame:SetPoint("TOPLEFT", GuildBankFrame, "TOPRIGHT", 8, 0)
    else
        frame:SetPoint("CENTER")
    end
end

