slots[1]={[1]=makeItem(72988,20)}
local queries=0;local replies=0
QueryGuildBankTab=function(tab)
 queries=queries+1
 if queries<=2 then replies=replies+1;fire("GUILDBANKBAGSLOTS_CHANGED") end
end
assert(addon:StartSort(1,1.25))
runTimers()
assert(not addon.db.runs[1].ok, "missing final reply cannot mean verified success")

assert(queries>2, "preflight must complete before final response is suppressed")
