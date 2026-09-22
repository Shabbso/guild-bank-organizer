import gzip
import re
import unittest
from pathlib import Path
from lupa.lua51 import LuaRuntime
from scripts.profession_artifacts import split_catalog
ROOT = Path(__file__).resolve().parents[1]


class CatalogArtifactsTests(unittest.TestCase):
    def test_every_published_record_and_route_is_preserved(self):
        combined = gzip.decompress((ROOT / 'scripts/data/profession-catalog.lua.gz').read_bytes()).decode()
        old_vm, new_vm = LuaRuntime(), LuaRuntime()
        old, new = old_vm.table(), new_vm.table()
        old_vm.execute(combined, 'test', old)
        for name in ('ProfessionData.lua', 'ProfessionReference.lua'):
            new_vm.execute((ROOT / 'GuildBankOrganizer' / name).read_text(), 'test', new)
        ids = {int(item_id) for item_id in re.findall(r'\[(\d+)\] = ', combined)}
        self.assertGreater(len(ids), 8000)
        self.assertIsNone(new.professionReferenceLoaded)
        for item_id in ids:
            self.assertEqual(old.GetCuratedProfessionCategory(old, item_id),
                             new.GetCuratedProfessionCategory(new, item_id))
            self.assertEqual(old.GetGeneratedProfessionCategory(old, item_id),
                             new.GetGeneratedProfessionCategory(new, item_id))
            left, right = old.GetProfessionReferenceItem(old, item_id), new.GetProfessionReferenceItem(new, item_id)
            if left is None:
                self.assertIsNone(right)
            else:
                self.assertIsNotNone(right)
                for key in ('itemID', 'name', 'categoryKey', 'evidence', 'status'):
                    self.assertEqual(left[key], right[key], (item_id, key))

    def test_packed_escaping_roundtrip(self):
        original = (ROOT / 'GuildBankOrganizer/ProfessionData.lua').read_text()
        # Exercise tabs, newlines, percent escapes and Lua delimiter text in records.
        record = 'local professionReference = { [1] = { itemID = 1, name = "A%09\\tB\\nC", categoryKey = nil, evidence = "a\\\\b", status = "excluded", }, }\n'
        synthetic = original.replace('local professionReference\n', record)
        _, reference = split_catalog(synthetic)
        vm = LuaRuntime(); addon = vm.table()
        vm.execute(reference, 'test', addon)
        value = addon.LoadProfessionReference(addon)[1]
        self.assertEqual(value.name, 'A%09\tB\nC')
        self.assertEqual(value.evidence, 'a\\b')
