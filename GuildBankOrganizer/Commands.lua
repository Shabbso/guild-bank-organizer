local _, GBO = ...

local function splitWords(message)
    local words = {}
    for word in string.gmatch(message or "", "%S+") do
        table.insert(words, word)
    end
    return words
end

local reportFrame

local function createReportFrame()
    local frame = CreateFrame("Frame", "GuildBankOrganizerReportFrame", UIParent)
    frame:SetSize(720, 500)
    frame:SetPoint("CENTER")
    frame:SetFrameStrata("DIALOG")
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    frame:SetClampedToScreen(true)
    frame:Hide()

    local background = frame:CreateTexture(nil, "BACKGROUND")
    background:SetAllPoints()
    background:SetColorTexture(0.035, 0.045, 0.050, 0.99)
    local header = frame:CreateTexture(nil, "BACKGROUND")
    header:SetPoint("TOPLEFT", 1, -1)
    header:SetPoint("TOPRIGHT", -1, -1)
    header:SetHeight(29)
    header:SetColorTexture(0.020, 0.025, 0.030, 1)

    frame.TitleText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    frame.TitleText:SetPoint("TOPLEFT", 12, -9)
    frame.TitleText:SetText("Guild Bank Organizer  /  Report")

    local close = CreateFrame("Button", nil, frame)
    close:SetSize(24, 22)
    close:SetPoint("TOPRIGHT", -4, -4)
    close:SetNormalFontObject(GameFontNormalSmall)
    close:SetText("x")
    close:SetScript("OnClick", function()
        frame:Hide()
        if GBO:IsBankOpen() then
            GBO:ShowOrganizerUI()
        end
    end)

    local hint = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    hint:SetPoint("TOPLEFT", 12, -32)
    hint:SetText("Click the report, then press Ctrl+A and Ctrl+C to copy it.")

    local scroll = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", 12, -52)
    scroll:SetPoint("BOTTOMRIGHT", -30, 12)

    local edit = CreateFrame("EditBox", nil, scroll)
    edit:SetMultiLine(true)
    edit:SetAutoFocus(false)
    edit:SetFontObject(ChatFontNormal)
    edit:SetWidth(660)
    edit:SetTextInsets(4, 4, 4, 4)
    edit:SetScript("OnEscapePressed", function()
        frame:Hide()
        if GBO:IsBankOpen() then
            GBO:ShowOrganizerUI()
        end
    end)
    edit:SetScript("OnTextChanged", function(self)
        scroll:UpdateScrollChildRect()
        -- GetStringHeight belongs to FontString, not EditBox, in MoP Classic.
        -- EditBox:GetNumLines is available and is sufficient for sizing this
        -- read-only report surface.
        local lineCount = self:GetNumLines() or 1
        self:SetHeight(math.max(420, (lineCount * 14) + 16))
    end)
    scroll:SetScrollChild(edit)

    frame.EditBox = edit
    return frame
end

function GBO:ShowReport()
    local report = self.lastReport
    if not report and self.db and self.db.runs and self.db.runs[1] then
        report = self.db.runs[1].report
    end
    if not report then
        self:Print("No operation report is available yet.")
        return
    end

    reportFrame = reportFrame or createReportFrame()
    self:HideOrganizerUI()
    reportFrame.EditBox:SetText(report)
    reportFrame.EditBox:SetCursorPosition(0)
    reportFrame:Show()
end

function GBO:PrintHelp()
    self:Print("Commands:")
    self:Print("/gbo or /gbo ui - open the compact organizer")
    self:Print("/gbo sort [cadence] - sort the currently selected tab")
    self:Print("/gbo advanced - open diagnostics and sort-speed settings")
    self:Print("/gbo deposits - configure Smart Deposit tab profiles")
    self:Print("/gbo deposit [tab] - deposit all planned items or one assigned tab")
    self:Print("/gbo scan - scan all viewable tabs without moving anything")
    self:Print("/gbo test <tab> <source> <empty> [cadence] [moves]")
    self:Print("  Example: /gbo test 1 1 2 1.25 10")
    self:Print("  Source must contain an item; destination must be empty; moves must be even.")
    self:Print("/gbo status - show current operation status")
    self:Print("/gbo stop - stop the current sort, scan, or diagnostic")
    self:Print("/gbo report - open the latest copyable operation timeline")
end

function GBO:HandleSlash(message)
    local args = splitWords(message)
    local command = string.lower(args[1] or "ui")

    if command == "ui" then
        self:ShowOrganizerUI()
    elseif command == "advanced" or command == "testui" then
        self:ShowAdvancedUI()
    elseif command == "help" then
        self:PrintHelp()
    elseif command == "sort" then
        self:StartSort(nil, args[2])
    elseif command == "deposits" or command == "depositsettings" then
        self:ShowDepositSettingsUI()
    elseif command == "deposit" then
        self:StartDeposit(args[2])
    elseif command == "scan" then
        self:StartScan()
    elseif command == "test" then
        self:StartDiagnostic(args[2], args[3], args[4], args[5], args[6])
    elseif command == "status" then
        if self.IsSortRunning and self:IsSortRunning() then
            self:Print(self:GetSortStatus())
        elseif self.IsDepositRunning and
            (self:IsDepositRunning() or self:IsDepositScanning())
        then
            self:Print(self:GetDepositStatus())
        elseif self:IsScanRunning() then
            self:Print("A guild-bank scan is running.")
        else
            self:Print(self:GetDiagnosticStatus())
        end
    elseif command == "stop" then
        if self.IsSortRunning and self:IsSortRunning() then
            self:AbortSort("stopped by user")
        elseif self.IsDepositRunning and
            (self:IsDepositRunning() or self:IsDepositScanning())
        then
            self:AbortDeposit("stopped by user")
        elseif self:IsScanRunning() then
            self:CancelScan("stopped by user")
        elseif self:IsDiagnosticRunning() then
            self:AbortDiagnostic("stopped by user")
        else
            self:Print("Nothing is running.")
        end
    elseif command == "report" then
        self:ShowReport()
    else
        self:Print("Unknown command: " .. tostring(command))
        self:PrintHelp()
    end
end

SLASH_GUILDBANKORGANIZER1 = "/gbo"
SLASH_GUILDBANKORGANIZER2 = "/guildbankorganizer"
SlashCmdList.GUILDBANKORGANIZER = function(message)
    GBO:HandleSlash(message)
end
