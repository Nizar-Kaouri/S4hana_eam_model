# ZEMT_I_WorkCenterCompare

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Work center compare (reconciliation) |
| Module | `work_center` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_WorkCenter` |
| Source file | `src/zemt_i_workcentercompare.ddls.asddls` |

## Purpose

Work center on S/4HANA with the business key and the fields compared after the load; element names equal the ECC extract so that tools/mig_reconcile.py compares them by name.

## Keys

- `WorkCenter`
- `Plant`

## Associations defined here

- none

## Access control

No DCL by design: Reconciliation view: it must see every migrated record to prove completeness. Grant it only to the migration / reconciliation role (decision TGEN-D01); no CDS access control by design.

## Example use case

Export this view after the load and compare it with the ECC extract: python3 tools/mig_reconcile.py fields --module work_center ...

## Open verification items

`TWC-001` - see `BATCH_REPORT.md`.
