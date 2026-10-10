# ZMMV_R_Product

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Product - Cube |
| Module | `product` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZMMV_I_Product` |
| Source file | `src/zmmv_r_product.ddls.asddls` |

## Purpose

Material master cube: number of products per type, group and status.

## Keys

- `Product`

## Associations defined here

- `_Product` → `ZMMV_I_Product` [1..1]

## Access control

Role inherits the conditions of `ZMMV_I_Product`.

## Example use case

Number of spare-part materials per product group; materials flagged for deletion.

## Open verification items

none
