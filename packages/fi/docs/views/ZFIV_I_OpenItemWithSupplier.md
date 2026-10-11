# ZFIV_I_OpenItemWithSupplier

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Open Items with Supplier |
| Module | link: `open_items` + `supplier` |
| Batch | 2 |
| Layer | link (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZFIV_I_OpenItemAging` |
| Source file | `src/zfiv_i_openitemwithsupplier.ddls.asddls` |

## Purpose

Open payables aging enriched with supplier master data (country, account group, name via the dimension).

## Keys

- `CompanyCode`
- `FiscalYear`
- `AccountingDocument`
- `AccountingDocumentItem`

## Associations defined here

- `_Supplier` → `ZFIV_B_Supplier` [0..1]

## Access control

Role inherits the conditions of `ZFIV_I_OpenItemAging`.

## Example use case

Payables aging per country and supplier.

## Open verification items

none
