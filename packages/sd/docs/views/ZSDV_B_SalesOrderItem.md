# ZSDV_B_SalesOrderItem

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Sales Order Item |
| Module | `sales_order` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_SalesDocumentItem` |
| Source file | `src/zsdv_b_salesorderitem.ddls.asddls` |

## Purpose

One row per sales order item: item category, material, material group, plant, order quantity, net value, processing status, rejection reason and a derived open flag.

## Keys

- `SalesDocument`
- `SalesDocumentItem`

## Associations defined here

- `_SalesOrder` → `ZSDV_B_SalesOrder` [1..1]
- `_Plant` → `I_Plant` [0..1]

## Access control

Role inherits the conditions of `I_SalesDocumentItem`.

## Example use case

Order value per material group; open items per plant.

## Open verification items

`SD-004`, `SD-D02` - see `BATCH_REPORT.md`.
