
fire("ADDON_LOADED", addonName)
fire("PLAYER_LOGIN")
addon.db.settings.autoOpen = false
addon.bankOpen = true
slots = { [1] = {} }
local function configure(tab)
 addon:GetDepositProfiles(true)[tab] = {
  enabled=true, label="Audit", categories={cloth=true},
  allExpansions=true, expansions={}, exactItemIDs={}, enabledStateVersion=1,
 }
end
local function advanceTo(target)
 local guard=0
 while #timers > 0 do
  table.sort(timers,function(a,b) return a.at < b.at end)
  if timers[1].at > target then break end
  runNextTimer(); guard=guard+1; assert(guard<10000)
 end
 currentTime=target
end
