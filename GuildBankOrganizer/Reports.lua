local _, GBO = ...

local function sortedKeys(value)
    local keys = {}
    for key in pairs(value) do
        table.insert(keys, key)
    end
    table.sort(keys, function(left, right)
        local leftText = type(left) .. ":" .. tostring(left)
        local rightText = type(right) .. ":" .. tostring(right)
        return leftText < rightText
    end)
    return keys
end

local function quoteRecoveryString(value)
    local escaped = string.gsub(value, "\\", "\\\\")
    escaped = string.gsub(escaped, '"', '\\"')
    escaped = string.gsub(escaped, "\n", "\\n")
    escaped = string.gsub(escaped, "\r", "\\r")
    escaped = string.gsub(escaped, "\t", "\\t")
    escaped = string.gsub(escaped, "%c", function(character)
        return string.format("\\%03d", string.byte(character))
    end)
    return '"' .. escaped .. '"'
end

local function formatRecoveryValue(value, depth, visited)
    if type(value) == "string" then
        return quoteRecoveryString(value)
    elseif type(value) ~= "table" then
        return tostring(value)
    elseif visited[value] then
        return "<cycle>"
    elseif depth >= 4 then
        return "<nested table>"
    end

    visited[value] = true
    local fields = {}
    for _, key in ipairs(sortedKeys(value)) do
        table.insert(fields, string.format(
            "[%s]=%s",
            formatRecoveryValue(key, depth + 1, visited),
            formatRecoveryValue(value[key], depth + 1, visited)
        ))
    end
    visited[value] = nil
    return "{" .. table.concat(fields, ",") .. "}"
end

function GBO:AppendProfileRecovery(lines)
    local recovery = GBO:GetDepositProfileRecovery()
    if not recovery then
        return
    end

    table.insert(lines, "profileRecovery:")
    for _, guildKey in ipairs(sortedKeys(recovery)) do
        local guildRecovery = recovery[guildKey]
        if type(guildRecovery) == "table" then
            for _, tab in ipairs(sortedKeys(guildRecovery)) do
                table.insert(lines, string.format(
                    "guild=%s tab=%s value=%s",
                    formatRecoveryValue(guildKey, 0, {}),
                    formatRecoveryValue(tab, 0, {}),
                    formatRecoveryValue(guildRecovery[tab], 0, {})
                ))
            end
        else
            table.insert(lines, string.format(
                "guild=%s value=%s",
                formatRecoveryValue(guildKey, 0, {}),
                formatRecoveryValue(guildRecovery, 0, {})
            ))
        end
    end
end

function GBO:ReportWithCurrentConfiguration(report)
    local lines = {report or ("Guild Bank Organizer " .. tostring(self.version) .. " configuration report"),
        "", "Current configuration (at copy time):"}
    local coverage = self:GetProfessionCoverageSummary()
    lines[#lines + 1] = "catalogBuild=" .. tostring(coverage.sourceBuild)
    lines[#lines + 1] = "profiles=" .. formatRecoveryValue(self:GetDepositProfiles(false) or {}, 0, {})
    self:AppendProfileRecovery(lines)
    return table.concat(lines, "\n")
end

-- Rechecks never retry mutations or rewrite the original operation history.
local verification = { generation = 0, active = false }
function GBO:IsVerificationRunning() return verification.active end

local function finishVerification(ok, reason)
    if not verification.active then return end
    GBO:CancelBankRead(verification)
    verification.active = false
    verification.generation = verification.generation + 1
    local report = string.format("Guild Bank Organizer %s read-only recheck\nresult=%s\nreason=%s\n\nOriginal operation:\n%s",
        tostring(GBO.version), ok and "PASS" or "INCOMPLETE", tostring(reason), verification.originalReport or "none")
    GBO.lastReport = report
    GBO.lastOutcome = {ok = ok, type = "verification", reason = reason}
    GBO:Print("Check Again: " .. tostring(reason))
    GBO:SaveRun({type = "verification", ok = ok, reason = reason, report = report})
    if GBO.RequestUIRefresh then GBO:RequestUIRefresh() end
end

function GBO:AbortVerification()
    finishVerification(false, "read-only check stopped")
end

function GBO:CheckAgain()
    local request = self.verificationRequest
    if not request then self:Print("Run an operation first; no result is available to recheck."); return false end
    if verification.active or self:IsSortRunning() or self:IsDepositRunning()
        or self:IsDepositScanning() or self:IsDiagnosticRunning() or self:IsScanRunning()
    then self:Print("Finish or stop the active operation first."); return false end
    if not self:IsBankOpen() then self:Print("Open the guild bank first."); return false end
    self:CancelDepositPreview()
    verification.active = true
    verification.generation = verification.generation + 1
    verification.originalReport = request.report
    local position = 0
    local function nextTab()
        if not verification.active then return end
        position = position + 1
        local tab = request.tabs[position]
        if not tab then
            local ok, reason = request.check()
            finishVerification(ok, reason)
            return
        end
        local started, reason = GBO:ReadBankTab(verification, tab, function(ok, why)
            if ok then nextTab() else finishVerification(false, why) end
        end)
        if not started then finishVerification(false, reason) end
    end
    nextTab()
    if self.RequestUIRefresh then self:RequestUIRefresh() end
    return true
end

GBO:On("GUILDBANKFRAME_CLOSED", function() GBO:AbortVerification() end)
GBO:On("PLAYER_INTERACTION_MANAGER_FRAME_HIDE", function(_, kind)
    if GBO:IsGuildBankInteraction(kind) then GBO:AbortVerification() end
end)
