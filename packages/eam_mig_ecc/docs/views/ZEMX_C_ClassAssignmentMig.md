# ZEMX_C_ClassAssignmentMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Class assignment (migration) |
| Module | `classification` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_ClassAssignment`, join `ZEMX_I_MigrationMap`, join `ZEMX_I_MigrationMap` |
| Source file | `src/zemx_c_classassignmentmig.ddls.asddls` |

## Purpose

Class assignments of equipment (002) and functional locations (003) with the object key translated.

## Keys

- `ClassifiedObject`
- `ClassType`
- `Class`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

The load program assigns the classes after the technical objects are loaded.

## Open verification items

none
