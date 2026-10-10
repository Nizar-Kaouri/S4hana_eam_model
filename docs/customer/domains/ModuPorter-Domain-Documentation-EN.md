# ModuPorter SAP Domain Migration Guides EN

Version 0.1.0. KAOURI INNOVATECH. Eight domain drafts. No SAP runtime validation.


# Supported scope

Asset Accounting has 3 modules and 5 extraction structures.

| Module | ID | Structures | Delivery mode |
|---|---|---|---|
| Fixed assets | fixed_asset | 3 | master |
| Asset transaction history | asset_transaction | 1 | reference |
| Asset fiscal year balances | asset_balance | 1 | balance |

The Basic layer preserves native table grain; Composite prepares a stable alias contract; Consumption exposes an explicitly documented candidate structure. Separate child structures preserve keys and multiplicity. Candidate data requires customer scope approval before posting. Existing analytical report modules remain in packages/fi_aa; they are not duplicated as migration payloads.

Depreciation areas, currencies, fiscal years and transfer dates must be agreed. ANLC values are fiscal-year accumulations, not a ready-made posting file. Asset balances must not also enter the general ledger opening balance. Asset transaction history is reconciliation reference data; Universal Parallel Accounting requires a separate supported interface assessment.

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

Depreciation areas, currencies, fiscal years and transfer dates must be agreed. ANLC values are fiscal-year accumulations, not a ready-made posting file. Asset balances must not also enter the general ledger opening balance. Asset transaction history is reconciliation reference data; Universal Parallel Accounting requires a separate supported interface assessment.

# Customer test

Status: no SAP system has been used.

Test a permitted and a restricted identity, a small parent/child cohort, multiple languages, zero-padded identifiers, deletions, overlapping intervals, changed numbers, nonempty engineering changes and rejected target posts. Prove target compare grain and restrict it to the mapped cohort. Inject a duplicate key, missing field, changed value and missing record; require the corresponding reconciliation failure. Verify source and target quantities and currency totals independently of record counts. Confirm no history is reposted and no subledger is counted twice. Record release, client, transport, input hashes, application logs and every unresolved limitation.

## Business totals

`migration_business.py totals --input source.csv --target target.csv --contract verified-totals.json --out totals.json` uses exact Decimal arithmetic and refuses unknown sign codes, duplicate records and missing currency/unit groupings. Adapt the currency-totals-example.json fields and signs to the verified business contract; it is not a universal posting schema. Enrich units/currencies from approved master data where needed. It does not convert amounts or currencies.


# Supported scope

Materials Management has 5 modules and 21 extraction structures.

| Module | ID | Structures | Delivery mode |
|---|---|---|---|
| Material master | product | 8 | master |
| Inventory balances | material_stock | 4 | balance |
| Goods movement history | goods_movement | 2 | reference |
| Purchase requisitions | purchase_requisition | 2 | open-document |
| Purchase orders | purchase_order | 5 | open-document |

The Basic layer preserves native table grain; Composite prepares a stable alias contract; Consumption exposes an explicitly documented candidate structure. Separate child structures preserve keys and multiplicity. Candidate data requires customer scope approval before posting. Existing analytical report modules remain in packages/mm; they are not duplicated as migration payloads.

Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

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

Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

# Customer test

Status: no SAP system has been used.

Test a permitted and a restricted identity, a small parent/child cohort, multiple languages, zero-padded identifiers, deletions, overlapping intervals, changed numbers, nonempty engineering changes and rejected target posts. Prove target compare grain and restrict it to the mapped cohort. Inject a duplicate key, missing field, changed value and missing record; require the corresponding reconciliation failure. Verify source and target quantities and currency totals independently of record counts. Confirm no history is reposted and no subledger is counted twice. Record release, client, transport, input hashes, application logs and every unresolved limitation.

## Business totals

`migration_business.py totals --input source.csv --target target.csv --contract verified-totals.json --out totals.json` uses exact Decimal arithmetic and refuses unknown sign codes, duplicate records and missing currency/unit groupings. Adapt the currency-totals-example.json fields and signs to the verified business contract; it is not a universal posting schema. Enrich units/currencies from approved master data where needed. It does not convert amounts or currencies.


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


# Supported scope

