# Parent population example

This preparation fixture demonstrates the parent relationship of ZPSX_C_WBSMig. These small CSVs demonstrate population selection, not SAP data export or posting.

From the extracted ZIP run:

    python tools/migration_run.py --project customer/examples/parent-scope/project.json --out parent-scope-example

Expected: one selected parent and two retained child rows. An unrelated parent is excluded. SD also excludes an unselected document item while preserving header item 000000. PREPARATION_AUDIT.json records all steps.
