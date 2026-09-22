configure(1);bags[0]={[1]=makeItem(72988,20),[2]=makeItem(72988,10)}
local pickup=PickupGuildBankItem;local moves=0
PickupGuildBankItem=function(...) moves=moves+1;return pickup(...) end
assert(addon:StartDeposit(1,true))
local count=moves
GetGuildBankTabInfo=function() return "Test",1,true,false,-1,-1,false end
runTimers()
assert(not addon.db.runs[1].ok)
assert(bags[0][2].count==10 and moves==count)
