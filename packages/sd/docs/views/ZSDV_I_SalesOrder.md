# ZSDV_I_SalesOrder

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Sales Order |
| Module | `sales_order` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_SalesDocument` |
| Source file | `src/zsdv_i_salesorder.ddls.asddls` |

## Purpose

One row per sales order (document category C): order type, sales area, sold-to party, dates, customer reference, net value, overall processing / delivery / billing status and a derived open flag.

## Keys

- `SalesDocument`

## Associations defined here

- `_SoldToParty` → `I_Customer` [0..1]

## Access control

Role inherits the conditions of `I_SalesDocument`.

## Example use case

Open sales orders per sales organization; order intake per sold-to party.

## Open verification items

`SD-001`, `SD-002`, `SD-003`, `SD-D01` - see `BATCH_REPORT.md`.
