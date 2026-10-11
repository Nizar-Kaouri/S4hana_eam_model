# Customer preparation workflow

The CDS consumption views are convenient extracts with documented filters. Views that currently select the highest recorded task-list counter or the open-ended equipment segment are previews of that state; they do not implement historical cutover or full ECM effectivity. For a dated migration, use the full-row export helper and the supplied raw-table snapshot contracts before creating your load payload. Do not attempt to repair a prefiltered preview by deleting its future rows: older eligible states would already be missing.

## Run the included example first

Python 3.10+ is required. No third-party Python libraries are needed. From the extracted customer ZIP:

    python tools/eam_run.py --project customer/examples/workflow.json --out trial-example

Expected results: one selected equipment segment at plant 2000, one surviving task-list header, and two service-package rows including a nested package. The example excludes a future task-list change, a deleted latest header and unrelated equipment/service rows. PREPARATION_AUDIT.json records input/contract/output hashes and row counts. Use a new output directory for each run; the tool validates the entire project before publishing it.

## Prepare a real cutover

1. Agree the date, client, root population and treatment of preexisting target references. Preserve internal identifiers and never strip leading zeros globally.
2. Export complete raw ledgers through the SAP helper. Select/filter root equipment/work centers/task lists first. Export all relevant historical states, not only the newest counter.
3. Verify every supplied customer/contracts/*-snapshot.json against your actual DDIC and business identity. The contracts are explicit starter rules; missing fields, malformed dates, ambiguous ranks and overlapping intervals produce errors rather than a guessed snapshot. Adapt a release-specific identity only with evidence, especially additional criteria and engineering-change variants.
4. For change-number tables, attach Eligible=Y/N to every state using the source system's native evaluation for the agreed date, change status and effectivity parameters. The engine validates the verdict and refuses unevaluated change-number states. This is a required source fact, not an inferred rule from counter order. Preserve the native evaluation evidence with the export. For tables with no change-number support on your release, remove that setting only after confirming their validity model.
5. Run snapshot selection before deletion filtering. For interval contracts, exactly one applicable interval may exist per identity. For state contracts, (valid-from, optional order fields, numeric counter) chooses a state; a deleted chosen state removes the identity without resurrecting an older row. Dates are inclusive. Measurement documents use reading date/time/document number. Reject readings after cutover and cancelled latest states.
6. Reconstruct dated payloads by joining the selected EQUZ segment to EQUI/ILOA/CRHD and selected PLAS assignment to selected PLPO operation detail. eam_prepare.py join enforces many-to-one parent identity and rejects orphans and output alias collisions. aliases renames verified raw fields into the documented consumption contract. Join on all applicable technical identity columns and preserve identifiers and relationships for migration loading.
7. For BOMs, snapshot STKO and STAS/STPO separately. Limit headers/selections to selected EQST equipment/plant/usage/alternative references; then derive the selected item-node cohort from surviving STAS rows. A selected alternative's nodes control its STPO population. Never join all alternatives by STLNR alone. The project reference_keys step builds reference sets without deduplicating payloads. ECM verdicts must reflect object-specific effectivity; unsupported parameter effectivity must be reported BLOCKED rather than silently flattened.
8. Apply the selected-root cohort to every child. customer/contracts/structure-cohorts.json covers the canonical extraction structures. customer-cohort-project.json is a complete editable project for canonical CSVs; all root files are authoritative customer-selected populations. It also requires explicit typed cohorts for classification/status/partners and exact text identities, plus work-center IDs, capacity IDs and BOM alternatives/nodes. Text/classification IDs may require source INOB/customizing lookup; no guessed derivation is supplied. Empty selected roots intentionally produce empty children and should be recorded as such.

## Useful individual commands

    python tools/eam_prepare.py snapshot --input equz.csv --contract customer/contracts/equz-snapshot.json --cutover 20261010 --out equz_at_cutover.csv
    python tools/eam_prepare.py cohort --input readings.csv --parent selected_points.csv --child-keys MeasuringPoint --parent-keys MeasuringPoint --out scoped_readings.csv
    python tools/eam_prepare.py closure --input esll.csv --parent operation_packages.csv --contract customer/contracts/nested-services.json --out selected_services.csv

## Specialized data is included through full-row helpers

- Capacity: KAKO/KAKT/KAZY/KAPA/KAPE, preserving every DDIC field, interval, version and shift key. Scope KAPID through selected CRCA. Preserve shared capacity IDs and all referenced calendars/shift definitions from T550A/T550P.
- Formulas/defaults: full CRHD and TC20/TC20T/TC21/TC21T/TC25/TC25T. These are referenced settings; identify the actually used records and verify target customizing rather than globally copying configuration.
- Task-list sequences/relationships: PLFL/PLAB with all DDIC columns; limit to selected task-list identities and operation nodes and validate both predecessor and successor references. Confirm the release-specific PM relationships source in DDIC.
- Services: ESLH/ESLL plus ESUH/ESUC limit data. Seed package IDs from selected operations and follow nested ESLL.SUB_PACKNO through closure. Missing nested packages or cycles are errors. Preserve outlines, lines, limits, contract references and units/prices; no service posting implementation is included.
- Dependencies: CUOB/CUKB/CUKT/CUKN/CUXREF and referenced characteristic/value data. Follow dependency assignments from the selected task-list/service cohort, retain source representation and definitions, and validate all referenced characteristic IDs on the target. Decoding/posting dependency source is interface-specific customer loading work.
- Texts: selected index plus ordered READ_TEXT content; inspect formatting, line order, languages and mapped names on target.

See helpers/README.md for report setup and customer/contracts/extension-inventory.json for the source inventory. Availability and precise keys are established by your release's DDIC export, not asserted from a documentation table list.
