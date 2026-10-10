# ZBRG_R_RevenueWithCustomer

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Revenue with Customer |
| Module | bridge: `fi:customer` + `sd:billing_document` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZSDV_R_Revenue` |
| Source file | `src/zbrg_r_revenuewithcustomer.ddls.asddls` |

## Purpose

Revenue cube enriched with the customer master of the FI product (country, account group, name via the dimension).

## Keys

- `BillingDocument`
- `BillingDocumentItem`

## Associations defined here

- `_Customer` → `ZFIV_I_Customer` [0..1]

## Access control

Role inherits the conditions of `ZSDV_R_Revenue`.

## Example use case

Revenue per customer country and account group.

## Open verification items

none
