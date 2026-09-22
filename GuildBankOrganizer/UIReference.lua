local _, GBO = ...
local UI = GBO.UI
local unpack = unpack or table.unpack

function UI.createReferenceTextList(parent, x, y, width, height)
    local scroll = CreateFrame(
        "ScrollFrame",
        nil,
        parent,
        "UIPanelScrollFrameTemplate"
    )
    scroll:SetPoint("TOPLEFT", x, y)
    scroll:SetSize(width, height)

    local child = CreateFrame("Frame", nil, scroll)
    child:SetSize(width - 20, height)
    child.Text = child:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    child.Text:SetPoint("TOPLEFT", 2, -2)
    child.Text:SetWidth(width - 24)
    child.Text:SetJustifyH("LEFT")
    child.Text:SetText("")
    child.Scroll = scroll
    child.Results = {}
    child.MinimumHeight = height
    scroll:SetScrollChild(child)
    return child
end

function UI.sizeReferenceTextList(list, resetScroll)
    list:SetHeight(math.max(
        list.MinimumHeight,
        math.ceil(list.Text:GetStringHeight() or 0) + 8
    ))
    list.Scroll:UpdateScrollChildRect()
    if resetScroll then
        list.Scroll:SetVerticalScroll(0)
    end
end

function UI.renderCategorySections(frame)
    local sections = GBO:GetCategoryReferenceSections()
    local lines = {}
    for _, section in ipairs(sections) do
        table.insert(lines, section.name)
        table.insert(lines, section.description)
        table.insert(lines, "Examples: " .. table.concat(section.examples, ", "))
        table.insert(lines, "")
    end
    frame.CategoryList.Sections = sections
    frame.CategoryList.Text:SetText(table.concat(lines, "\n"))
    UI.sizeReferenceTextList(frame.CategoryList, false)
end

function UI.formatReferenceLine(result)
    if result.status == "unsupported" then
        return result.statusText
    end
    local line = string.format(
        "[%s] %s (#%d) — %s — %s",
        tostring(result.expansionName or "Unknown expansion"),
        tostring(result.name or "Unknown item"),
        tonumber(result.itemID) or 0,
        tostring(result.categoryName or "Not routed"),
        tostring(result.statusText)
    )
    if result.evidence and result.status ~= "excluded" then
        line = line .. " Evidence: " .. result.evidence
    end
    if result.exactRouteText then
        line = line .. " " .. result.exactRouteText
    end
    return line
end

function UI.renderReferenceRecords(frame, records, groupByExpansion)
    local results = {}
    for index = 1, math.min(#records, 50) do
        table.insert(
            results,
            GBO:FormatCategoryReferenceResult(records[index])
        )
    end
    if groupByExpansion then
        table.sort(results, function(left, right)
            local leftExpansion = left.expansionID or math.huge
            local rightExpansion = right.expansionID or math.huge
            if leftExpansion ~= rightExpansion then
                return leftExpansion < rightExpansion
            elseif left.name ~= right.name then
                return left.name < right.name
            end
            return (left.itemID or 0) < (right.itemID or 0)
        end)
    end

    local lines = {}
    for _, result in ipairs(results) do
        result.line = UI.formatReferenceLine(result)
        table.insert(lines, result.line)
    end
    frame.ResultList.Results = results
    frame.ResultList.Text:SetText(
        #lines > 0
            and table.concat(lines, "\n\n")
            or "No bundled MoP Classic profession item found."
    )
    UI.sizeReferenceTextList(frame.ResultList, true)
end

function UI.searchCategoryReference(frame)
    local query = string.match(frame.SearchInput:GetText() or "", "^%s*(.-)%s*$")
    frame.ResultMode = "search"
    frame.ResultQuery = query
    UI.renderReferenceRecords(
        frame,
        GBO:SearchProfessionReference(query, 50),
        false
    )
end

function UI.showSharedCategoryReference(frame)
    frame.ResultMode = "shared"
    frame.ResultQuery = nil
    UI.renderReferenceRecords(frame, GBO:GetSharedCraftingReagents(), true)
end

function UI.refreshCategoryReferenceResults(frame)
    if frame.ResultMode == "search" then
        frame.SearchInput:SetText(frame.ResultQuery or "")
        UI.renderReferenceRecords(
            frame,
            GBO:SearchProfessionReference(frame.ResultQuery or "", 50),
            false
        )
    elseif frame.ResultMode == "shared" then
        UI.renderReferenceRecords(frame, GBO:GetSharedCraftingReagents(), true)
    else
        frame.ResultList.Results = {}
        frame.ResultList.Text:SetText(
            "Search by item name or exact item ID, or open the complete Shared list."
        )
        UI.sizeReferenceTextList(frame.ResultList, true)
    end
end

function UI.createCategoryReferenceFrame()
    local frame = UI.createPanel(
        "GuildBankOrganizerCategoryReferenceFrame",
        470,
        650,
        "Guild Bank Organizer  /  Category Reference"
    )
    UI.anchorBesideGuildBank(frame)
    frame.Close:Hide()

    frame.BackButton = UI.createButton(frame, "< Back to Settings", 128, 22, function()
        frame:Hide()
        GBO:ShowAdvancedUI()
    end)
    frame.BackButton:SetPoint("TOPRIGHT", -4, -4)

    frame.SearchInput = UI.createInput(frame, 266, 16, -42)
    frame.SearchInput:SetJustifyH("LEFT")
    frame.SearchButton = UI.createButton(frame, "Search", 72, 24, function()
        UI.searchCategoryReference(frame)
    end)
    frame.SearchButton:SetPoint("TOPLEFT", 290, -42)
    frame.SharedButton = UI.createButton(frame, "Shared List", 88, 24, function()
        UI.showSharedCategoryReference(frame)
    end)
    frame.SharedButton:SetPoint("TOPLEFT", 366, -42)
    frame.SearchInput:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
        UI.searchCategoryReference(frame)
    end)

    local hint = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    hint:SetPoint("TOPLEFT", 16, -72)
    hint:SetPoint("TOPRIGHT", -16, -72)
    hint:SetJustifyH("LEFT")
    hint:SetText(
        "Search bundled names or an exact item ID. Exact custom routes are annotated without changing the built-in category."
    )

    UI.createLabel(frame, "Category definitions", 16, -106)
    UI.createLabel(frame, "Bundled lookup", 232, -106)
    frame.CategoryList = UI.createReferenceTextList(frame, 16, -124, 202, 506)
    frame.ResultList = UI.createReferenceTextList(frame, 232, -124, 222, 506)

    frame:SetScript("OnShow", function()
        UI.renderCategorySections(frame)
        UI.refreshCategoryReferenceResults(frame)
        UI.scheduleRefresh()
    end)
    frame:SetScript("OnHide", function()
        if not UI.organizerFrame or not UI.organizerFrame:IsShown() then
            if not UI.advancedFrame or not UI.advancedFrame:IsShown() then
                if not UI.depositSettingsFrame or not UI.depositSettingsFrame:IsShown() then
                    UI.refreshGeneration = UI.refreshGeneration + 1
                end
            end
        end
    end)
    frame:Hide()
    return frame
