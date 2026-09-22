numGuildBankTabs=8
for tab=1,8 do
 slots[tab]={};configure(tab)
 local p=addon:GetDepositProfile(tab,false);p.categories={};p.exactItemIDs={[1000+tab]=true}
end
addon:GetDepositProfile(3,false).exactItemIDs={[72988]=true}
bags[0]={[1]=makeItem(72988,10)}
local queries={}
QueryGuildBankTab=function(tab) queries[#queries+1]=tab;fire("GUILDBANKBAGSLOTS_CHANGED") end
assert(addon:RefreshDepositPlan());runTimers()
assert(#queries==2 and queries[1]==3 and queries[2]==3,"only the destination with eligible bag items needs a refresh")
local before=#queries;local start=currentTime
assert(addon:StartDeposit(3))
assert(addon:IsDepositRunning() and #queries==before,"unchanged fresh preview should start without a second scan")
assert(bags[0][1]==nil and currentTime==start)
runTimers()
assert(addon.db.runs[1].ok)
