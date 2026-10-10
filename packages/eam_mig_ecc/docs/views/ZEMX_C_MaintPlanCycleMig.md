# ZEMX_C_MaintPlanCycleMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance plan cycle (migration) |
| Module | `maintenance_plan` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_MaintPlanCycle` |
| Source file | `src/zemx_c_maintplancyclemig.ddls.asddls` |

## Purpose

Cycles / packages of the plans in scope with unit and measuring point; cycle values in the SI unit.

## Keys

- `MaintenancePlan`
- `MaintenancePlanCycle`

## Associations defined here

- `_MaintenancePlan` → `ZEMX_I_MaintenancePlan` [0..1]

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

The load program adds the cycles to the plan (converting the cycle value to CycleUnit).

## Open verification items

none
