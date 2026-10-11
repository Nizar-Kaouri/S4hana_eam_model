# ZMMV_I_MaterialStock

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Material Stock - Cube |
| Module | `material_stock` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZMMV_B_MaterialStock` |
| Source file | `src/zmmv_i_materialstock.ddls.asddls` |

## Purpose

Stock cube: total and unrestricted stock quantity per material, plant, storage location and stock type.

## Keys

- `Product`
- `Plant`
- `StorageLocation`
- `Batch`
- `InventoryStockType`
- `InventorySpecialStockType`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZMMV_B_MaterialStock`.

## Example use case

Unrestricted spare-part stock per plant; stock in quality inspection.

## Open verification items

`MM-R01` - see `BATCH_REPORT.md`.
