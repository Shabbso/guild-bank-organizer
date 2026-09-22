numGuildBankTabs=2;slots[2]={};slots[1]={[1]=makeItem(72988,20)}
assert(addon:StartDiagnostic(1,1,2,1.5,2))
for _=1,30 do
 if slots[1][2] then break end
 runNextTimer()
end
assert(slots[1][2]);currentGuildBankTab=2
PickupGuildBankItem=function() error("no move permitted after tab changed") end
runTimers()
assert(not addon.lastOutcome.ok and slots[1][2])
