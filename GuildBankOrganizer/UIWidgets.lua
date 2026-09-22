local _, GBO = ...
GBO.UI = {}
local UI = GBO.UI
local unpack = unpack or table.unpack

UI.autoSelectGeneration = 0

UI.refreshGeneration = 0

UI.COLORS = {
    panel = {0.035, 0.045, 0.050, 0.98},
    header = {0.020, 0.025, 0.030, 1},
    surface = {0.070, 0.082, 0.088, 1},
    surfaceHover = {0.095, 0.115, 0.122, 1},
    border = {0.17, 0.20, 0.21, 1},
    accent = {0.10, 0.78, 0.82, 1},
    gold = {1.00, 0.82, 0.18, 1},
    muted = {0.62, 0.65, 0.66, 1},
}

function UI.setButtonEnabled(button, enabled)
    if enabled then
        button:Enable()
    else
        button:Disable()
    end
end

function UI.createButton(parent, text, width, height, callback)
    local button = CreateFrame("Button", nil, parent)
    button:SetSize(width, height or 24)
    button:SetNormalFontObject(GameFontNormalSmall)
    button:SetText(text)
    button:SetScript("OnClick", callback)
    button.Background = button:CreateTexture(nil, "BACKGROUND")
    button.Background:SetAllPoints()
    button.Background:SetColorTexture(unpack(UI.COLORS.surface))
    button.Top = button:CreateTexture(nil, "BORDER")
    button.Top:SetPoint("TOPLEFT", 0, 0)
    button.Top:SetPoint("TOPRIGHT", 0, 0)
    button.Top:SetHeight(1)
    button.Top:SetColorTexture(unpack(UI.COLORS.border))
    button.Bottom = button:CreateTexture(nil, "BORDER")
    button.Bottom:SetPoint("BOTTOMLEFT", 0, 0)
    button.Bottom:SetPoint("BOTTOMRIGHT", 0, 0)
    button.Bottom:SetHeight(1)
    button.Bottom:SetColorTexture(unpack(UI.COLORS.border))
    button.Left = button:CreateTexture(nil, "BORDER")
    button.Left:SetPoint("TOPLEFT", 0, 0)
    button.Left:SetPoint("BOTTOMLEFT", 0, 0)
    button.Left:SetWidth(1)
    button.Left:SetColorTexture(unpack(UI.COLORS.border))
    button.Right = button:CreateTexture(nil, "BORDER")
    button.Right:SetPoint("TOPRIGHT", 0, 0)
    button.Right:SetPoint("BOTTOMRIGHT", 0, 0)
    button.Right:SetWidth(1)
    button.Right:SetColorTexture(unpack(UI.COLORS.border))
    button:SetScript("OnEnter", function(self)
        if self:IsEnabled() then
            self.Background:SetColorTexture(unpack(UI.COLORS.surfaceHover))
        end
    end)
    button:SetScript("OnLeave", function(self)
        self.Background:SetColorTexture(unpack(UI.COLORS.surface))
    end)
    button:SetScript("OnDisable", function(self)
        self.Background:SetColorTexture(0.035, 0.040, 0.043, 1)
    end)
    button:SetScript("OnEnable", function(self)
        self.Background:SetColorTexture(unpack(UI.COLORS.surface))
    end)
    return button
end

function UI.stylePrimaryButton(button)
    local function setBorder(red, green, blue, alpha)
        button.Top:SetColorTexture(red, green, blue, alpha)
        button.Bottom:SetColorTexture(red, green, blue, alpha)
        button.Left:SetColorTexture(red, green, blue, alpha)
        button.Right:SetColorTexture(red, green, blue, alpha)
    end
    local function applyEnabledStyle(self)
        self.Background:SetColorTexture(0.15, 0.105, 0.020, 1)
        setBorder(unpack(UI.COLORS.gold))
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
        setBorder(unpack(UI.COLORS.border))
    end)
    button:SetScript("OnEnable", applyEnabledStyle)
    applyEnabledStyle(button)
end

function UI.createLabel(parent, text, x, y)
    local label = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetPoint("TOPLEFT", x, y)
    label:SetText(text)
    return label
end

function UI.createInput(parent, width, x, y)
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
    border:SetColorTexture(unpack(UI.COLORS.border))
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

