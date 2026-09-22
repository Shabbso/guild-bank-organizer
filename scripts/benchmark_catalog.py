#!/usr/bin/env python3
"""Informational Lua 5.1 heap measurement; not an in-game performance claim."""
import gzip
import json
from pathlib import Path
from lupa.lua51 import LuaRuntime
ROOT = Path(__file__).resolve().parents[1]


def measure(sources):
    vm = LuaRuntime(); addon = vm.table()
    count = vm.eval('function() collectgarbage("collect"); return collectgarbage("count") end')
    before = count()
    for source in sources:
        vm.execute(source, 'benchmark', addon)
    login = count() - before
    addon.GetProfessionReferenceItem(addon, 3371)
    reference = count() - before
    return {'loginHeapKiB': round(login, 2), 'afterReferenceHeapKiB': round(reference, 2)}


original = gzip.decompress((ROOT / 'scripts/data/profession-catalog.lua.gz').read_bytes()).decode()
result = {'runtime': 'Lupa Lua 5.1; GC collected; profession modules only',
          'v1.2.0': measure([original]),
          'candidate': measure([(ROOT / 'GuildBankOrganizer' / name).read_text()
                      for name in ('ProfessionData.lua', 'ProfessionReference.lua')])}
result['loginReductionPercent'] = round((1 - result['candidate']['loginHeapKiB'] / result['v1.2.0']['loginHeapKiB']) * 100, 1)
print(json.dumps(result, indent=2))