Project System has 3 modules and 4 extraction structures.

| Module | ID | Structures | Delivery mode |
|---|---|---|---|
| Projects | project | 1 | master |
| WBS elements | wbs_element | 2 | master |
| Project cost history | project_cost | 1 | reference |

The Basic layer preserves native table grain; Composite prepares a stable alias contract; Consumption exposes an explicitly documented candidate structure. Separate child structures preserve keys and multiplicity. Candidate data requires customer scope approval before posting. Existing analytical report modules remain in packages/ps; they are not duplicated as migration payloads.

Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement.

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

Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement.

# Customer test

Status: no SAP system has been used.

Test a permitted and a restricted identity, a small parent/child cohort, multiple languages, zero-padded identifiers, deletions, overlapping intervals, changed numbers, nonempty engineering changes and rejected target posts. Prove target compare grain and restrict it to the mapped cohort. Inject a duplicate key, missing field, changed value and missing record; require the corresponding reconciliation failure. Verify source and target quantities and currency totals independently of record counts. Confirm no history is reposted and no subledger is counted twice. Record release, client, transport, input hashes, application logs and every unresolved limitation.

## Business totals

`migration_business.py totals --input source.csv --target target.csv --contract verified-totals.json --out totals.json` uses exact Decimal arithmetic and refuses unknown sign codes, duplicate records and missing currency/unit groupings. Adapt the currency-totals-example.json fields and signs to the verified business contract; it is not a universal posting schema. Enrich units/currencies from approved master data where needed. It does not convert amounts or currencies.


# Supported scope

Production Planning has 4 modules and 15 extraction structures.

| Module | ID | Structures | Delivery mode |
|---|---|---|---|
| Production orders | production_order | 3 | process-reference |
| Production order operations | production_order_operation | 3 | process-reference |
| Material bills of material | bill_of_material | 4 | effectivity-reference |
| Routing reference | routing | 5 | effectivity-reference |

The Basic layer preserves native table grain; Composite prepares a stable alias contract; Consumption exposes an explicitly documented candidate structure. Separate child structures preserve keys and multiplicity. Candidate data requires customer scope approval before posting. Existing analytical report modules remain in packages/pp; they are not duplicated as migration payloads.

BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

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

BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

# Customer test

Status: no SAP system has been used.

Test a permitted and a restricted identity, a small parent/child cohort, multiple languages, zero-padded identifiers, deletions, overlapping intervals, changed numbers, nonempty engineering changes and rejected target posts. Prove target compare grain and restrict it to the mapped cohort. Inject a duplicate key, missing field, changed value and missing record; require the corresponding reconciliation failure. Verify source and target quantities and currency totals independently of record counts. Confirm no history is reposted and no subledger is counted twice. Record release, client, transport, input hashes, application logs and every unresolved limitation.

## Business totals

`migration_business.py totals --input source.csv --target target.csv --contract verified-totals.json --out totals.json` uses exact Decimal arithmetic and refuses unknown sign codes, duplicate records and missing currency/unit groupings. Adapt the currency-totals-example.json fields and signs to the verified business contract; it is not a universal posting schema. Enrich units/currencies from approved master data where needed. It does not convert amounts or currencies.


# Supported scope

Controlling has 5 modules and 9 extraction structures.

| Module | ID | Structures | Delivery mode |
|---|---|---|---|
| Cost centers | cost_center | 2 | master |
| Profit centers | profit_center | 2 | master |
| Internal orders | internal_order | 2 | master |
| Actual cost history | cost_actuals | 1 | reference |
| Cost element references | cost_element | 2 | reference |

The Basic layer preserves native table grain; Composite prepares a stable alias contract; Consumption exposes an explicitly documented candidate structure. Separate child structures preserve keys and multiplicity. Candidate data requires customer scope approval before posting. Existing analytical report modules remain in packages/co; they are not duplicated as migration payloads.

Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.

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

Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.

# Customer test

Status: no SAP system has been used.

Test a permitted and a restricted identity, a small parent/child cohort, multiple languages, zero-padded identifiers, deletions, overlapping intervals, changed numbers, nonempty engineering changes and rejected target posts. Prove target compare grain and restrict it to the mapped cohort. Inject a duplicate key, missing field, changed value and missing record; require the corresponding reconciliation failure. Verify source and target quantities and currency totals independently of record counts. Confirm no history is reposted and no subledger is counted twice. Record release, client, transport, input hashes, application logs and every unresolved limitation.

