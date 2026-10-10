# ZBRG_I_MaintOrderWithGoodsMvt

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Order with Goods Movements |
| Module | bridge: `eam:maintenance_order` + `mm:goods_movement` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZEAM_I_MaintOrder` |
| Source file | `src/zbrg_i_maintorderwithgoodsmvt.ddls.asddls` |

## Purpose

Maintenance order with a to-many association to the goods movements (issues, returns) posted to it.

## Keys

- `MaintenanceOrder`

## Associations defined here

- `_GoodsMovement` → `ZMMV_I_GoodsMovement` [0..*]

## Access control

Role inherits the conditions of `ZEAM_I_MaintOrder`.

## Example use case

Spare parts actually issued to an order vs. its planned components.

## Open verification items

`BRG-003`, `MM-022` - see `BATCH_REPORT.md`.
