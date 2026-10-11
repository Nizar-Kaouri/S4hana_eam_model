# ZPPV_B_ProductionOrderOp

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Production Order Operation |
| Module | `production_order_operation` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_ManufacturingOrderOperation` |
| Source file | `src/zppv_b_productionorderop.ddls.asddls` |

## Purpose

One row per production order operation: text, work center, control profile, planned and confirmed yield / scrap quantity and scheduled dates.

## Keys

- `ManufacturingOrder`
- `ManufacturingOrderSequence`
- `ManufacturingOrderOperation`

## Associations defined here

- `_ProductionOrder` → `ZPPV_B_ProductionOrder` [1..1]

## Access control

Role inherits the conditions of `I_ManufacturingOrderOperation`.

## Example use case

Confirmed scrap per work center; operations behind schedule.

## Open verification items

`PP-010`, `PP-011`, `PP-012`, `PP-D02` - see `BATCH_REPORT.md`.
