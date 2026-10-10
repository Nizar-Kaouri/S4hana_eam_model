# ModuPorter EAM customer acceptance trial

Candidate: 0.3.1. Status: draft-unverified, pending your SAP trial.

## Install

1. Record the release, SAP_BASIS support package, database, client, extraction identity and abapGit version in TEST_RESULTS.csv.
2. Extract the ECC source ZIP into its own directory. Use abapGit offline import to a fresh development package ZEMX_MIG on ECC. The delivered prefix is ZEMX_. Avoid importing over unrelated existing objects. If those names exist, rebuild with your prefix using build_package.py; filesystem renaming is insufficient.
3. Consult DDIC_REQUIREMENTS.csv and OPEN_CHECKS.md. Check every required field in SE11, including datatype, length and actual key membership. Resolve activation errors against DDIC, not names alone.
4. Use ACTIVATION_ORDER.txt and group activation for association cycles. Capture the entire activation log, including warnings. Do not stop after the first successful view.
5. Optionally import the separate S/4HANA target ZIP into ZEMT_MIG on your target system. Its prefix is ZEMT_. Never import both products into the same system for this trial.
6. Check the role through your actual extraction channel. The views have no DCL; test both permitted and restricted users under your intended access model.

## Validate every module

Use a small known population from each available module. Empty extraction is not a passed test without evidence that the source population is empty. Populate the acceptance matrix and keep source-table screenshots or equivalent query/export evidence.

- Reconcile declared keys and row counts; deliberately include multiple languages, versions, assignments and repeated codes across object types.
- Verify deleted/inactive and completed cases against each view's documented scope.
- Check equipment hierarchy/time slices, functional-location labels and task-list type A/E/T, operations, components, PRTs and packages.
- Include a measurement entered late with an older reading date, a same-timestamp tie and a cancelled latest document.
- Check work-center multiple cost-center assignment counters and capacity reference IDs.
- Verify notification items/causes/tasks/activities and open-order operations/components/settlement/permits against the same parent set.
- Resolve BOM and task-list allocation history at the agreed cutover; don't post all ledger rows.
- For classification, text, status and partners, verify object identification and filter to migrated objects. Confirm READ_TEXT content separately.
- Check units/currency, language, leading zeros, time zones, numeric precision and customer includes against real data.

## Reconcile after a small customer load

The supplied tools/mig_reconcile.py in the outer test kit runs with Python 3.10 or newer and no extra dependencies. It finds the included source mappings in packages/eam_mig_ecc/modules. Main-object reconciliation covers eight modules. Use identical cohorts and cutover rules on both sides.

    python tools/mig_reconcile.py records --module equipment --source ecc_equipment.csv --target s4_equipment.csv --out equipment_records.md
    python tools/mig_reconcile.py counts --module equipment --source ecc_counts.csv --target s4_counts.csv --out equipment_counts.md

Use --maps <folder> --translate when your loader changes keys or values. Exit codes: 0 equal, 1 differences, 2 invalid input. Counts must be non-negative integers. CSV headers are required even when no records exist. Duplicate record keys are an error. An equal count alone is insufficient proof of a successful load.

## Return the evidence

Return TEST_RESULTS.csv, exact source/target releases, view name and full activation message for each failure, and anonymized rows for discrepancies. Mark each structure PASS, FAIL, BLOCKED or NOT_TESTED. Only promote a module after all its relevant structures and system checks pass; leave untested modules draft-unverified.
