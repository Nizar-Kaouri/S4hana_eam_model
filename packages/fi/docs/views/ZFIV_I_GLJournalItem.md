# ZFIV_I_GLJournalItem

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | G/L Journal Item |
| Module | `gl_line_item` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_JournalEntryItem` |
| Source file | `src/zfiv_i_gljournalitem.ddls.asddls` |

## Purpose

Universal Journal line items of all ledgers: G/L account, period, dates, document type, debit / credit indicator, account type, profit center, segment, business and functional area, cost center, supplier, customer, reversal flags and amounts in company code, global and transaction currency.

## Keys

- `SourceLedger`
- `CompanyCode`
- `FiscalYear`
- `AccountingDocument`
- `LedgerGLLineItem`
- `Ledger`

## Associations defined here

- none

## Access control

Role inherits the conditions of `I_JournalEntryItem`.

## Example use case

Trial balance per company code and period; postings per supplier and account.

## Open verification items

`FI-010`, `FI-011`, `FI-D02` - see `BATCH_REPORT.md`.
