slots[1]={[1]=makeItem(72988,20)}
local queries=0
QueryGuildBankTab=function()
 queries=queries+1
 if queries<=2 then fire("GUILDBANKBAGSLOTS_CHANGED") end
end
assert(addon:StartSort(1,1.25));runTimers()
assert(not addon.lastOutcome.ok)
local original=addon.lastReport
QueryGuildBankTab=function() fire("GUILDBANKBAGSLOTS_CHANGED") end
PickupGuildBankItem=function() error("recheck must never move items") end
assert(addon:CheckAgain());runTimers()
assert(addon.lastOutcome.ok)
assert(string.find(addon.lastReport, original, 1, true))
assert(addon.db.runs[2].ok==false, "the original failure remains recorded")
