# ZMMV_R_StockWithProduct

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Material Stock with Product |
| Module | link: `material_stock` + `product` |
| Batch | 2 |
| Layer | link (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZMMV_R_MaterialStock` |
| Source file | `src/zmmv_r_stockwithproduct.ddls.asddls` |

## Purpose

Stock cube enriched with product master data: foreign key to the product dimension (with texts) and product type, group and status as characteristics.

## Keys

- `Product`
- `Plant`
- `StorageLocation`
- `Batch`
- `InventoryStockType`
- `InventorySpecialStockType`

## Associations defined here

- `_Product` → `ZMMV_I_Product` [0..1]

## Access control

Role inherits the conditions of `ZMMV_R_MaterialStock`.

## Example use case

Unrestricted stock per product group and plant.

## Open verification items

none
