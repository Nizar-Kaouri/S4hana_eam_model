# ZMMV_R_OpenPurchaseOrder

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Open Purchase Order Items |
| Module | `rpt_open_purchase_order` |
| Batch | 4 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZMMV_I_PurchaseOrderItem` |
| Source file | `src/zmmv_r_openpurchaseorder.ddls.asddls` |

## Purpose

Open purchase order items: open value, number of open items, order age and age bucket per supplier and purchasing group.

## Keys

- `PurchaseOrder`
- `PurchaseOrderItem`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZMMV_I_PurchaseOrderItem`.

## Example use case

Purchase orders older than 90 days that are still not delivered, per supplier.

## Open verification items

`MM-R02` - see `BATCH_REPORT.md`.
