# ZFIV_R_GLItemWithAccount

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | G/L Line Item with G/L Account |
| Module | link: `gl_account` + `gl_line_item` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZFIV_R_GLJournalItem` |
| Source file | `src/zfiv_r_glitemwithaccount.ddls.asddls` |

## Purpose

G/L cube enriched with G/L account master data (account type, group, balance-sheet flag, texts via the dimension).

## Keys

- `SourceLedger`
- `CompanyCode`
- `FiscalYear`
- `AccountingDocument`
- `LedgerGLLineItem`
- `Ledger`

## Associations defined here

- `_GLAccount` → `ZFIV_I_GLAccount` [0..1]

## Access control

Role inherits the conditions of `ZFIV_R_GLJournalItem`.

## Example use case

Balance sheet vs. P&L totals per company code; balances per account group.

## Open verification items

none
