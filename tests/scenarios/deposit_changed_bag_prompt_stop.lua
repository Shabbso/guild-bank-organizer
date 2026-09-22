configure(1);bags[0]={[1]=makeItem(72988,20),[2]=makeItem(72988,10)}
addon:ShowOrganizerUI();assert(addon:StartDeposit(1,true))
bags[0][3]=bags[0][2];bags[0][2]=nil;fire("BAG_UPDATE_DELAYED")
advanceTo(.3)
assert(not addon:IsDepositRunning(),"changed source should stop promptly, not wait through the lock timeout")
assert(string.find(GuildBankOrganizerFrame.StatusText:GetText(),"Stopped",1,true))
runTimers()
assert(string.find(GuildBankOrganizerFrame.StatusText:GetText(),"Stopped",1,true),"automatic preview must not hide the stop reason")
assert(addon.db.runs[1].unresolvedItems==10)
