# ZEMX_C_WorkCenterCostCtrMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Work center cost center (migration) |
| Module | `work_center` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_WorkCenterCostCenter` |
| Source file | `src/zemx_c_workcentercostctrmig.ddls.asddls` |

## Purpose

Cost center assignments of the work centers in scope with controlling area and cost center.

## Keys

- `WorkCenter`
- `Plant`
- `ValidityEndDate`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the cost center assignments valid today: filter ValidityEndDate >= today.

## Open verification items

none
