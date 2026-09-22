configure(1);bags[0]={[1]=makeItem(72988,10)}
assert(addon:RefreshDepositPlan());runTimers()
QueryGuildBankTab=function() end
assert(addon:ReadBankTab({},1,function() end))
assert(addon:StartDeposit(1))
assert(not addon:IsDepositRunning() and bags[0][1].count==10,
 "a fast start must not mutate while another read owns the bank")
runTimers()
