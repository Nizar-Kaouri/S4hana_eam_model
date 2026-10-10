# ZEMX_C_MeasReadingMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Last measurement reading (migration) |
| Module | `measurement_document` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_MeasPointLastReading` |
| Source file | `src/zemx_c_measreadingmig.ddls.asddls` |

## Purpose

Last valid reading per measuring point; values in the SI unit.

## Keys

- `MeasuringPoint`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

The load program posts one measurement document per row as the initial reading on S/4HANA.

## Open verification items

none
