configure(1);bags[0]={[1]=makeItem(72988,20),[2]=makeItem(72988,10)}
assert(addon:StartDeposit(1,true));bags[0][2].locked=true
C_Timer.After(1.0,function() bags[0][2].locked=false;fire("ITEM_UNLOCKED") end)
runTimers()
assert(addon.db.runs[1].ok and addon.db.runs[1].unresolvedItems==0)
