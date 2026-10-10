# Supported scope

Production Planning has 6 modules and 17 extraction structures.

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

## Coverage additions — 0.2.0

### Production versions (`production_version`)

Verify production-version validity, lot-size ranges, lock/check status and the effective BOM/task-list combination. Materials and plants are cross-domain prerequisites. Distinct production versions may intentionally overlap; evaluate availability for a version identity rather than rejecting every material-level overlap. REM planning levels require release-specific interface review.

### Production confirmations (`production_confirmation`)

Preserve confirmation/counter identity and reversal relationships; do not delete reversals and assume the remaining history is net yield. Target order/operation mapping and posting periods must be approved. Reposting confirmations can trigger backflush, goods movements, activity allocations and accounting; confirmation history is reference-only unless a supported process migration explicitly authorizes those effects.
