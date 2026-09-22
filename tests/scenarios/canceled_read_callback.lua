local owner={};local called=false
QueryGuildBankTab=function() C_Timer.After(0.5,function() fire("GUILDBANKBAGSLOTS_CHANGED") end) end
assert(addon:ReadBankTab(owner,1,function() called=true end))
addon:CancelBankRead(owner);runTimers()
assert(not called and not addon:IsBankReadPending())
