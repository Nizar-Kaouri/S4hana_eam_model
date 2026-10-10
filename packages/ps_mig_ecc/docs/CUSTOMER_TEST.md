# Customer test

Status: no SAP system has been used.

Test a permitted and a restricted identity, a small parent/child cohort, multiple languages, zero-padded identifiers, deletions, overlapping intervals, changed numbers, nonempty engineering changes and rejected target posts. Prove target compare grain and restrict it to the mapped cohort. Inject a duplicate key, missing field, changed value and missing record; require the corresponding reconciliation failure. Verify source and target quantities and currency totals independently of record counts. Confirm no history is reposted and no subledger is counted twice. Record release, client, transport, input hashes, application logs and every unresolved limitation.

## Native DDIC preflight

Before using a candidate structure, export its full native table and adjacent `.fields.csv` metadata through the ABAP helper. Run `python tools/migration_ddic.py --mapping mapping/<module>/mapping.json --view <consumption view> --schema <table.csv.fields.csv> --out ddic-report.json`. A failure means the candidate mapping/source key must be corrected and regenerated before extraction or reconciliation. This checks source field availability and complete native keys, with only a typed MANDT implicit in current-client scope. It does not prove target support, activation, eligibility or currency semantics.
