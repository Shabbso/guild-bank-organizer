configure(1)
bags[0]={[1]=makeItem(72988,10)}
local queries=0
QueryGuildBankTab=function() queries=queries+1;fire("GUILDBANKBAGSLOTS_CHANGED") end
local function draft(label, enabled)
 return {label=label,enabled=enabled,categories={cloth=true},allExpansions=true,expansions={},exactItemIDs={}}
end
assert(addon:SaveDepositProfileDraft(1,draft("Label only",true)))
runTimers();assert(queries==0, "label-only saves do not scan")
assert(addon:SaveDepositProfileDraft(1,draft("Label only",false)))
assert(addon:SaveDepositProfileDraft(1,draft("Label only",true)))
advanceTo(currentTime+.31)
assert(addon:IsDepositPreviewPending() and not addon:IsDepositScanning())
assert(addon:SaveDepositProfileDraft(1,draft("Edited while previewing",true)))
runTimers()
assert(queries==2, "rapid changes should collapse to one preview")
