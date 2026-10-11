# ZMMV_B_PurchaseOrderItem

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Purchase Order Item |
| Module | `purchase_order` |
| Batch | 3 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_PurchaseOrderItemAPI01` |
| Source file | `src/zmmv_b_purchaseorderitem.ddls.asddls` |

## Purpose

One row per purchase order item: material, plant, quantity, net price and net amount, delivery and invoice completion, deletion code and a derived open flag.

## Keys

- `PurchaseOrder`
- `PurchaseOrderItem`

## Associations defined here

- `_PurchaseOrder` → `ZMMV_B_PurchaseOrder` [1..1]
- `_Plant` → `I_Plant` [0..1]

## Access control

Role inherits the conditions of `I_PurchaseOrderItemAPI01`.

## Example use case

Open purchase order items per plant; order value per material group.

## Open verification items

`MM-043`, `MM-044`, `MM-045`, `MM-D07` - see `BATCH_REPORT.md`.
