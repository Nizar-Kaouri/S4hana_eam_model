# ZEMX_I_MeasPointLastDate

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Last reading date |
| Module | `measurement_document` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_MeasurementDocument` |
| Source file | `src/zemx_i_measpointlastdate.ddls.asddls` |

## Purpose

Latest non-cancelled reading timestamp helper.

## Keys

- `MeasuringPoint`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read LastMeasurementDocument of measuring point 1234.

## Open verification items

none
