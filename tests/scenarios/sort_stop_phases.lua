local pickup=PickupGuildBankItem;local count=0
PickupGuildBankItem=function(...) count=count+1;return pickup(...) end
for _,delay in ipairs({.05,.25,1.6,2.8}) do
 slots[1]={[3]=makeItem(72988,20)}
 local start=currentTime
 assert(addon:StartSort(1,1.25));advanceTo(start+delay)
 addon:AbortSort("phase cancellation")
 local stopped=count
 runTimers()
 assert(count==stopped and not addon:IsSortRunning())
end
