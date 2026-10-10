# ZEMX_C_MeasuringPointMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Measuring point (migration) |
| Module | `measuring_point` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_MeasuringPoint` |
| Source file | `src/zemx_c_measuringpointmig.ddls.asddls` |

## Purpose

Measuring points to migrate with technical object key and characteristic name; range values stay in the SI unit (converted by the load program).

## Keys

- `MeasuringPoint`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

The load program creates the measuring point at its technical object.

## Open verification items

none
