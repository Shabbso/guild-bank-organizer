numGuildBankTabs=2; slots[2]={}
local queryTimes={};local completedAt
QueryGuildBankTab=function(tab)
 queryTimes[tab]=currentTime
 if tab==1 then fire("GUILDBANKBAGSLOTS_CHANGED")
 else C_Timer.After(2.7,function()
  slots[2][1]=makeItem(72988,10)
  fire("GUILDBANKBAGSLOTS_CHANGED")
 end) end
end
assert(addon:StartScan(function() completedAt=currentTime end))
runTimers()
assert(addon.lastScan.tabs[2].occupied==1, "scan must wait for tab 2's own response")
assert(completedAt >= queryTimes[2]+2.7)
