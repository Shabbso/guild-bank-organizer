local pickup=PickupGuildBankItem
local moves=0
PickupGuildBankItem=function(...) moves=moves+1;return pickup(...) end
-- Stop in preflight, active movement, between moves and final verification.
for _,delay in ipairs({0.05,0.25,0.31,0.55,0.80}) do
 configure(1);slots[1]={};bags[0]={[1]=makeItem(72988,20),[2]=makeItem(72988,10)}
 local start=currentTime
 assert(addon:StartDeposit(1))
 advanceTo(start+delay)
 addon:AbortDeposit("phase cancellation")
 local afterStop=moves
 runTimers()
 assert(moves==afterStop, "Stop issued another deposit at delay "..delay)
 assert(not addon:IsDepositRunning() and not addon:IsDepositScanning())
end
