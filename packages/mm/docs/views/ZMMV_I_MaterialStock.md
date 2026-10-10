# ZMMV_I_MaterialStock

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Material Stock |
| Module | `material_stock` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_MaterialStock_2` |
| Source file | `src/zmmv_i_materialstock.ddls.asddls` |

## Purpose

Stock quantity per material, plant, storage location, batch and stock type (unrestricted, quality inspection, blocked) from the material document table.

## Keys

- `Product`
- `Plant`
- `StorageLocation`
- `Batch`
- `InventoryStockType`
- `InventorySpecialStockType`

## Associations defined here

- `_Plant` → `I_Plant` [0..1]

## Access control

Role inherits the conditions of `I_MaterialStock_2`.

## Example use case

Current spare-part stock per storage location; blocked and quality-inspection stock per plant.

## Open verification items

`MM-010`, `MM-011`, `MM-012`, `MM-D03` - see `BATCH_REPORT.md`.
