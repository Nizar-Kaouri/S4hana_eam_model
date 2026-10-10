# ZCOV_I_COJournalItem

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Controlling Journal Item |
| Module | `cost_actuals` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_JournalEntryItem` |
| Source file | `src/zcov_i_cojournalitem.ddls.asddls` |

## Purpose

Universal Journal line items with a controlling area: cost center, order, WBS element, profit center, segment, functional area, G/L account (cost element) and its account type, period and amounts.

## Keys

- `SourceLedger`
- `CompanyCode`
- `FiscalYear`
- `AccountingDocument`
- `LedgerGLLineItem`
- `Ledger`

## Associations defined here

- `_GLAccountInChartOfAccounts` → `I_GLAccountInChartOfAccounts` [0..1]

## Access control

Role inherits the conditions of `I_JournalEntryItem`.

## Example use case

Primary costs per cost center and cost element; internal activity allocations (secondary costs).

## Open verification items

`CO-030`, `CO-031`, `CO-D04` - see `BATCH_REPORT.md`.