function UI.applyCheckStyle(check)
    local enabled = check:IsEnabled()
    local hovered = enabled and check:IsMouseOver()
    local borderColor = hovered and {0.34, 0.58, 0.60, 1} or UI.COLORS.border
    local fillColor = enabled and {0.018, 0.024, 0.027, 1}
        or {0.025, 0.030, 0.032, 1}
    local markColor = enabled and UI.COLORS.accent or {0.24, 0.29, 0.30, 1}
    if not enabled then
        borderColor = {0.10, 0.12, 0.13, 1}
    end

    check.Box:SetColorTexture(unpack(fillColor))
    check.Mark:SetColorTexture(unpack(markColor))
    check.Top:SetColorTexture(unpack(borderColor))
    check.Bottom:SetColorTexture(unpack(borderColor))
    check.Left:SetColorTexture(unpack(borderColor))
    check.Right:SetColorTexture(unpack(borderColor))
    check.Label:SetTextColor(unpack(enabled and {1, 1, 1, 1} or UI.COLORS.muted))
    if check.gboChecked then
        check.Mark:Show()
    else
        check.Mark:Hide()
    end
end

function UI.createCheckBox(parent, text, x, y, callback)
    local check = CreateFrame("CheckButton", nil, parent)
    check:SetPoint("TOPLEFT", x, y)
    check:SetSize(20, 20)
    check.Box = check:CreateTexture(nil, "BACKGROUND")
    check.Box:SetAllPoints()
    check.Box:SetColorTexture(0.018, 0.024, 0.027, 1)
    check.Top = check:CreateTexture(nil, "BORDER")
    check.Top:SetPoint("TOPLEFT", 0, 0)
    check.Top:SetPoint("TOPRIGHT", 0, 0)
    check.Top:SetHeight(1)
    check.Bottom = check:CreateTexture(nil, "BORDER")
    check.Bottom:SetPoint("BOTTOMLEFT", 0, 0)
    check.Bottom:SetPoint("BOTTOMRIGHT", 0, 0)
    check.Bottom:SetHeight(1)
    check.Left = check:CreateTexture(nil, "BORDER")
    check.Left:SetPoint("TOPLEFT", 0, 0)
    check.Left:SetPoint("BOTTOMLEFT", 0, 0)
    check.Left:SetWidth(1)
    check.Right = check:CreateTexture(nil, "BORDER")
    check.Right:SetPoint("TOPRIGHT", 0, 0)
    check.Right:SetPoint("BOTTOMRIGHT", 0, 0)
    check.Right:SetWidth(1)
    check.Mark = check:CreateTexture(nil, "ARTWORK")
    check.Mark:SetPoint("TOPLEFT", 4, -4)
    check.Mark:SetPoint("BOTTOMRIGHT", -4, 4)
    check.Mark:SetColorTexture(unpack(UI.COLORS.accent))
    check.Mark:Hide()

    local label = parent:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    label:SetPoint("LEFT", check, "RIGHT", 3, 0)
    label:SetText(text)
    check.Label = label

    local nativeSetChecked = check.SetChecked
    check.gboChecked = false
    check.SetChecked = function(self, checked)
        checked = checked and true or false
        self.gboChecked = checked
        nativeSetChecked(self, checked)
        UI.applyCheckStyle(self)
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
    check:SetScript("OnEnter", function(self)
        UI.applyCheckStyle(self)
        if self.GBOOnEnter then
            self:GBOOnEnter()
        end
    end)
    check:SetScript("OnLeave", function(self)
        UI.applyCheckStyle(self)
        if self.GBOOnLeave then
            self:GBOOnLeave()
        end
    end)
    check:SetScript("OnEnable", UI.applyCheckStyle)
    check:SetScript("OnDisable", UI.applyCheckStyle)
    UI.applyCheckStyle(check)
    return check
end

function UI.createSolidTexture(parent, layer, red, green, blue, alpha)
    local texture = parent:CreateTexture(nil, layer or "BACKGROUND")
    texture:SetColorTexture(red, green, blue, alpha or 1)
    return texture
end

