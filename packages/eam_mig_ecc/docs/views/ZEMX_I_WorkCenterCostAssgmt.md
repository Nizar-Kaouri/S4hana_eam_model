# ZEMX_I_WorkCenterCostAssgmt

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Work center cost center assignment |
| Module | `work_center` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `crco` |
| Source file | `src/zemx_i_workcentercostassgmt.ddls.asddls` |

## Purpose

Cost center assignments of work centers per validity period (CRCO).

## Keys

- `WorkCenterInternalID`
- `ActivityTypeSet`
- `ValidityEndDate`
- `CostCenterAssgmtCounter`

## Associations defined here

- `_WorkCenter` → `ZEMX_I_WorkCenterHeader` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the cost center of work center object 10000001 valid today.

## Open verification items

`XWC-004` - see `BATCH_REPORT.md`.
