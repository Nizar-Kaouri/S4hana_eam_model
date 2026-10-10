# ZSDV_I_SOItemWithBilling

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Sales Order Item with Billing Items |
| Module | link: `billing_document` + `sales_order` |
| Batch | 2 |
| Layer | link (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZSDV_I_SalesOrderItem` |
| Source file | `src/zsdv_i_soitemwithbilling.ddls.asddls` |

## Purpose

Sales order item with a to-many association to the billing items that reference it.

## Keys

- `SalesDocument`
- `SalesDocumentItem`

## Associations defined here

- `_BillingItem` → `ZSDV_I_BillingDocumentItem` [0..*]

## Access control

Role inherits the conditions of `ZSDV_I_SalesOrderItem`.

## Example use case

Billed value per order item; orders not yet billed.

## Open verification items

none
