# ZPPV_R_OrderSchedule

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Production Order Schedule Adherence |
| Module | `rpt_order_schedule` |
| Batch | 3 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZPPV_I_ProductionOrder` |
| Source file | `src/zppv_r_orderschedule.ddls.asddls` |

## Purpose

Schedule adherence cube over open production orders: number of open and late orders, maximum days late, delay bucket and open quantity per plant, MRP controller and material.

## Keys

- `ManufacturingOrder`

## Associations defined here

- `_ProductionOrder` → `ZPPV_I_ProductionOrder` [1..1]

## Access control

Role inherits the conditions of `ZPPV_I_ProductionOrder`.

## Example use case

Late orders per MRP controller; delay buckets per plant.

## Open verification items

`PP-R01` - see `BATCH_REPORT.md`.
