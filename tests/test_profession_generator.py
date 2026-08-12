import re
import unittest

from scripts.generate_profession_data import (
    GeneratedCategory,
    apply_taxonomy_policy,
    intrinsic_category,
    render_lua,
)
from scripts.profession_taxonomy import (
    CURATED_CATEGORY_BY_ITEM,
    EXCLUDED_ITEM_REASONS,
    SHARED_ITEM_IDS,
)


class TaxonomyPolicyTests(unittest.TestCase):
    def test_obvious_supplies_have_player_facing_owners(self):
        self.assertEqual(CURATED_CATEGORY_BY_ITEM[3371], "alchemy")
        self.assertEqual(CURATED_CATEGORY_BY_ITEM[39354], "inscription")
        self.assertEqual(CURATED_CATEGORY_BY_ITEM[37602], "enchanting")
        self.assertEqual(CURATED_CATEGORY_BY_ITEM[2604], "tailoring")

    def test_ghost_dye_has_the_tailoring_owner(self):
        self.assertEqual(CURATED_CATEGORY_BY_ITEM[9210], "tailoring")

    def test_reviewed_non_public_records_are_explicit(self):
        for item_id in (1165, 8547, 40677, 67435):
            self.assertIn(item_id, EXCLUDED_ITEM_REASONS)

    def test_shared_is_allowlist_only(self):
        generated = GeneratedCategory(
            "profession_supplies",
            "shared by multiple professions",
            ("blacksmithing", "tailoring"),
        )
        self.assertEqual(
            apply_taxonomy_policy(52078, generated).category,
            "profession_supplies",
        )
        with self.assertRaisesRegex(RuntimeError, "multi-owner item 999999"):
            apply_taxonomy_policy(999999, generated)

    def test_internal_records_are_excluded(self):
        self.assertIn(23418, EXCLUDED_ITEM_REASONS)
        self.assertIsNone(
            apply_taxonomy_policy(
                23418,
                GeneratedCategory("engineering", "metadata", ("engineering",)),
            )
        )

    def test_shared_and_excluded_sets_do_not_overlap(self):
        self.assertFalse(SHARED_ITEM_IDS & EXCLUDED_ITEM_REASONS.keys())

    def test_lua_output_exposes_catalog_lookups(self):
        lua = render_lua({
            "generated": {1: GeneratedCategory("alchemy", "generated", ())},
            "classifications": {1: "alchemy"},
            "sparse": {1: {"Display_lang": "Test Vial"}},
            "reference": {
                1: {
                    "item_id": 1,
                    "name": "Test Vial",
                    "category": "alchemy",
                    "evidence": "generated",
                    "status": "public",
                },
            },
            "connected_count": 1,
            "candidate_count": 1,
        })
        self.assertIn("local curatedCategories = {", lua)
        self.assertIn("function GBO:GetCuratedProfessionCategory(itemID)", lua)
        self.assertIn("function GBO:GetProfessionReferenceItem(itemID)", lua)
        self.assertIn("function GBO:SearchProfessionReference(query, limit)", lua)
        self.assertIn("function GBO:GetSharedCraftingReagents()", lua)

    def test_lua_lookup_bodies_preserve_public_search_behavior(self):
        lua = render_lua({
            "generated": {1: GeneratedCategory("alchemy", "generated", ())},
            "classifications": {1: "alchemy"},
            "sparse": {1: {"Display_lang": "Test Vial"}},
            "reference": {
                1: {
                    "item_id": 1,
                    "name": "Test Vial",
                    "category": "alchemy",
                    "evidence": "generated",
                    "status": "public",
                },
            },
            "connected_count": 1,
            "candidate_count": 1,
        })

        numeric_lookup = re.search(
            r'if string\.match\(query, "\^%d\+\$"\) then\n'
            r'\s+local record = professionReference\[tonumber\(query\)\]\n'
            r'\s+return record and \{ record \} or \{\}',
            lua,
        )
        self.assertIsNotNone(numeric_lookup)
        self.assertIn('if record.status == "public" and string.find(', lua)
        self.assertIn('string.lower(record.name), query, 1, true', lua)
        self.assertIn('if left.name == right.name then', lua)
        self.assertIn('return left.itemID < right.itemID', lua)
        self.assertIn('for index = #results, limit + 1, -1 do', lua)

    def test_lua_lookup_tables_encode_public_and_excluded_records(self):
        lua = render_lua({
            "generated": {52078: GeneratedCategory(
                "profession_supplies",
                "curated shared crafting reagent",
                ("blacksmithing", "tailoring"),
            )},
            "classifications": {52078: "profession_supplies"},
            "sparse": {52078: {"Display_lang": "Chaos Orb"}},
            "reference": {
                52078: {
                    "item_id": 52078,
                    "name": "Chaos Orb",
                    "category": "profession_supplies",
                    "evidence": "curated shared crafting reagent",
                    "status": "public",
                },
                23418: {
                    "item_id": 23418,
                    "name": "Test Sapper Charge",
                    "category": None,
                    "evidence": "internal test item",
                    "status": "excluded",
                },
            },
            "connected_count": 2,
            "candidate_count": 2,
        })

        self.assertRegex(
            lua,
            r'\[23418\] = \{\n'
            r'\s+itemID = 23418,\n'
            r'\s+name = "Test Sapper Charge",\n'
            r'\s+categoryKey = nil,\n'
            r'\s+evidence = "internal test item",\n'
            r'\s+status = "excluded",',
        )
        self.assertRegex(
            lua,
            r'local sharedCraftingReagents = \{\n\s+52078,\n\}',
        )
        self.assertIn(
            'table.insert(results, professionReference[itemID])',
            lua,
        )

    def test_unknown_recipe_subclass_defers_to_other_metadata(self):
        self.assertIsNone(
            intrinsic_category(
                45912,
                {"ClassID": "9", "SubclassID": "0", "InventoryType": "0"},
            )
        )


if __name__ == "__main__":
    unittest.main()
