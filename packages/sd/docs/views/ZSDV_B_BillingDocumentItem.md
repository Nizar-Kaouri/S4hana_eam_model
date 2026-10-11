# ZSDV_B_BillingDocumentItem

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Billing Document Item |
| Module | `billing_document` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_BillingDocumentItem` |
| Source file | `src/zsdv_b_billingdocumentitem.ddls.asddls` |

## Purpose

One row per billing item: material, material group, plant, billed quantity, net value, reference sales order item and profit center.

## Keys

- `BillingDocument`
- `BillingDocumentItem`

## Associations defined here

- `_BillingDocument` → `ZSDV_B_BillingDocument` [1..1]

## Access control

Role inherits the conditions of `I_BillingDocumentItem`.

## Example use case

Revenue per material group and profit center.

## Open verification items

`SD-022`, `SD-D06` - see `BATCH_REPORT.md`.
