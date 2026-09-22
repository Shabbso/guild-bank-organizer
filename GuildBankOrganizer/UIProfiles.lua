local _, GBO = ...
local UI = GBO.UI

function UI.parseExactItemIDs(text)
    text = tostring(text or "")
    if string.match(text, "^%s*$") then
        return {}
    end

    local trimmed = string.match(text, "^%s*(.-)%s*$")
    if string.match(trimmed, "^,")
        or string.match(trimmed, ",$")
        or string.find(trimmed, ",%s*,")
    then
        return nil, string.format(
            "Invalid exact item ID list \"%s\". Use positive whole-number IDs separated by commas or spaces.",
            trimmed
        )
    end

    local exactItemIDs = {}
    local foundToken = false
    for token in string.gmatch(text, "[^,%s]+") do
        foundToken = true
        local itemID = string.match(token, "^%d+$") and tonumber(token) or nil
        if not itemID or itemID <= 0 then
            return nil, string.format(
                "Invalid exact item ID \"%s\". Use positive whole-number IDs separated by commas or spaces.",
                token
            )
        end
        exactItemIDs[itemID] = true
    end
    if not foundToken then
        return nil,
            "Invalid exact item ID list. Use positive whole-number IDs separated by commas or spaces."
    end
    return exactItemIDs
end

function UI.readDepositSettingsDraft()
    local frame = UI.depositSettingsFrame
    local categories = {}
    for key, check in pairs(frame.CategoryChecks) do
        if check:GetChecked() then
            categories[key] = true
        end
    end
    local expansions = {}
    for expansionID, check in pairs(frame.ExpansionChecks) do
        if check:GetChecked() then
            expansions[expansionID] = true
        end
    end
    local exactItemIDs, exactItemReason = UI.parseExactItemIDs(
        frame.ExactItemsInput:GetText()
    )
    if not exactItemIDs then
        return frame.SelectedTab, nil, exactItemReason
    end

    return frame.SelectedTab, {
        enabled = frame.EnabledCheck:GetChecked(),
        label = frame.LabelInput:GetText(),
        categories = categories,
        allExpansions = frame.AllExpansionsCheck:GetChecked(),
        expansions = expansions,
        exactItemIDs = exactItemIDs,
    }
end

UI.flushDepositSettingsDraft = function(action)
    local frame = UI.depositSettingsFrame
    if not frame then
        return false
    end
    if frame.LoadingProfile or frame.Flushing then
        return true
    end
    if UI.isBusy() then
        UI.setDepositSaveState(
            "error",
            "Finish or stop the active Smart Deposit before changing profiles."
        )
        return false
    end

    local tab, draft, draftReason = UI.readDepositSettingsDraft()
    if not tab then
        UI.setDepositSaveState("error", "Choose a destination tab before saving.")
        return false
    end
    if not draft then
        UI.setDepositSaveState("error", tostring(draftReason))
        return false
    end

    frame.Flushing = true
    UI.setDepositSaveState("saving", "Saving...")
    local ok, reason = GBO:SaveDepositProfileDraft(tab, draft)
    if not ok then
        frame.Flushing = false
        UI.setDepositSaveState("error", tostring(reason))
        return false
    end

    UI.setDepositSaveState("saved", "Saved.")
    GBO:RefreshOrganizerUI()
    frame.Flushing = false
    return true
end

