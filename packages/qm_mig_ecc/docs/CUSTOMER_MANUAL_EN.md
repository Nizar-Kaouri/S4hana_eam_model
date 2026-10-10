# Supported scope

Quality Management has 4 modules and 15 extraction structures.

| Module | ID | Structures | Delivery mode |
|---|---|---|---|
| Inspection lots | inspection_lot | 2 | process-reference |
| Inspection results | inspection_result | 3 | reference |
| Quality notifications | quality_notification | 5 | process-reference |
| Inspection plan reference | inspection_plan | 5 | effectivity-reference |

The Basic layer preserves native table grain; Composite prepares a stable alias contract; Consumption exposes an explicitly documented candidate structure. Separate child structures preserve keys and multiplicity. Candidate data requires customer scope approval before posting. Existing analytical report modules remain in packages/qm; they are not duplicated as migration payloads.

Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

This scope does not imply every SAP feature is covered. Full-row allowlisted exports retain additional DDIC fields for customer extension. No posting program, customizing migration, business status replay, delta synchronization, clean-core certification or SAP runtime certification is supplied.

# Customer workflow

1. Record source and target release, client, organizational scope, cutoff and supported posting interface. Verify the DDIC fields, keys and target aliases; resolve OPEN_CHECKS before loading.
2. Install only needed modules in dependency order. Activate Basic, Composite, Consumption on ECC, and verified target projections on S/4HANA. BSEG CDS may require replacement by the ABAP export helper on ECC.
3. Export candidate structures and use DDIC full-row exports for extensions. Put UTF-8 CSV files under customer/exports using the headers supplied under customer/headers. Preserve leading zeros and internal keys.
4. Approve source identities, current-client scope, deletion/status and cutover rules. Fill every selected full-key CSV under customer/selection; an empty file yields no prepared rows. Resolve dependent child keys against approved parents, including regenerated IDs.
5. For interval/state tables, use customer/contracts first, then approve the resulting keys. NativeEligible is supplied by verified SAP effectivity evaluation, not guessed by Python. Never use a current stock snapshot to claim historic stock.
6. Run `python tools/migration_run.py --project customer/customer-cohort-project.json --out prepared`. Use a new output directory. The audited output is the population to adapt to the verified posting interface. The CDS count view still counts unscoped candidates; use prepared counts for migration sign-off.
7. Post through the chosen business interface, retain source-to-target numbering maps, errors and application logs. Reference structures are not automatically posted.
8. Export the same approved target cohort. customer/target-adapters.json specifies the aliases and keys for every structure, including those without a target CDS projection. Never compare all target rows against a subset of source rows.
9. Compare every applicable structure with `python tools/migration_prepare.py compare --mapping mapping/<module>/mapping.json --view <consumption view> --input <prepared.csv> --target <target.csv> --out <report.md>`. Use verified key/value maps where numbers changed. Matching counts alone is insufficient.
10. Validate balances, quantities, signs, currencies and rounding under an approved business contract, then archive the input hashes, logs and sign-off.

Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

# Customer test

Status: no SAP system has been used.

Test a permitted and a restricted identity, a small parent/child cohort, multiple languages, zero-padded identifiers, deletions, overlapping intervals, changed numbers, nonempty engineering changes and rejected target posts. Prove target compare grain and restrict it to the mapped cohort. Inject a duplicate key, missing field, changed value and missing record; require the corresponding reconciliation failure. Verify source and target quantities and currency totals independently of record counts. Confirm no history is reposted and no subledger is counted twice. Record release, client, transport, input hashes, application logs and every unresolved limitation.

## Business totals

`migration_business.py totals --input source.csv --target target.csv --contract verified-totals.json --out totals.json` uses exact Decimal arithmetic and refuses unknown sign codes, duplicate records and missing currency/unit groupings. Adapt the currency-totals-example.json fields and signs to the verified business contract; it is not a universal posting schema. Enrich units/currencies from approved master data where needed. It does not convert amounts or currencies.
