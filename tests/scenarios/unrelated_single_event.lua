QueryGuildBankTab=function() end
local calls=0;local result
assert(addon:ReadBankTab({},1,function(ok) calls=calls+1;result=ok end))
C_Timer.After(0.2,function() fire("GUILDBANKBAGSLOTS_CHANGED") end)
runTimers()
assert(calls==1 and result==false, "a single unrelated event cannot complete two refreshes")
