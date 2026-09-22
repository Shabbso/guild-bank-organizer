local _, GBO = ...
local UI = GBO.UI

function GBO:ShowOrganizerUI()
    UI.organizerFrame = UI.organizerFrame or UI.createOrganizerFrame()
    if UI.advancedFrame then
        UI.advancedFrame:Hide()
    end
    if UI.depositSettingsFrame then
        UI.depositSettingsFrame:Hide()
    end
    if UI.categoryReferenceFrame then
        UI.categoryReferenceFrame:Hide()
    end
    UI.organizerFrame:Show()
    self:RefreshOrganizerUI()
end

function GBO:ShowAdvancedUI()
    UI.advancedFrame = UI.advancedFrame or UI.createAdvancedFrame()
    if UI.organizerFrame then
        UI.organizerFrame:Hide()
    end
    if UI.depositSettingsFrame then
        UI.depositSettingsFrame:Hide()
    end
    if UI.categoryReferenceFrame then
        UI.categoryReferenceFrame:Hide()
    end
    UI.advancedFrame:Show()
    self:RefreshOrganizerUI()
end

function GBO:ShowDepositSettingsUI(tab)
    if not self:IsBankOpen() then
        self:Print("Open the guild bank before configuring Smart Deposits.")
        return
    end
    if UI.isBusy() then
        self:Print(
            "Finish or stop the current guild-bank operation before editing Smart Deposit profiles."
        )
        return
    end
    UI.depositSettingsFrame =
        UI.depositSettingsFrame or UI.createDepositSettingsFrame()
    if UI.organizerFrame then
        UI.organizerFrame:Hide()
    end
    if UI.advancedFrame then
        UI.advancedFrame:Hide()
    end
    if UI.categoryReferenceFrame then
        UI.categoryReferenceFrame:Hide()
    end
    UI.depositSettingsFrame:Show()
    UI.loadDepositSettings(tonumber(tab) or UI.currentTab())
    self:RefreshOrganizerUI()
end

function GBO:ShowCategoryReferenceUI()
    UI.categoryReferenceFrame =
        UI.categoryReferenceFrame or UI.createCategoryReferenceFrame()
    if UI.organizerFrame then
        UI.organizerFrame:Hide()
    end
    if UI.advancedFrame then
        UI.advancedFrame:Hide()
    end
    if UI.depositSettingsFrame then
        UI.depositSettingsFrame:Hide()
    end
    UI.categoryReferenceFrame:Show()
    self:RefreshOrganizerUI()
end

function GBO:ShowTestUI()
    self:ShowAdvancedUI()
end

function GBO:HideOrganizerUI()
    if UI.organizerFrame then
        UI.organizerFrame:Hide()
    end
    if UI.advancedFrame then
        UI.advancedFrame:Hide()
    end
    if UI.depositSettingsFrame then
        UI.depositSettingsFrame:Hide()
    end
    if UI.categoryReferenceFrame then
        UI.categoryReferenceFrame:Hide()
    end
end

GBO:On("GUILDBANKBAGSLOTS_CHANGED", function() GBO:RequestUIRefresh() end)
GBO:On("GUILDBANK_UPDATE_TABS", function() GBO:RequestUIRefresh() end)
GBO:On("BAG_UPDATE_DELAYED", function() GBO:RequestUIRefresh() end)
GBO:On("PLAYER_REGEN_ENABLED", function() GBO:RequestUIRefresh() end)
GBO:On("PLAYER_REGEN_DISABLED", function() GBO:RequestUIRefresh() end)

function UI.showForGuildBank()
    if GBO.db and GBO.db.settings and GBO.db.settings.autoOpen ~= false then
        GBO:ShowOrganizerUI()
    end
end

function UI.hideForGuildBank()
    GBO:HideOrganizerUI()
end

GBO:On("GUILDBANKFRAME_OPENED", UI.showForGuildBank)
GBO:On("GUILDBANKFRAME_CLOSED", UI.hideForGuildBank)

GBO:On("PLAYER_INTERACTION_MANAGER_FRAME_SHOW", function(_, interactionType)
    if GBO:IsGuildBankInteraction(interactionType) then
        UI.showForGuildBank()
    end
end)

GBO:On("PLAYER_INTERACTION_MANAGER_FRAME_HIDE", function(_, interactionType)
    if GBO:IsGuildBankInteraction(interactionType) then
        UI.hideForGuildBank()
    end
end)
