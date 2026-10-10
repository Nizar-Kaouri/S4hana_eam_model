# ZPPV_C_OrderScheduleQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Production Schedule Adherence |
| Module | `rpt_order_schedule` |
| Batch | 3 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZPPV_R_OrderSchedule` |
| Source file | `src/zppv_c_orderscheduleq.ddls.asddls` |

## Purpose

Analytical query on ZPPV_R_OrderSchedule: open and late orders per plant and delay bucket.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZPPV_R_OrderSchedule (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
