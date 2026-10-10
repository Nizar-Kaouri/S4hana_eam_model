# ZEMX_I_WorkCenterCostCenter

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Work center cost center |
| Module | `work_center` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `ZEMX_I_WorkCenterCostAssgmt`, join `ZEMX_I_WorkCenterHeader` |
| Source file | `src/zemx_i_workcentercostcenter.ddls.asddls` |

## Purpose

Cost center assignments of work centers with the business key (work center + plant).

## Keys

- `WorkCenterInternalID`
- `ActivityTypeSet`
- `ValidityEndDate`
- `CostCenterAssgmtCounter`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Find the work centers without a valid cost center.

## Open verification items

none
