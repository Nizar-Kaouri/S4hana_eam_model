# ZSDV_B_SalesOrderVH

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Sales Order - Value Help |
| Module | `sales_order` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #VALUE_HELP |
| Data source | `ZSDV_B_SalesOrder` |
| Source file | `src/zsdv_b_salesordervh.ddls.asddls` |

## Purpose

Searchable value help for sales orders (number, customer reference, sold-to party).

## Keys

- `SalesDocument`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZSDV_B_SalesOrder`.

## Example use case

Value help for SalesDocument in delivery and billing analyses.

## Open verification items

none
