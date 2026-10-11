# ZFIV_I_GLJournalItem

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | G/L Journal Item - Cube |
| Module | `gl_line_item` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZFIV_B_GLJournalItem` |
| Source file | `src/zfiv_i_gljournalitem.ddls.asddls` |

## Purpose

G/L cube: debit, credit and balance per company code, ledger, G/L account, period, profit center and segment.

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

Role inherits the conditions of `ZFIV_B_GLJournalItem`.

## Example use case

Trial balance per company code and period; segment P&L.

## Open verification items

none
