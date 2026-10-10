# ZPPV_R_BOMItem

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Bill of Material Item - Cube |
| Module | `bill_of_material` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZPPV_I_BOMItem` |
| Source file | `src/zppv_r_bomitem.ddls.asddls` |

## Purpose

BOM item cube (deleted items excluded): number of items and component quantity per BOM, component and item category.

## Keys

- `BillOfMaterialCategory`
- `BillOfMaterial`
- `BillOfMaterialVariant`
- `BillOfMaterialItemNodeNumber`
- `BOMItemInternalChangeCount`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZPPV_I_BOMItem`.

## Example use case

Components used in the most BOMs; BOM size per BOM category.

## Open verification items

none
