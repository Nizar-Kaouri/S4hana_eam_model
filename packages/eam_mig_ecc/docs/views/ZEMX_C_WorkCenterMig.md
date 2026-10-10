# ZEMX_C_WorkCenterMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Work center (migration) |
| Module | `work_center` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_WorkCenterHeader`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap` |
| Source file | `src/zemx_c_workcentermig.ddls.asddls` |

## Purpose

Work centers to migrate (not flagged for deletion) with plant, category and responsible person translated through the migration map.

## Keys

- `WorkCenter`
- `Plant`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

The load program reads all rows and creates one work center per row; LegacyWorkCenter / LegacyPlant identify the source record.

## Open verification items

none
