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
| Data source | `ZEMX_I_WorkCenterCostAssgmt` |
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

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Find the work centers without a valid cost center.

## Open verification items

none
