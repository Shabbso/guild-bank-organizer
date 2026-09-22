numGuildBankTabs=8
for i=1,8 do slots[i]={};configure(i) end
-- Use different exact IDs so all eight profiles are valid without category conflicts.
for i=1,8 do local p=addon:GetDepositProfile(i,false);p.categories={};p.exactItemIDs={[1000+i]=true} end
local profile=addon:GetDepositProfile(1,false)
assert(addon:SaveDepositProfileDraft(1,profile))
local ok,reason=addon:SaveDepositProfileDraft(1,profile)
assert(ok, "unchanged saves must not lock editing")
runTimers()
assert(currentTime==0, "unchanged save should not query tabs")
