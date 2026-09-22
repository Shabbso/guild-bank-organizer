configure(1);bags[0]={[1]=makeItem(72988,10)}
QueryGuildBankTab=function() C_Timer.After(.4,function() fire("GUILDBANKBAGSLOTS_CHANGED") end) end
addon:QueueDepositPreview();addon:ShowOrganizerUI()
local frame=GuildBankOrganizerFrame
assert(string.find(frame.StatusText:GetText(),"Scanning bags",1,true),"opening preview must be visible immediately")
assert(not string.find(frame.SmartHint:GetText(),"No matching",1,true))
assert(not frame.DepositCurrentButton:IsEnabled())
assert(frame.SetupButton:IsEnabled(),"preview must remain editable")
advanceTo(.35)
assert(string.find(frame.ProgressBar.Text:GetText(),"1 of 1",1,true),"show destination scan progress")
runTimers()
assert(frame.DepositCurrentButton:IsEnabled())
