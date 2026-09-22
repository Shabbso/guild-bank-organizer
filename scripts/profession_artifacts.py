"""Split generated routing from a compact, lazily decoded reference catalog."""
import re
import json


def split_catalog(combined):
    start = combined.index('local professionReference = {')
    end = combined.index('local sharedCraftingReagents = {', start)
    records = []
    pattern = (r'\[(\d+)\] = \{\s*itemID = \d+,\s*name = ("(?:\\.|[^"\\])*"),'
               r'\s*categoryKey = (nil|"(?:\\.|[^"\\])*"),'
               r'\s*evidence = ("(?:\\.|[^"\\])*"),\s*status = ("(?:\\.|[^"\\])*"),\s*\},')
    for row in re.findall(pattern, combined[start:end]):
        item_id, name, category, evidence, status = row
        fields = [item_id, json.loads(name), '' if category == 'nil' else json.loads(category),
                  json.loads(evidence), json.loads(status)]
        records.append('\t'.join(str(f).replace('%', '%25').replace('\t', '%09')
                                 .replace('\n', '%0A').replace('\r', '%0D') for f in fields))
    assert records, 'No reference records parsed'
    assert len(records) == len(re.findall(r'itemID = \d+,', combined[start:end]))
    packed = '\n'.join(records)
    assert ']==]' not in packed
    reference = '''local _, GBO = ...
-- Generated reference payload: records are decoded only on first reference use.
-- Compact text is retained at login; no per-item record tables are allocated.
local packed = [==[
''' + packed + '''
]==]
local records
local function decode(value)
    return (string.gsub(value, "%%(%x%x)", function(hex)
        return string.char(tonumber(hex, 16))
    end))
end
function GBO:LoadProfessionReference()
    if records then return records end
    records = {}
    for id, name, category, evidence, status in string.gmatch(packed,
        "(%d+)\\t([^\\t]*)\\t([^\\t]*)\\t([^\\t]*)\\t([^\\n]*)") do
        local itemID = tonumber(id)
        records[itemID] = {itemID = itemID, name = decode(name),
            categoryKey = category ~= "" and decode(category) or nil,
            evidence = decode(evidence), status = decode(status)}
    end
    packed = nil
    self.professionReferenceLoaded = true
    return records
end
'''
    routing = combined[:start] + 'local professionReference\n\n' + combined[end:]
    for signature in ['function GBO:GetProfessionReferenceItem(itemID)',
                      'function GBO:SearchProfessionReference(query, limit)',
                      'function GBO:GetSharedCraftingReagents()']:
        routing = routing.replace(signature, signature + '\n    professionReference = professionReference or self:LoadProfessionReference()')
    return routing, reference
