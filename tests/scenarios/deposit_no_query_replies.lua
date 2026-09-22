configure(1);bags[0]={[1]=makeItem(72988,10)}
local queries=0
QueryGuildBankTab=function(tab) queries=queries+1 end
assert(addon:StartDeposit())
runTimers()
assert(not addon.db.runs[1] or not addon.db.runs[1].ok)
assert(bags[0][1], "missing preflight reply must not begin depositing")
