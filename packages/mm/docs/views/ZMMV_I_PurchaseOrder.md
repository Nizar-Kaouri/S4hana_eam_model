# ZMMV_I_PurchaseOrder

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Purchase Order |
| Module | `purchase_order` |
| Batch | 3 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_PurchaseOrderAPI01` |
| Source file | `src/zmmv_i_purchaseorder.ddls.asddls` |

## Purpose

One row per purchase order header: type, supplier, purchasing organization and group, company code, order date, currency and processing status; dimension for the item cube.

## Keys

- `PurchaseOrder`

## Associations defined here

- `_Supplier` → `I_Supplier` [0..1]
- `_CompanyCode` → `I_CompanyCode` [0..1]

## Access control

Role inherits the conditions of `I_PurchaseOrderAPI01`.

## Example use case

Purchase orders per supplier and purchasing group; order header attributes in item analyses.

## Open verification items

`MM-040`, `MM-041`, `MM-042`, `MM-D06` - see `BATCH_REPORT.md`.
