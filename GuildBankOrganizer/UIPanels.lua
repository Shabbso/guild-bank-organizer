local _, GBO = ...
local UI = GBO.UI
local unpack = unpack or table.unpack

function UI.createOrganizerFrame()
    local frame = UI.createPanel(
        "GuildBankOrganizerFrame",
        430,
        292,
        "Guild Bank Organizer"
    )
    UI.anchorBesideGuildBank(frame)

    frame.BrandIcon = frame:CreateTexture(nil, "ARTWORK")
    frame.BrandIcon:SetSize(32, 32)
    frame.BrandIcon:SetPoint("TOPLEFT", 16, -42)
    frame.BrandIcon:SetTexture("Interface\\AddOns\\GuildBankOrganizer\\Media\\Icon")

    frame.TabText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    frame.TabText:SetPoint("TOPLEFT", 58, -42)
    frame.TabText:SetTextColor(unpack(UI.COLORS.gold))

    frame.StatusText = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    frame.StatusText:SetPoint("TOPLEFT", 58, -60)
    frame.StatusText:SetPoint("TOPRIGHT", -16, -60)
    frame.StatusText:SetJustifyH("LEFT")
    frame.StatusText:SetText("Ready.")

    frame.ProgressBar = UI.createProgressBar(frame)
    frame.ProgressBar:SetPoint("TOPLEFT", 16, -84)

    frame.SortButton = UI.createButton(frame, "Sort This Tab", 398, 34, function()
        GBO:StartSortCurrentTab()
    end)
    frame.SortButton:SetPoint("TOPLEFT", 16, -112)

    frame.SetupCard = UI.createSolidTexture(
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
    frame.SmartTitle:SetTextColor(unpack(UI.COLORS.gold))
    frame.SmartHint = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    frame.SmartHint:SetPoint("TOPLEFT", 28, -194)
    frame.SmartHint:SetPoint("TOPRIGHT", -28, -194)
    frame.SmartHint:SetJustifyH("LEFT")
    frame.SmartHint:SetText("Choose what belongs in each tab.")

    frame.SetupButton = UI.createButton(frame, "Set Up", 70, 28, function()
        local conflict = GBO.GetFirstDepositRoutingConflict
            and GBO:GetFirstDepositRoutingConflict()
        GBO:ShowDepositSettingsUI(
            conflict and conflict.tabs and conflict.tabs[1]
        )
    end)
    frame.SetupButton:SetPoint("TOPRIGHT", -26, -159)

    frame.DepositCurrentButton = UI.createButton(
        frame,
        "Deposit This Tab",
        182,
        30,
        UI.depositCurrentTab
    )
    frame.DepositCurrentButton:SetPoint("TOPLEFT", 28, -226)
    UI.stylePrimaryButton(frame.DepositCurrentButton)

    frame.DepositAllButton = UI.createButton(
        frame,
        "Deposit All Tabs",
        182,
        30,
        UI.depositAllTabs
    )
    frame.DepositAllButton:SetPoint(
        "LEFT",
        frame.DepositCurrentButton,
        "RIGHT",
        8,
        0
    )

    frame.DepositStopButton = UI.createButton(
        frame,
        "Stop",
        372,
        30,
        UI.stopCurrentOperation
    )
    frame.DepositStopButton:SetPoint("TOPLEFT", 28, -226)
    frame.DepositStopButton:Hide()

    frame.AdvancedButton = UI.createButton(frame, "Settings", 72, 20, function()
        GBO:ShowAdvancedUI()
    end)
    frame.AdvancedButton:SetPoint("BOTTOMLEFT", 8, 4)

    frame.FooterText = frame:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    frame.FooterText:SetPoint("BOTTOMRIGHT", -12, 8)
    frame.FooterText:SetText("Normal bag-style order • 1.25s per move")

    frame:SetScript("OnShow", UI.scheduleRefresh)
    frame:SetScript("OnHide", function()
        if (not UI.advancedFrame or not UI.advancedFrame:IsShown())
            and (not UI.depositSettingsFrame or not UI.depositSettingsFrame:IsShown())
            and (not UI.categoryReferenceFrame or not UI.categoryReferenceFrame:IsShown())
        then
            UI.refreshGeneration = UI.refreshGeneration + 1
        end
    end)
    frame:Hide()
    return frame
end

function UI.createAdvancedFrame()
    local frame = UI.createPanel(
        "GuildBankOrganizerAdvancedFrame",
        470,
        550,
        "Guild Bank Organizer  /  Settings"
    )
    UI.anchorBesideGuildBank(frame)
    frame.Close:Hide()
    frame.HeaderBackButton = UI.createButton(frame, "< Back to Organizer", 134, 22, function()
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

    UI.createLabel(frame, "Organizer settings", 20, -66)

    frame.AutoOpenCheck = UI.createCheckBox(
        frame,
        "Open automatically with the guild bank",
        18,
        -82,
        UI.updateAutoOpen
    )
    frame.ReverseCheck = UI.createCheckBox(
        frame,
        "Reverse sort direction",
        260,
        -82,
        UI.updateSortDirection
    )

    UI.createLabel(frame, "Seconds per sort move", 20, -126)
    frame.SortCadenceInput = UI.createInput(frame, 70, 172, -120)
    frame.SortCadenceInput:SetText("1.25")
    frame.SpeedButton = UI.createButton(frame, "Save Sort Speed", 125, 24, UI.applySortCadence)
    frame.SpeedButton:SetPoint("TOPLEFT", 232, -120)

    frame.DepositSettingsButton = UI.createButton(
        frame,
        "Smart Deposits",
        96,
        24,
        function()
            GBO:ShowDepositSettingsUI()
        end
    )
    frame.DepositSettingsButton:SetPoint("TOPLEFT", 360, -120)

    frame.CategoryReferenceButton = UI.createButton(
        frame,
        "Category Reference",
        126,
        24,
        function()
            GBO:ShowCategoryReferenceUI()
        end
    )
    frame.CategoryReferenceButton:SetPoint("TOPLEFT", 330, -150)

    frame.SettingsText = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    frame.SettingsText:SetPoint("TOPLEFT", 20, -182)
    frame.SettingsText:SetPoint("TOPRIGHT", -20, -182)
    frame.SettingsText:SetJustifyH("LEFT")
    frame.SettingsText:SetText("Normal bag-style ordering is enabled.")

    frame.RecoveryText = frame:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormalSmall"
    )
    frame.RecoveryText:SetPoint("TOPLEFT", 20, -202)
    frame.RecoveryText:SetPoint("TOPRIGHT", -20, -202)
    frame.RecoveryText:SetJustifyH("LEFT")
    frame.RecoveryText:SetTextColor(unpack(UI.COLORS.gold))
    frame.RecoveryText:SetText("")

    UI.createLabel(frame, "Diagnostics", 20, -242)

    frame.TabText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    frame.TabText:SetPoint("TOPLEFT", 20, -268)

    UI.createLabel(frame, "Test source", 20, -301)
    UI.createLabel(frame, "Test empty", 130, -301)
    UI.createLabel(frame, "Test cadence", 240, -301)
    UI.createLabel(frame, "Moves", 350, -301)

    frame.SourceInput = UI.createInput(frame, 70, 20, -321)
    frame.EmptyInput = UI.createInput(frame, 70, 130, -321)
    frame.TestCadenceInput = UI.createInput(frame, 70, 240, -321)
    frame.MovesInput = UI.createInput(frame, 70, 350, -321)
    frame.TestCadenceInput:SetText("1.25")
    frame.MovesInput:SetText("10")
    frame.SourceInput:SetScript("OnTextChanged", UI.updateSelectionDescription)
    frame.EmptyInput:SetScript("OnTextChanged", UI.updateSelectionDescription)

    frame.SelectionText = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    frame.SelectionText:SetPoint("TOPLEFT", 20, -357)
    frame.SelectionText:SetPoint("TOPRIGHT", -20, -357)
    frame.SelectionText:SetJustifyH("LEFT")
    frame.SelectionText:SetText("Click Auto Select or enter source and empty slot numbers.")

    frame.ActionText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    frame.ActionText:SetPoint("TOPLEFT", 20, -399)
    frame.ActionText:SetPoint("TOPRIGHT", -20, -399)
    frame.ActionText:SetJustifyH("LEFT")
    frame.ActionText:SetText("Use ordinary, replaceable items for movement diagnostics.")

    frame.AutoButton = UI.createButton(frame, "Auto Select", 100, 24, UI.beginAutoSelect)
    frame.AutoButton:SetPoint("TOPLEFT", 20, -426)

    frame.ScanButton = UI.createButton(frame, "Scan Tabs", 100, 24, function()
        GBO:StartScan()
    end)
    frame.ScanButton:SetPoint("LEFT", frame.AutoButton, "RIGHT", 8, 0)

    frame.SmokeButton = UI.createButton(frame, "Smoke Test", 100, 24, function()
        UI.runDiagnosticFromInputs(1.50, 2)
    end)
    frame.SmokeButton:SetPoint("LEFT", frame.ScanButton, "RIGHT", 8, 0)

    frame.RunButton = UI.createButton(frame, "Run Test", 100, 24, function()
        UI.runDiagnosticFromInputs()
    end)
    frame.RunButton:SetPoint("LEFT", frame.SmokeButton, "RIGHT", 8, 0)

    frame.StopButton = UI.createButton(frame, "Stop", 110, 24, UI.stopCurrentOperation)
    frame.StopButton:SetPoint("TOPLEFT", 20, -464)

    frame.ReportButton = UI.createButton(frame, "Copy Report", 110, 24, function()
        GBO:ShowReport()
    end)
    frame.ReportButton:SetPoint("LEFT", frame.StopButton, "RIGHT", 10, 0)

    frame.VerifyButton = UI.createButton(frame, "Check Again", 110, 24, function()
        GBO:CheckAgain()
    end)
    frame.VerifyButton:SetPoint("LEFT", frame.ReportButton, "RIGHT", 10, 0)

    frame.StatusText = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    frame.StatusText:SetPoint("TOPLEFT", 20, -506)
    frame.StatusText:SetPoint("TOPRIGHT", -20, -506)
    frame.StatusText:SetJustifyH("LEFT")
    frame.StatusText:SetText("Advanced diagnostics are ready.")

    frame:SetScript("OnShow", function()
        frame.SortCadenceInput:SetText(string.format("%.2f", GBO.db.settings.sortCadence))
        frame.AutoOpenCheck:SetChecked(GBO.db.settings.autoOpen)
        frame.ReverseCheck:SetChecked(GBO.db.settings.sortInverted)
        UI.scheduleRefresh()
    end)
    frame:SetScript("OnHide", function()
        UI.autoSelectGeneration = UI.autoSelectGeneration + 1
        if UI.autoSelectPending then GBO:CancelBankRead(UI.autoSelectPending) end
        UI.autoSelectPending = nil
        if (not UI.organizerFrame or not UI.organizerFrame:IsShown())
            and (not UI.depositSettingsFrame or not UI.depositSettingsFrame:IsShown())
            and (not UI.categoryReferenceFrame or not UI.categoryReferenceFrame:IsShown())
        then
            UI.refreshGeneration = UI.refreshGeneration + 1
        end
    end)
    frame:Hide()
    return frame
end

