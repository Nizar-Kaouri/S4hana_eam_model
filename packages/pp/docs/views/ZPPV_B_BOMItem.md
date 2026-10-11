# ZPPV_B_BOMItem

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Bill of Material Item |
| Module | `bill_of_material` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_BillOfMaterialItemBasic` |
| Source file | `src/zppv_b_bomitem.ddls.asddls` |

## Purpose

One row per BOM item version: component material, item category, item number, component quantity and unit, validity and deletion flag.

## Keys

- `BillOfMaterialCategory`
- `BillOfMaterial`
- `BillOfMaterialVariant`
- `BillOfMaterialItemNodeNumber`
- `BOMItemInternalChangeCount`

## Associations defined here

- none

## Access control

Role inherits the conditions of `I_BillOfMaterialItemBasic`.

## Example use case

Where-used list of a component; number of components per BOM.

## Open verification items

`PP-021`, `PP-022`, `PP-D04` - see `BATCH_REPORT.md`.
