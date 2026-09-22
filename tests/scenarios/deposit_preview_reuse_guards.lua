configure(1)
local queries=0
QueryGuildBankTab=function() queries=queries+1;fire("GUILDBANKBAGSLOTS_CHANGED") end
for _,invalidator in ipairs({"event","age","contents","close"}) do
 slots[1]={};bags[0]={[1]=makeItem(72988,10)}
 assert(addon:RefreshDepositPlan());runTimers()
 if invalidator=="event" then fire("GUILDBANKBAGSLOTS_CHANGED")
 elseif invalidator=="age" then advanceTo(currentTime+16)
 elseif invalidator=="contents" then slots[1][4]=makeItem(72988,1)
 else fire("GUILDBANKFRAME_CLOSED");addon.bankOpen=true end
 local before=queries
 assert(addon:StartDeposit(1))
 assert(addon:IsDepositScanning() and not addon:IsDepositRunning(),invalidator.." must require a new refresh")
 runTimers()
 assert(queries>=before+2)
end
