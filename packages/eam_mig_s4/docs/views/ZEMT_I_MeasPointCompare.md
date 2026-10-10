# ZEMT_I_MeasPointCompare

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Measuring point compare (reconciliation) |
| Module | `measuring_point` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_MeasuringPoint` |
| Source file | `src/zemt_i_measpointcompare.ddls.asddls` |

## Purpose

Measuring point on S/4HANA with the business key and the fields compared after the load; element names equal the ECC extract so that tools/mig_reconcile.py compares them by name.

## Keys

- `MeasuringPoint`

## Associations defined here

- none

## Access control

No DCL by design: Reconciliation view: it must see every migrated record to prove completeness. Grant it only to the migration / reconciliation role (decision TGEN-D01); no CDS access control by design.

## Example use case

Export this view after the load and compare it with the ECC extract: python3 tools/mig_reconcile.py fields --module measuring_point ...

## Open verification items

`TMP-001` - see `BATCH_REPORT.md`.
