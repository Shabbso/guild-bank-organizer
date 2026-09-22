addon:ShowOrganizerUI();runTimers()
assert(#timers==0, "visible idle UI has no repeating timer")
local refresh=addon.RefreshOrganizerUI;local count=0
addon.RefreshOrganizerUI=function(self) count=count+1;return refresh(self) end
for _=1,10 do fire("GUILDBANKBAGSLOTS_CHANGED") end
runTimers();assert(count==1, "event burst should coalesce")
addon.lastReport=nil;addon.db.runs={}
addon:ShowReport()
assert(GuildBankOrganizerReportFrame:IsShown())
assert(string.find(GuildBankOrganizerReportFrame.EditBox:GetText(),"Current configuration",1,true))
