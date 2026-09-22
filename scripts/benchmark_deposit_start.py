#!/usr/bin/env python3
"""Compare beta.1 and working source using the same simulated bank responses."""
from pathlib import Path
import json
import os
import subprocess
from lupa.lua51 import LuaRuntime
ROOT = Path(__file__).resolve().parents[1]
os.chdir(ROOT)
BASELINE = 'bc57905'
prefix = (ROOT / 'tests/smoke.lua').read_text().split('assert(type(addon.ShowTestUI)')[0]
setup = (ROOT / 'tests/scenario_setup.lua').read_text()
scenario = '''
numGuildBankTabs=8
for tab=1,8 do
 slots[tab]={};configure(tab)
 local profile=addon:GetDepositProfile(tab,false)
 profile.categories={};profile.exactItemIDs={[1000+tab]=true}
end
addon:GetDepositProfile(3,false).exactItemIDs={[72988]=true}
bags[0]={[1]=makeItem(72988,10)}
local queries=0
QueryGuildBankTab=function() queries=queries+1;fire("GUILDBANKBAGSLOTS_CHANGED") end
local ready
assert(addon:RefreshDepositPlan(function() ready=currentTime end,true))
local iterations=0
while not ready do runNextTimer();iterations=iterations+1;assert(iterations<200) end
local initialQueries=queries
local firstMove
local pickup=PickupGuildBankItem
PickupGuildBankItem=function(...) firstMove=firstMove or currentTime;return pickup(...) end
local clicked=currentTime
assert(addon:StartDeposit(3))
while not firstMove do runNextTimer();iterations=iterations+1;assert(iterations<400) end
return ready,initialQueries,firstMove-clicked,queries-initialQueries
'''


def measure(revision=None):
    vm = LuaRuntime()
    if revision:
        compile_lua = vm.eval('function(s,n) return assert(loadstring(s,n)) end')
        def load_baseline(path):
            source = subprocess.check_output(['git', 'show', f'{revision}:{path}'], text=True)
            return compile_lua(source, path)
        vm.globals().loadfile = load_baseline
    ready, queries, delay, preflight_queries = vm.execute(prefix + setup + scenario)
    return {'previewReadySeconds': round(ready, 3), 'previewQueries': queries,
            'clickToFirstDepositSeconds': round(delay, 3), 'extraPreflightQueries': preflight_queries}


print(json.dumps({'fixture': '8 enabled tabs, eligible bag items for one destination; immediate simulated responses',
                  'baselineCommit': BASELINE, 'beta1': measure(BASELINE), 'candidate': measure()}, indent=2))
