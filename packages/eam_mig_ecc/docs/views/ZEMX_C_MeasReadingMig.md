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
| Data source | `ZEMX_I_MeasPointLastReading`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap` |
| Source file | `src/zemx_c_measreadingmig.ddls.asddls` |

## Purpose

Last valid reading per measuring point with the measuring point translated (key map from the measuring point load); values in the SI unit.

## Keys

- `MeasuringPoint`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

The load program posts one measurement document per row as the initial reading on S/4HANA.

## Open verification items

none
