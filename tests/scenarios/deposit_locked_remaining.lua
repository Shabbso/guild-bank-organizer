configure(1); bags[0]={[1]=makeItem(72988,20),[2]=makeItem(72988,10)}
assert(addon:StartDeposit(1,true))
bags[0][2].locked=true
runTimers()
assert(not addon.db.runs[1].ok, "locked outstanding items require partial completion")
assert(addon.db.runs[1].unresolvedItems==10)
