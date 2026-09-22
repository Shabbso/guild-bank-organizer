#!/usr/bin/env python3
"""Build and verify a reproducible, TOC-checked addon ZIP with a SHA-256 manifest."""
from pathlib import Path
import hashlib
import json
import re
import zipfile
ROOT = Path(__file__).resolve().parents[1]
ADDON = ROOT / 'GuildBankOrganizer'


def build():
    toc = (ADDON / 'GuildBankOrganizer.toc').read_text()
    version = re.search(r'^## Version: (.+)$', toc, re.M).group(1).strip()
    assert re.fullmatch(r'[0-9A-Za-z.-]+', version), 'Unsafe version name'
    entries = [line.strip() for line in toc.splitlines() if line.strip() and not line.startswith('#')]
    assert len(entries) == len(set(entries)), 'Duplicate TOC load entry'
    for entry in entries:
        assert (ADDON / entry).is_file(), f'Missing TOC file: {entry}'
    files = {f'GuildBankOrganizer/{p.relative_to(ADDON).as_posix()}': p.read_bytes()
             for p in ADDON.rglob('*') if p.is_file() and p.name != '.DS_Store'}
    for name in ('README.md', 'CHANGELOG.md', 'ACKNOWLEDGMENTS.md', 'LICENSE'):
        files[f'GuildBankOrganizer/{name}'] = (ROOT / name).read_bytes()
    for name in ('MAINTENANCE_VALIDATION.md', 'RELEASE_CHECKLIST.md', 'PROFESSION_COVERAGE.md',
                 'adr/0001-operation-refresh-and-reference-loading.md'):
        files[f'GuildBankOrganizer/docs/{name}'] = (ROOT / 'docs' / name).read_bytes()
    assert all('/.' not in name for name in files), 'Hidden development file in package'
    assert all(name in entries for name in (p.name for p in ADDON.glob('*.lua'))), 'Unloaded Lua module'
    manifest = {name: hashlib.sha256(data).hexdigest() for name, data in sorted(files.items())}
    files['GuildBankOrganizer/MANIFEST.sha256.json'] = (json.dumps(manifest, indent=2) + '\n').encode()
    dist = ROOT / 'dist'
    dist.mkdir(exist_ok=True)
    archive = dist / f'GuildBankOrganizer-{version}.zip'
    with zipfile.ZipFile(archive, 'w', compression=zipfile.ZIP_DEFLATED, compresslevel=9) as output:
        for name, data in sorted(files.items()):
            entry = zipfile.ZipInfo(name, (2026, 1, 1, 0, 0, 0))
            entry.compress_type = zipfile.ZIP_DEFLATED
            entry.create_system = 3
            entry.external_attr = 0o100644 << 16
            output.writestr(entry, data, compresslevel=9)
    with zipfile.ZipFile(archive) as check:
        assert check.testzip() is None
        assert set(check.namelist()) == set(files)
        for name, checksum in manifest.items():
            assert hashlib.sha256(check.read(name)).hexdigest() == checksum
    digest = hashlib.sha256(archive.read_bytes()).hexdigest()
    archive.with_suffix('.zip.sha256').write_text(f'{digest}  {archive.name}\n')
    print(f'{archive}\nSHA-256 {digest}\nVerified {len(files)} packaged files')
    return archive


if __name__ == '__main__':
    build()
