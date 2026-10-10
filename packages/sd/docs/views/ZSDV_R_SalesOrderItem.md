# ZSDV_R_SalesOrderItem

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Sales Order Item - Cube |
| Module | `sales_order` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZSDV_I_SalesOrderItem` |
| Source file | `src/zsdv_r_salesorderitem.ddls.asddls` |

## Purpose

Sales order item cube: order value, quantity and number of (open) items per sales area, sold-to party, material and plant.

## Keys

- `SalesDocument`
- `SalesDocumentItem`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZSDV_I_SalesOrderItem`.

## Example use case

Order intake per sales organization and month; open order value per customer.

## Open verification items

none
