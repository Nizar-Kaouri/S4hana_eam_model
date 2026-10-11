# ZPPV_I_ProductionOrderOp

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Production Order Operation - Cube |
| Module | `production_order_operation` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZPPV_B_ProductionOrderOp` |
| Source file | `src/zppv_i_productionorderop.ddls.asddls` |

## Purpose

Operation cube: planned, confirmed yield and scrap quantity per work center, with order type, material and plant from the order header.

## Keys

- `ManufacturingOrder`
- `ManufacturingOrderSequence`
- `ManufacturingOrderOperation`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZPPV_B_ProductionOrderOp`.

## Example use case

Scrap rate per work center and material.

## Open verification items

none
