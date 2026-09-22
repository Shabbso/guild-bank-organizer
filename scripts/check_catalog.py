#!/usr/bin/env python3
"""Check deterministic artifacts against the pinned generated input snapshot."""
from pathlib import Path
import gzip
import hashlib
import json
from profession_artifacts import split_catalog
ROOT = Path(__file__).resolve().parents[1]
original = gzip.decompress((ROOT / 'scripts/data/profession-catalog.lua.gz').read_bytes())
manifest = json.loads((ROOT / 'scripts/data/provenance.json').read_text())
assert hashlib.sha256(original).hexdigest() == manifest['combinedSha256']
for name, contents in zip(('ProfessionData.lua', 'ProfessionReference.lua'), split_catalog(original.decode())):
    assert (ROOT / 'GuildBankOrganizer' / name).read_text() == contents, f'{name} is out of date'
print('Catalog artifacts match pinned source snapshot and SHA-256')
