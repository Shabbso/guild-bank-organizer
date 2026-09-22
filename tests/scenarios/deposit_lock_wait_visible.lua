configure(1);bags[0]={[1]=makeItem(72988,20),[2]=makeItem(72988,10)}
addon:ShowOrganizerUI();assert(addon:StartDeposit(1,true))
bags[0][2].locked=true;advanceTo(.3)
assert(addon:IsDepositRunning())
assert(string.find(GuildBankOrganizerFrame.StatusText:GetText(),"Waiting",1,true),"show why no deposits are moving")
bags[0][2].locked=false;fire("ITEM_UNLOCKED");runTimers()
assert(addon.db.runs[1].ok)
