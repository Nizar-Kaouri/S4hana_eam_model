# ZMMV_I_GoodsMovement

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Goods Movement |
| Module | `goods_movement` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_MaterialDocumentItem_2` |
| Source file | `src/zmmv_i_goodsmovement.ddls.asddls` |

## Purpose

One row per material document item: movement type, debit/credit indicator, quantity in base unit, value in company code currency and the account assignment (cost center, order, purchase order).

## Keys

- `MaterialDocumentYear`
- `MaterialDocument`
- `MaterialDocumentItem`

## Associations defined here

- `_Plant` → `I_Plant` [0..1]

## Access control

Role inherits the conditions of `I_MaterialDocumentItem_2`.

## Example use case

Goods issues to maintenance orders; goods receipts per supplier and month.

## Open verification items

`MM-020`, `MM-021`, `MM-022`, `MM-D04` - see `BATCH_REPORT.md`.
