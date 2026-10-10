# ZBRG_I_ProdOpWithWorkCenter

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Production Operation with Work Center |
| Module | bridge: `eam:work_center` + `pp:production_order_operation` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZPPV_I_ProductionOrderOp` |
| Source file | `src/zbrg_i_prodopwithworkcenter.ddls.asddls` |

## Purpose

Production order operations with the shared work center master of the EAM product (external ID, plant, category, texts).

## Keys

- `ManufacturingOrder`
- `ManufacturingOrderSequence`
- `ManufacturingOrderOperation`

## Associations defined here

- `_WorkCenter` → `ZEAM_I_WorkCenter` [0..1]

## Access control

Role inherits the conditions of `ZPPV_I_ProductionOrderOp`.

## Example use case

Production and maintenance load on the same work center.

## Open verification items

`BRG-004` - see `BATCH_REPORT.md`.
