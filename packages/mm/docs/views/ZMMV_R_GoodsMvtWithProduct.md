# ZMMV_R_GoodsMvtWithProduct

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Goods Movement with Product |
| Module | link: `goods_movement` + `product` |
| Batch | 2 |
| Layer | link (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZMMV_R_GoodsMovement` |
| Source file | `src/zmmv_r_goodsmvtwithproduct.ddls.asddls` |

## Purpose

Goods movement cube enriched with product master data (type, group, texts via the product dimension).

## Keys

- `MaterialDocumentYear`
- `MaterialDocument`
- `MaterialDocumentItem`

## Associations defined here

- `_Product` → `ZMMV_I_Product` [0..1]

## Access control

Role inherits the conditions of `ZMMV_R_GoodsMovement`.

## Example use case

Issue value per product group and month.

## Open verification items

none
