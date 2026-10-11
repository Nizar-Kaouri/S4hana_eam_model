# Customer workflow

1. Record source and target release, client, organizational scope, cutoff and supported posting interface. Verify the DDIC fields, keys and target aliases; resolve OPEN_CHECKS before loading.
2. Install only needed modules in dependency order. Activate Basic, Composite, Consumption on ECC, and verified target projections on S/4HANA. BSEG CDS may require replacement by the ABAP export helper on ECC.
3. Export extraction structures and use DDIC full-row exports for extensions. Put UTF-8 CSV files under customer/exports using the headers supplied under customer/headers. Preserve leading zeros and internal keys.
4. Approve source identities, current-client scope, deletion/status and cutover rules. Fill every selected full-key CSV under customer/selection; an empty file yields no prepared rows. Resolve dependent child keys against approved parents, including regenerated IDs.
5. For interval/state tables, use customer/contracts first, then approve the resulting keys. NativeEligible is supplied by verified SAP effectivity evaluation, not guessed by Python. Never use a current stock snapshot to claim historic stock.
6. Run `python tools/migration_run.py --project customer/customer-cohort-project.json --out prepared`. Use a new output directory. The audited output is the population to adapt to the verified posting interface. The CDS count view still counts unscoped candidates; use prepared counts for migration sign-off.
7. Post through the chosen business interface, retain source-to-target numbering maps, errors and application logs. Reference structures are not automatically posted.
8. Export the same approved target cohort. customer/target-adapters.json specifies the aliases and keys for every structure, including those without a target CDS projection. Never compare all target rows against a subset of source rows.
9. Compare every applicable structure with `python tools/migration_prepare.py compare --mapping mapping/<module>/mapping.json --view <consumption view> --input <prepared.csv> --target <target.csv> --out <report.md>`. Use verified key/value maps where numbers changed. Matching counts alone is insufficient.
10. Validate balances, quantities, signs, currencies and rounding under an approved business contract, then archive the input hashes, logs and sign-off.

Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.

## Business totals

`migration_business.py totals --input source.csv --target target.csv --contract verified-totals.json --out totals.json` uses exact Decimal arithmetic and refuses unknown sign codes, duplicate records and missing currency/unit groupings. Adapt the currency-totals-example.json fields and signs to the verified business contract; it is not a universal posting schema. Enrich units/currencies from approved master data where needed. It does not convert amounts or currencies.

## Native DDIC preflight

Before using a extraction structure, export its full native table and adjacent `.fields.csv` metadata through the ABAP helper. Run `python tools/migration_ddic.py --mapping mapping/<module>/mapping.json --view <consumption view> --schema <table.csv.fields.csv> --out ddic-report.json`. A failure means the candidate mapping/source key must be corrected and regenerated before extraction or reconciliation. This checks source field availability and complete native keys, with only a typed MANDT implicit in current-client scope. It does not prove target support, activation, eligibility or currency semantics.
