configure(1);bags[0]={[1]=makeItem(72988,20),[2]=makeItem(72988,10)}
assert(addon:StartDeposit(1,true))
bags[0][3]=makeItem(72988,7)
runTimers()
assert(addon.db.runs[1].ok)
assert(bags[0][3] and bags[0][3].count==7, "new arrivals are not part of the original intent")
