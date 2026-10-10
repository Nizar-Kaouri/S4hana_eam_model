# ZMMV_C_GoodsMovementQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Goods Movement Analysis |
| Module | `goods_movement` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZMMV_R_GoodsMovement` |
| Source file | `src/zmmv_c_goodsmovementq.ddls.asddls` |

## Purpose

Analytical query on ZMMV_R_GoodsMovement: receipts and issues per plant and month.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZMMV_R_GoodsMovement (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
