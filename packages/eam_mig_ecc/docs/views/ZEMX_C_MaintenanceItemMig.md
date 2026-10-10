# ZEMX_C_MaintenanceItemMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance item (migration) |
| Module | `maintenance_plan` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_MaintenanceItem`, join `ZEMX_I_MaintenancePlan` |
| Source file | `src/zemx_c_maintenanceitemmig.ddls.asddls` |

## Purpose

Maintenance items of the plans in scope with reference objects, work center, types and task list.

## Keys

- `MaintenanceItem`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

The load program adds the items to the plan created from ZEMX_C_MaintenancePlanMig.

## Open verification items

none
