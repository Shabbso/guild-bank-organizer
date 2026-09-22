configure(1)
bags[0]={[1]=makeItem(72988,10)}
dropNextGuildBankDeposit=true
assert(addon:StartDeposit(1,true))
advanceTo(0.1)
addon:AbortDeposit("stopped by user")
local stopTime=currentTime
runTimers()
assert(bags[0][1] and bags[0][1].count==10, "Stop must prevent a fresh retry")
assert(addon.db.runs[1].retries==0)
