# ZFIV_I_OpenItem

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Open Supplier / Customer Item |
| Module | `open_items` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_OperationalAcctgDocItem` |
| Source file | `src/zfiv_i_openitem.ddls.asddls` |

## Purpose

Uncleared items of supplier (K) and customer (D) accounts: account, special G/L indicator, document type, posting / document / net due date, debit-credit indicator and amount.

## Keys

- `CompanyCode`
- `FiscalYear`
- `AccountingDocument`
- `AccountingDocumentItem`

## Associations defined here

- none

## Access control

Role inherits the conditions of `I_OperationalAcctgDocItem`.

## Example use case

Overdue receivables per customer; payables due next week.

## Open verification items

`FI-040`, `FI-041`, `FI-042`, `FI-D05` - see `BATCH_REPORT.md`.
