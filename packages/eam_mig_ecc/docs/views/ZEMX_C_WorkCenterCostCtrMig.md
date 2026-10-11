# ZEMX_C_WorkCenterCostCtrMig

> Version **1.0.0**

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
- `ActivityTypeSet`
- `CostCenterAssgmtCounter`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the cost center assignments valid today: filter ValidityEndDate >= today.
