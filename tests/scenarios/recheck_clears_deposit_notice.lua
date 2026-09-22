configure(1);bags[0]={[1]=makeItem(72988,20),[2]=makeItem(72988,10)}
addon:ShowOrganizerUI();assert(addon:StartDeposit(1,true));addon:AbortDeposit("test stop")
runTimers();assert(addon:GetDepositNotice())
assert(addon:CheckAgain());runTimers()
assert(not addon:GetDepositNotice(),"recheck result must replace the prior on-screen deposit notice")
assert(string.find(GuildBankOrganizerFrame.StatusText:GetText(),"unresolved",1,true))
