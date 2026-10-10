# ZSDV_R_Revenue

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Revenue - Cube |
| Module | `billing_document` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZSDV_I_BillingDocumentItem` |
| Source file | `src/zsdv_r_revenue.ddls.asddls` |

## Purpose

Revenue cube (cancelled documents excluded): signed net revenue, billed quantity and number of items per sales area, customer, material group, profit center and billing date.

## Keys

- `BillingDocument`
- `BillingDocumentItem`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZSDV_I_BillingDocumentItem`.

## Example use case

Monthly revenue per sales organization and material group; top customers by revenue.

## Open verification items

`SD-R01` - see `BATCH_REPORT.md`.
