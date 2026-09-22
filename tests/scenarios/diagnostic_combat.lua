slots[1]={[1]=makeItem(72988,10)}
inCombat=true
assert(not addon:StartDiagnostic(1,1,2,1.25,2), "combat must block diagnostics")
assert(slots[1][1] and not slots[1][2])