function UI.addPanelBorder(frame)
    local top = UI.createSolidTexture(frame, "BORDER", unpack(UI.COLORS.border))
    top:SetPoint("TOPLEFT", 0, 0)
    top:SetPoint("TOPRIGHT", 0, 0)
    top:SetHeight(1)
    local bottom = UI.createSolidTexture(frame, "BORDER", unpack(UI.COLORS.border))
    bottom:SetPoint("BOTTOMLEFT", 0, 0)
    bottom:SetPoint("BOTTOMRIGHT", 0, 0)
    bottom:SetHeight(1)
    local left = UI.createSolidTexture(frame, "BORDER", unpack(UI.COLORS.border))
    left:SetPoint("TOPLEFT", 0, 0)
    left:SetPoint("BOTTOMLEFT", 0, 0)
    left:SetWidth(1)
    local right = UI.createSolidTexture(frame, "BORDER", unpack(UI.COLORS.border))
    right:SetPoint("TOPRIGHT", 0, 0)
    right:SetPoint("BOTTOMRIGHT", 0, 0)
    right:SetWidth(1)
end

function UI.createPanel(name, width, height, title)
    local frame = CreateFrame("Frame", name, UIParent)
    frame:SetSize(width, height)
    frame:SetFrameStrata("DIALOG")
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    frame:SetClampedToScreen(true)

    local background = UI.createSolidTexture(frame, "BACKGROUND", unpack(UI.COLORS.panel))
    background:SetAllPoints()
    frame.Header = UI.createSolidTexture(frame, "BACKGROUND", unpack(UI.COLORS.header))
    frame.Header:SetPoint("TOPLEFT", 1, -1)
    frame.Header:SetPoint("TOPRIGHT", -1, -1)
    frame.Header:SetHeight(29)
    UI.addPanelBorder(frame)

    frame.TitleText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    frame.TitleText:SetPoint("TOPLEFT", 12, -9)
    frame.TitleText:SetText(title)
    frame.TitleText:SetTextColor(unpack(UI.COLORS.gold))

    frame.Close = UI.createButton(frame, "x", 24, 22, function()
        frame:Hide()
    end)
    frame.Close:SetPoint("TOPRIGHT", -4, -4)
    return frame
end

function UI.countProfileRecoveryEntries()
    local recovery = GBO:GetDepositProfileRecovery()
    if not recovery then
        return 0
    end
    local count = 0
    for _, guildRecovery in pairs(recovery) do
        if type(guildRecovery) == "table" then
            for _ in pairs(guildRecovery) do
                count = count + 1
            end
        else
            count = count + 1
        end
    end
    return count
end

function UI.createProgressBar(parent)
    local bar = CreateFrame("StatusBar", nil, parent)
    bar:SetSize(398, 18)
    bar:SetMinMaxValues(0, 1)
    bar:SetValue(0)
    bar:SetStatusBarTexture(
        "Interface\\AddOns\\GuildBankOrganizer\\Media\\ProgressFill"
    )

    local background = UI.createSolidTexture(bar, "BACKGROUND", 0.015, 0.055, 0.07, 0.95)
    background:SetAllPoints()

    local top = UI.createSolidTexture(bar, "BORDER", 0.64, 0.43, 0.10, 1)
    top:SetPoint("TOPLEFT", -1, 1)
    top:SetPoint("TOPRIGHT", 1, 1)
    top:SetHeight(1)

    local bottom = UI.createSolidTexture(bar, "BORDER", 0.64, 0.43, 0.10, 1)
    bottom:SetPoint("BOTTOMLEFT", -1, -1)
    bottom:SetPoint("BOTTOMRIGHT", 1, -1)
    bottom:SetHeight(1)

    local left = UI.createSolidTexture(bar, "BORDER", 0.64, 0.43, 0.10, 1)
    left:SetPoint("TOPLEFT", -1, 1)
    left:SetPoint("BOTTOMLEFT", -1, -1)
    left:SetWidth(1)

    local right = UI.createSolidTexture(bar, "BORDER", 0.64, 0.43, 0.10, 1)
    right:SetPoint("TOPRIGHT", 1, 1)
    right:SetPoint("BOTTOMRIGHT", 1, -1)
    right:SetWidth(1)

    bar.Text = bar:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    bar.Text:SetPoint("CENTER", 0, 0)
    bar.Text:SetText("Move count and ETA appear when sorting")
    return bar
end

