local function item(id,name,slot)
 return {itemID=id,name=name,slot=slot,count=1,quality=2,classID=4,subclassID=1,equipLoc="INVTYPE_HEAD",itemLevel=10,sellPrice=10,link=name,maxStack=1}
end
local a=item(100,"Zulu of the Bear",1)
local b=item(100,"Alpha of the Eagle",3)
local c=item(200,"Middle Helmet",2)
assert(not (addon:SortItemLess(a,b) and addon:SortItemLess(b,c) and addon:SortItemLess(c,a)), "comparator must be transitive")
