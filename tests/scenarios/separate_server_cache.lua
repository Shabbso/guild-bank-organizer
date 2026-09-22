-- The mutation appears in the cache, but the server rejects it.
-- Only the later query response replaces the cached state.
configure(1);bags[0]={[1]=makeItem(72988,10)}
local serverSlots={};local serverBag=makeItem(72988,10)
QueryGuildBankTab=function()
 C_Timer.After(0.8,function()
  slots[1]=serverSlots;bags[0][1]=serverBag
  fire("GUILDBANKBAGSLOTS_CHANGED")
 end)
end
assert(addon:StartDeposit(1,true));runTimers()
assert(not addon.db.runs[1].ok, "server rollback must not pass final verification")
assert(string.find(addon.db.runs[1].reason,"verification incomplete",1,true))
assert(bags[0][1].count==10 and not slots[1][1])
