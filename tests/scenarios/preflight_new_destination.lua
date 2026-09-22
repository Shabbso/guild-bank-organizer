numGuildBankTabs=2;slots[2]={}
for tab=1,2 do configure(tab);addon:GetDepositProfile(tab,false).categories={} end
addon:GetDepositProfile(1,false).exactItemIDs={[72988]=true}
addon:GetDepositProfile(2,false).exactItemIDs={[500]=true}
bags[0]={[1]=makeItem(72988,10)}
local queries={}
QueryGuildBankTab=function(tab)
 queries[#queries+1]=tab
 C_Timer.After(.4,function() fire("GUILDBANKBAGSLOTS_CHANGED") end)
end
assert(addon:StartDeposit())
bags[0][2]=makeItem(500,5);fire("BAG_UPDATE_DELAYED")
while not addon:IsDepositRunning() do runNextTimer() end
assert(#queries==4 and queries[3]==2 and queries[4]==2,
 "new destination introduced during preflight must be verified before starting")
runTimers();assert(addon.db.runs[1].ok)
