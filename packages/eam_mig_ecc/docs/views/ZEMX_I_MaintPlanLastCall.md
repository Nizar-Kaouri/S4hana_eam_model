# ZEMX_I_MaintPlanLastCall

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance plan last call |
| Module | `maintenance_plan` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_MaintPlanCallHistory` |
| Source file | `src/zemx_i_maintplanlastcall.ddls.asddls` |

## Purpose

Last call number and last completion date per maintenance plan: the restart point of the schedule on S/4HANA.

## Keys

- `MaintenancePlan`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the last completion date of plan 100.

## Open verification items

none
