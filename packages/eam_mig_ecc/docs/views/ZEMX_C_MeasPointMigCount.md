# ZEMX_C_MeasPointMigCount

> Version **1.0.0**

| | |
|---|---|
| Description | Measuring point count (migration) |
| Module | `measuring_point` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_C_MeasuringPointMig` |
| Source file | `src/zemx_c_measpointmigcount.ddls.asddls` |

## Purpose

Record count of the measuring points delivered by ZEMX_C_MeasuringPointMig per MeasuringPointCategory, MeasuringPointIsCounter; compared with the same count on S/4HANA by tools/mig_reconcile.py.

## Keys

- `MeasuringPointCategory`
- `MeasuringPointIsCounter`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export this view before the load and the S/4HANA count view after it; the reconcile tool lists every MeasuringPointCategory / MeasuringPointIsCounter combination whose counts differ.
