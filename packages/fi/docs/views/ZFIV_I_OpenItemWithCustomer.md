# ZFIV_I_OpenItemWithCustomer

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Open Items with Customer |
| Module | link: `customer` + `open_items` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZFIV_I_OpenItemAging` |
| Source file | `src/zfiv_i_openitemwithcustomer.ddls.asddls` |

## Purpose

Open receivables aging enriched with customer master data (country, account group, name via the dimension).

## Keys

- `CompanyCode`
- `FiscalYear`
- `AccountingDocument`
- `AccountingDocumentItem`

## Associations defined here

- `_Customer` → `ZFIV_B_Customer` [0..1]

## Access control

Role inherits the conditions of `ZFIV_I_OpenItemAging`.

## Example use case

Receivables aging per country and customer.

## Open verification items

none
