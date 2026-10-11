# ZBRG_I_POItemWithSupplier

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Purchase Order Item with Supplier |
| Module | bridge: `fi:supplier` + `mm:purchase_order` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZMMV_I_PurchaseOrderItem` |
| Source file | `src/zbrg_i_poitemwithsupplier.ddls.asddls` |

## Purpose

Purchase order item cube enriched with the supplier master of the FI product (country, account group, name via the dimension).

## Keys

- `PurchaseOrder`
- `PurchaseOrderItem`

## Associations defined here

- `_Supplier` → `ZFIV_B_Supplier` [0..1]

## Access control

Role inherits the conditions of `ZMMV_I_PurchaseOrderItem`.

## Example use case

Purchase volume per supplier country.

## Open verification items

none
