# ZMMV_I_GoodsMovement

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Goods Movement - Cube |
| Module | `goods_movement` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZMMV_B_GoodsMovement` |
| Source file | `src/zmmv_i_goodsmovement.ddls.asddls` |

## Purpose

Goods movement cube: receipt and issue quantities and values per material, plant, movement type and month.

## Keys

- `MaterialDocumentYear`
- `MaterialDocument`
- `MaterialDocumentItem`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZMMV_B_GoodsMovement`.

## Example use case

Monthly issue value per plant and movement type; receipts per supplier.

## Open verification items

none