## Business totals

`migration_business.py totals --input source.csv --target target.csv --contract verified-totals.json --out totals.json` uses exact Decimal arithmetic and refuses unknown sign codes, duplicate records and missing currency/unit groupings. Adapt the currency-totals-example.json fields and signs to the verified business contract; it is not a universal posting schema. Enrich units/currencies from approved master data where needed. It does not convert amounts or currencies.


# Supported scope

Financial Accounting has 5 modules and 17 extraction structures.

| Module | ID | Structures | Delivery mode |
|---|---|---|---|
| G/L accounts | gl_account | 3 | master |
| Supplier source data | supplier | 3 | master |
| Customer source data | customer | 3 | master |
| Accounting document history | gl_line_item | 2 | reference |
| Current and cleared item indexes | open_items | 6 | open-item |

The Basic layer preserves native table grain; Composite prepares a stable alias contract; Consumption exposes an explicitly documented candidate structure. Separate child structures preserve keys and multiplicity. Candidate data requires customer scope approval before posting. Existing analytical report modules remain in packages/fi; they are not duplicated as migration payloads.

Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

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

Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

# Customer test

Status: no SAP system has been used.

Test a permitted and a restricted identity, a small parent/child cohort, multiple languages, zero-padded identifiers, deletions, overlapping intervals, changed numbers, nonempty engineering changes and rejected target posts. Prove target compare grain and restrict it to the mapped cohort. Inject a duplicate key, missing field, changed value and missing record; require the corresponding reconciliation failure. Verify source and target quantities and currency totals independently of record counts. Confirm no history is reposted and no subledger is counted twice. Record release, client, transport, input hashes, application logs and every unresolved limitation.

## Business totals

`migration_business.py totals --input source.csv --target target.csv --contract verified-totals.json --out totals.json` uses exact Decimal arithmetic and refuses unknown sign codes, duplicate records and missing currency/unit groupings. Adapt the currency-totals-example.json fields and signs to the verified business contract; it is not a universal posting schema. Enrich units/currencies from approved master data where needed. It does not convert amounts or currencies.

For historical open items, normalize open and cleared indexes to identical aliases, then use `migration_business.py open-items --input open.csv cleared.csv --contract customer/contracts/fi-open-at-cutover.json --cutover YYYYMMDD --out selected.csv`. This selects posted by cutover and not cleared by cutover. It requires a consistent, complete source export; resets, special GL and business eligibility still need review.


# Supported scope

Sales and Distribution has 3 modules and 12 extraction structures.

| Module | ID | Structures | Delivery mode |
|---|---|---|---|
| Sales orders | sales_order | 8 | open-document |
| Outbound delivery reference | outbound_delivery | 2 | reference |
| Billing document reference | billing_document | 2 | reference |

The Basic layer preserves native table grain; Composite prepares a stable alias contract; Consumption exposes an explicitly documented candidate structure. Separate child structures preserve keys and multiplicity. Candidate data requires customer scope approval before posting. Existing analytical report modules remain in packages/sd; they are not duplicated as migration payloads.

Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.

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

Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.

# Customer test

Status: no SAP system has been used.

Test a permitted and a restricted identity, a small parent/child cohort, multiple languages, zero-padded identifiers, deletions, overlapping intervals, changed numbers, nonempty engineering changes and rejected target posts. Prove target compare grain and restrict it to the mapped cohort. Inject a duplicate key, missing field, changed value and missing record; require the corresponding reconciliation failure. Verify source and target quantities and currency totals independently of record counts. Confirm no history is reposted and no subledger is counted twice. Record release, client, transport, input hashes, application logs and every unresolved limitation.

## Business totals

`migration_business.py totals --input source.csv --target target.csv --contract verified-totals.json --out totals.json` uses exact Decimal arithmetic and refuses unknown sign codes, duplicate records and missing currency/unit groupings. Adapt the currency-totals-example.json fields and signs to the verified business contract; it is not a universal posting schema. Enrich units/currencies from approved master data where needed. It does not convert amounts or currencies.