end

UI.loadDepositSettings = function(tab)
    if not UI.depositSettingsFrame then
        return
    end
    UI.depositSettingsFrame.ScanGeneration =
        (UI.depositSettingsFrame.ScanGeneration or 0) + 1
    tab = tonumber(tab) or UI.currentTab()
    if not tab or tab < 1 or tab > GetNumGuildBankTabs() then
        UI.setDepositSaveState("error",
            "Enter a purchased guild-bank tab number."
        )
        return
    end

    local name = GetGuildBankTabInfo(tab)
    local profile = GBO:GetDepositProfile(tab, false)
    UI.depositSettingsFrame.LoadingProfile = true
    UI.depositSettingsFrame.LastBankTab = UI.currentTab()
    UI.depositSettingsFrame.SelectedTab = tab
    UI.depositSettingsFrame.TabInput:SetText(tostring(tab))
    UI.depositSettingsFrame.TabTitle:SetText(string.format(
        "Tab %d%s",
        tab,
        name and (" — " .. name) or ""
    ))
    UI.depositSettingsFrame.LabelInput:SetText(profile and profile.label or "")
    UI.depositSettingsFrame.EnabledCheck:SetChecked(
        profile and profile.enabled or profile == nil
    )
    for key, check in pairs(UI.depositSettingsFrame.CategoryChecks) do
        check:SetChecked(
            profile and profile.categories and profile.categories[key] or false
        )
    end
    UI.depositSettingsFrame.AllExpansionsCheck:SetChecked(
        not profile or profile.allExpansions ~= false
    )
    for expansionID, check in pairs(UI.depositSettingsFrame.ExpansionChecks) do
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
    UI.depositSettingsFrame.ExactItemsInput:SetText(table.concat(exactText, ", "))
    if profile then
        UI.setDepositSaveState(
            "saved",
            "All changes saved. Hover a category to see its rule."
        )
    else
        UI.setDepositSaveState(
            "new",
            "Choose a category or exact item ID to create this profile."
        )
    end
    UI.depositSettingsFrame.LoadingProfile = false
end

UI.setDepositSaveState = function(state, message)
    local frame = UI.depositSettingsFrame
    if not frame then
        return
    end
    frame.SaveState = state
    frame.StatusText:SetText(tostring(message or ""))
    if state == "saved" then
        frame.StatusText:SetTextColor(unpack(UI.COLORS.accent))
    elseif state == "error" then
        frame.StatusText:SetTextColor(1, 0.35, 0.30)
    elseif state == "saving" then
        frame.StatusText:SetTextColor(unpack(UI.COLORS.gold))
    else
        frame.StatusText:SetTextColor(1, 1, 1)
    end
end

