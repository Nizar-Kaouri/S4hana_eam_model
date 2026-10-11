# ZMMV_B_Product

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Product |
| Module | `product` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_Product` |
| Source file | `src/zmmv_b_product.ddls.asddls` |

## Purpose

One row per product (material) with type, group, base unit, status, weights and authorization group; analytical dimension for stock, movement and purchasing cubes.

## Keys

- `Product`

## Associations defined here

- `_Text` → `ZMMV_B_ProductText` [0..*]

## Access control

Role inherits the conditions of `I_Product`.

## Example use case

Material attributes next to stock quantities; spare parts filtered by product type.

## Open verification items

`MM-001`, `MM-002`, `MM-003`, `MM-D01` - see `BATCH_REPORT.md`.
