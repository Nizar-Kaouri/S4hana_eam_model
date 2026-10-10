# ZMMV_I_ProductWithStock

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Product with Stock |
| Module | link: `material_stock` + `product` |
| Batch | 2 |
| Layer | link (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZMMV_I_Product` |
| Source file | `src/zmmv_i_productwithstock.ddls.asddls` |

## Purpose

Product with a to-many association to its stock segments (plant, storage location, batch, stock type).

## Keys

- `Product`

## Associations defined here

- `_Stock` → `ZMMV_I_MaterialStock` [0..*]

## Access control

Role inherits the conditions of `ZMMV_I_Product`.

## Example use case

Stock overview in a material object page.

## Open verification items

none
