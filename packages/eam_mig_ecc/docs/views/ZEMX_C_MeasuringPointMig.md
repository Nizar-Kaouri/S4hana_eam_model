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

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

The load program creates the measuring point at its technical object.

## Open verification items

none
