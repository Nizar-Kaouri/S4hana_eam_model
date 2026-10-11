# ZSDV_I_OpenSalesOrder

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Open Sales Order Items |
| Module | `rpt_open_sales_orders` |
| Batch | 3 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZSDV_B_SalesOrderItem` |
| Source file | `src/zsdv_i_opensalesorder.ddls.asddls` |

## Purpose

Open sales order items: open value, quantity, number of items, items past the requested delivery date, order age and age bucket per sales area and customer.

## Keys

- `SalesDocument`
- `SalesDocumentItem`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZSDV_B_SalesOrderItem`.

## Example use case

Order backlog per sales organization; customers with overdue orders.

## Open verification items

`SD-R02` - see `BATCH_REPORT.md`.
