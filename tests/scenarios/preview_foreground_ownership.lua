configure(1);bags[0]={[1]=makeItem(72988,10)}
QueryGuildBankTab=function() C_Timer.After(.2,function() fire("GUILDBANKBAGSLOTS_CHANGED") end) end
assert(addon:RefreshDepositPlan(nil,true))
assert(addon:IsDepositPreviewPending() and not addon:IsDepositScanning())
assert(addon:StartSort(1,1.25));runTimers()
assert(addon.lastOutcome.ok, "passive preview cannot block foreground sorting")
