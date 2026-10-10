# ZEMX_C_EquipmentMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment (migration) |
| Module | `equipment` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_Equipment`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap` |
| Source file | `src/zemx_c_equipmentmig.ddls.asddls` |

## Purpose

Equipment to migrate (not flagged for deletion) with all codes and keys translated through the migration map.

## Keys

- `Equipment`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

The load program creates the equipment (superordinate equipment first) and installs it at FunctionalLocation.

## Open verification items

none
