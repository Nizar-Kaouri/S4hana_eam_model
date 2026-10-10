# ZFIV_R_OpenItemAging

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Open Item Aging - Cube |
| Module | `open_items` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZFIV_I_OpenItem` |
| Source file | `src/zfiv_r_openitemaging.ddls.asddls` |

## Purpose

Aging cube for open payables and receivables: open and overdue amount, number of items, maximum days overdue and aging bucket per company code, account type, supplier and customer.

## Keys

- `CompanyCode`
- `FiscalYear`
- `AccountingDocument`
- `AccountingDocumentItem`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZFIV_I_OpenItem`.

## Example use case

Receivables aging per customer (buckets 1-30, 31-60, 61-90, >90 days).

## Open verification items

none