function UI.createDepositSettingsFrame()
    local frame = UI.createPanel(
        "GuildBankOrganizerDepositSettingsFrame",
        470,
        670,
        "Guild Bank Organizer  /  Smart Deposit"
    )
    UI.anchorBesideGuildBank(frame)
    frame.Close:Hide()

    local function returnToOrganizer(action)
        if not UI.flushDepositSettingsDraft(action) then
            return
        end
        frame.Navigating = true
        frame:Hide()
        if GBO:IsBankOpen() then
            GBO:ShowOrganizerUI()
        end
        frame.Navigating = false
    end

    local function commitInput(input, action, clearFocus)
        if input.GBOCommitInProgress then
            return
        end
        input.GBOCommitInProgress = true
        UI.flushDepositSettingsDraft(action)
        if clearFocus then
            input:ClearFocus()
        end
        input.GBOCommitInProgress = false
    end

    frame.HeaderBackButton = UI.createButton(frame, "< Back to Organizer", 134, 22, function()
        returnToOrganizer("back")
    end)
    frame.HeaderBackButton:SetPoint("TOPRIGHT", -4, -4)

    local intro = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    intro:SetPoint("TOPLEFT", 18, -34)
    intro:SetPoint("TOPRIGHT", -18, -34)
    intro:SetJustifyH("LEFT")
    intro:SetText(
        "1. Pick a destination tab.  2. Choose what belongs there.  3. Save and scan."
    )

    UI.createLabel(frame, "1  Destination tab", 20, -60)
    frame.TabInput = UI.createInput(frame, 54, 20, -80)
    frame.UseCurrentButton = UI.createButton(frame, "Use Current", 100, 24, function()
        if UI.flushDepositSettingsDraft("use-current") then
            UI.loadDepositSettings(UI.currentTab())
        end
    end)
    frame.UseCurrentButton:SetPoint("TOPLEFT", 84, -80)
    frame.LoadButton = UI.createButton(frame, "Load Tab", 90, 24, function()
        if UI.flushDepositSettingsDraft("load-tab") then
            UI.loadDepositSettings(frame.TabInput:GetText())
        end
    end)
    frame.LoadButton:SetPoint("TOPLEFT", 194, -80)

    frame.TabTitle = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    frame.TabTitle:SetPoint("TOPLEFT", 294, -86)
    frame.TabTitle:SetPoint("TOPRIGHT", -18, -86)
    frame.TabTitle:SetJustifyH("RIGHT")

    UI.createLabel(frame, "Name", 20, -118)
    frame.LabelInput = UI.createInput(frame, 210, 112, -112)
    frame.LabelInput:SetJustifyH("LEFT")
    frame.LabelInput:SetScript("OnEnterPressed", function(self)
        commitInput(self, "label-enter", true)
    end)
    frame.LabelInput:SetScript("OnEditFocusLost", function(self)
        commitInput(self, "label-focus")
    end)
    frame.EnabledCheck = UI.createCheckBox(
        frame,
        "Enable this tab profile",
        330,
        -112,
        function()
            UI.flushDepositSettingsDraft("checkbox")
        end
    )

    UI.createLabel(frame, "2  Items that belong in this tab", 20, -150)
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
        local check = UI.createCheckBox(
            frame,
            category.name,
            columnX[column],
            categoryTop - (row * categoryRowSpacing),
            function(self)
                if self:GetChecked() then
                    frame.EnabledCheck:SetChecked(true)
                end
                UI.flushDepositSettingsDraft("checkbox")
            end
        )
        check.Label:SetWidth(190)
        check.Label:SetJustifyH("LEFT")
        check.GBOOnEnter = function(self)
            if GameTooltip then
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetText(category.name)
                GameTooltip:AddLine(category.description, 1, 1, 1, true)
                GameTooltip:AddLine("Rule: " .. category.evidence, 0.35, 0.85, 0.90, true)
                GameTooltip:Show()
            end
        end
        check.GBOOnLeave = function()
            if GameTooltip then
                GameTooltip:Hide()
            end
        end
        frame.CategoryChecks[category.key] = check
    end

    local expansionY = categoryTop - (rowCount * categoryRowSpacing) - 8
    UI.createLabel(frame, "Expansion", 20, expansionY)
    frame.AllExpansionsCheck = UI.createCheckBox(
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
            UI.flushDepositSettingsDraft("checkbox")
        end
    )
    frame.ExpansionChecks = {}
    local expansionX = {132, 194, 256, 318, 380}
    for index, expansion in ipairs(GBO:GetDepositExpansionCatalog()) do
        local check = UI.createCheckBox(
            frame,
            expansion.shortName,
            expansionX[index],
            expansionY + 3,
            function(self)
                if self:GetChecked() then
                    frame.AllExpansionsCheck:SetChecked(false)
                end
                UI.flushDepositSettingsDraft("checkbox")
            end
        )
        check.Label:SetFontObject(GameFontHighlightSmall)
        check.Label:SetJustifyH("LEFT")
        check.Label:SetWidth(37)
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
    UI.createLabel(frame, "Exact item IDs (optional)", 20, exactItemsY)
    frame.ExactItemsInput = UI.createInput(frame, 250, 170, exactItemsY + 6)
    frame.ExactItemsInput:SetJustifyH("LEFT")
    frame.ExactItemsInput:SetScript("OnTextChanged", function(self)
        if not frame.LoadingProfile
            and string.find(self:GetText() or "", "%d")
        then
            frame.EnabledCheck:SetChecked(true)
        end
    end)
    frame.ExactItemsInput:SetScript("OnEnterPressed", function(self)
        commitInput(self, "exact-items-enter", true)
    end)
    frame.ExactItemsInput:SetScript("OnEditFocusLost", function(self)
        commitInput(self, "exact-items-focus")
    end)
    local exactHelp = frame:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    exactHelp:SetPoint("TOPLEFT", 20, exactItemsY - 26)
    exactHelp:SetPoint("TOPRIGHT", -20, exactItemsY - 26)
    exactHelp:SetJustifyH("LEFT")
    exactHelp:SetText(
        "Comma- or space-separated positive whole-number IDs override categories."
    )

    frame.SaveButton = UI.createButton(frame, "Save Now", 145, 28, function()
        UI.flushDepositSettingsDraft("button")
    end)
    frame.SaveButton:SetPoint("BOTTOMLEFT", 20, 58)
    frame.ScanButton = UI.createButton(frame, "Scan Bags Now", 125, 28, function()
        if not UI.flushDepositSettingsDraft("scan") then
            return
        end
        frame.ScanGeneration = (frame.ScanGeneration or 0) + 1
        local generation = frame.ScanGeneration
        local tab = frame.SelectedTab

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
    frame.CloseButton = UI.createButton(frame, "< Back to Organizer", 140, 28, function()
        returnToOrganizer("back")
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
        UI.loadDepositSettings(UI.currentTab() or 1)
        UI.scheduleRefresh()
    end)
    frame:SetScript("OnHide", function()
        if not frame.Navigating and frame.SelectedTab then
            UI.flushDepositSettingsDraft("hide")
        end
        if not UI.organizerFrame or not UI.organizerFrame:IsShown() then
            if not UI.advancedFrame or not UI.advancedFrame:IsShown() then
                if not UI.categoryReferenceFrame
                    or not UI.categoryReferenceFrame:IsShown()
                then
                UI.refreshGeneration = UI.refreshGeneration + 1
                end
            end
        end
    end)
    frame:Hide()
    return frame
end

