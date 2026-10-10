# ZPPV_I_ProdOrderWithBOM

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Production Order with Material BOMs |
| Module | link: `bill_of_material` + `production_order` |
| Batch | 2 |
| Layer | link (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZPPV_I_ProductionOrder` |
| Source file | `src/zppv_i_prodorderwithbom.ddls.asddls` |

## Purpose

Production order with a to-many association to the BOM assignments of its material in the production plant.

## Keys

- `ManufacturingOrder`

## Associations defined here

- `_MaterialBOM` → `ZPPV_I_MaterialBOMLink` [0..*]

## Access control

Role inherits the conditions of `ZPPV_I_ProductionOrder`.

## Example use case

Which BOM alternatives exist for the material of an order.

## Open verification items

none
