# ZFIV_B_Customer

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Customer |
| Module | `customer` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_Customer` |
| Source file | `src/zfiv_b_customer.ddls.asddls` |

## Purpose

One row per customer: name, account group, country, city, postal code, authorization group, posting block and creation date; dimension for receivables and sales.

## Keys

- `Customer`

## Associations defined here

- none

## Access control

Role inherits the conditions of `I_Customer`.

## Example use case

Receivables per customer country; blocked customers.

## Open verification items

`FI-030`, `FI-D04` - see `BATCH_REPORT.md`.
