# ZEMX_I_MaintenancePlan

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance plan |
| Module | `maintenance_plan` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `ZEMX_I_MaintenancePlanHeader`, join `ZEMX_I_MaintPlanLastCall`, join `ZEMX_I_StatusDeletionFlag` |
| Source file | `src/zemx_i_maintenanceplan.ddls.asddls` |

## Purpose

Maintenance plan with scheduling parameters, deletion flag and the restart point (last call / last completion date).

## Keys

- `MaintenancePlan`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the restart point of every strategy plan.

## Open verification items

none
