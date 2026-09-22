numGuildBankTabs=2;slots[2]={}
for tab=1,2 do configure(tab);addon:GetDepositProfile(tab,false).categories={} end
addon:GetDepositProfile(1,false).exactItemIDs={[72988]=true}
addon:GetDepositProfile(2,false).exactItemIDs={[500]=true}
bags[0]={[1]=makeItem(72988,10),[2]=makeItem(500,5)}
local queries={}
QueryGuildBankTab=function(tab) queries[#queries+1]=tab;fire("GUILDBANKBAGSLOTS_CHANGED") end
assert(addon:StartDeposit(1))
while not addon:IsDepositRunning() do runNextTimer() end
for _,tab in ipairs(queries) do assert(tab==1,"This Tab must not wait for another destination") end
runTimers()
assert(bags[0][2] and bags[0][2].count==5)
