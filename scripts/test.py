#!/usr/bin/env python3
"""Run isolated WoW simulations using Lua 5.1 (pip install -r requirements-test.txt)."""
from pathlib import Path
import os
import argparse
import tempfile
import zipfile
import sys
from lupa.lua51 import LuaRuntime

ROOT = Path(__file__).resolve().parents[1]
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("--package", type=Path, help="Run against the addon extracted from this ZIP")
args = parser.parse_args()
package_directory = None
runtime_root = ROOT
if args.package:
    package_directory = tempfile.TemporaryDirectory(prefix="gbo-package-test-")
    runtime_root = Path(package_directory.name)
    with zipfile.ZipFile(args.package.resolve()) as archive:
        for entry in archive.namelist():
            assert entry.startswith("GuildBankOrganizer/") and ".." not in Path(entry).parts
        archive.extractall(runtime_root)
os.chdir(runtime_root)
compile_lua = LuaRuntime().eval("function(s,n) local f,e=loadstring(s,n); return f~=nil,e end")
for path in sorted((runtime_root / "GuildBankOrganizer").rglob("*.lua")):
    if "dist" in path.parts:
        continue
    ok, reason = compile_lua(path.read_text(), str(path))
    assert ok, reason
smoke = (ROOT / "tests/smoke.lua").read_text()
prefix = smoke.split("assert(type(addon.ShowTestUI)")[0]
setup = (ROOT / "tests/scenario_setup.lua").read_text()
failures = []
for path in sorted((ROOT / "tests/scenarios").glob("*.lua")):
    try:
        LuaRuntime().execute(prefix + setup + path.read_text())
        print("PASS", path.stem)
    except Exception as exc:
        failures.append(path.stem)
        print("FAIL", path.stem, str(exc))
try:
    LuaRuntime().execute(smoke)
except Exception as exc:
    failures.append("smoke")
    print("FAIL smoke", str(exc))
print(f"{len(failures)} failures")
if package_directory:
    os.chdir(ROOT)
    package_directory.cleanup()
sys.exit(bool(failures))
