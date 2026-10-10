# ZEMX_C_MaintenancePlanMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance plan (migration) |
| Module | `maintenance_plan` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_MaintenancePlan` |
| Source file | `src/zemx_c_maintenanceplanmig.ddls.asddls` |

## Purpose

Maintenance plans to migrate with scheduling parameters and restart point.

## Keys

- `MaintenancePlan`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

The load program creates the plan and starts it from LastCompletionDate (no open calls are migrated).

## Open verification items

none
