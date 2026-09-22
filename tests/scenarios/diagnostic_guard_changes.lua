slots[1]={[1]=makeItem(72988,20)}
local moved=0;local pickup=PickupGuildBankItem
PickupGuildBankItem=function(...) moved=moved+1;return pickup(...) end
assert(addon:StartDiagnostic(1,1,2,1.5,2))
for _=1,30 do
 if slots[1][2] then break end
 runNextTimer()
end
assert(slots[1][2])
local before=moved
InCombatLockdown=function() return true end
runTimers()
assert(not addon.lastOutcome.ok and moved==before)
assert(slots[1][2], "unsafe correction must leave restoration unresolved")
InCombatLockdown=function() return false end
assert(addon:CheckAgain());runTimers()
assert(not addon.lastOutcome.ok and moved==before, "recheck does not restore")
