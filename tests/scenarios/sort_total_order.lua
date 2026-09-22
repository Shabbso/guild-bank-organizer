math.randomseed(123)
local items={}
for i=1,35 do
 items[i]={itemID=100+math.random(1,3),link="item:"..i,quality=math.random(1,3),
 classID=math.random(1,4),subclassID=math.random(1,3),equipLoc="INVTYPE_HEAD",
 itemLevel=math.random(1,3),sellPrice=math.random(1,3),name="Item"..math.random(1,3),
 count=math.random(1,20),slot=i}
end
for _,inverted in ipairs({false,true}) do
 addon.db.settings.sortInverted=inverted
 for _,a in ipairs(items) do
  assert(not addon:SortItemLess(a,a))
  for _,b in ipairs(items) do
   if addon:SortItemLess(a,b) then
    assert(not addon:SortItemLess(b,a))
    for _,c in ipairs(items) do
     if addon:SortItemLess(b,c) then assert(addon:SortItemLess(a,c)) end
    end
   end
  end
 end
end
