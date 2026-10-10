# ZSDV_I_BillingDocument

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Billing Document |
| Module | `billing_document` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_BillingDocument` |
| Source file | `src/zsdv_i_billingdocument.ddls.asddls` |

## Purpose

One row per billing document: type, document category (invoice, credit memo, cancellation), date, sold-to party, payer, sales area, company code, net value, cancellation flag and accounting document.

## Keys

- `BillingDocument`

## Associations defined here

- `_CompanyCode` → `I_CompanyCode` [0..1]

## Access control

Role inherits the conditions of `I_BillingDocument`.

## Example use case

Revenue per sales organization and month; cancelled invoices.

## Open verification items

`SD-020`, `SD-021`, `SD-D05` - see `BATCH_REPORT.md`.
