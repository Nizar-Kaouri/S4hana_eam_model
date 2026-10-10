# ZFIV_I_GLAccount

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | G/L Account |
| Module | `gl_account` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_GLAccountInChartOfAccounts` |
| Source file | `src/zfiv_i_glaccount.ddls.asddls` |

## Purpose

One row per G/L account in a chart of accounts: account type (balance sheet, P&L, primary / secondary costs), account group, balance-sheet flag and deletion flag; dimension for journal cubes.

## Keys

- `ChartOfAccounts`
- `GLAccount`

## Associations defined here

- `_Text` → `ZFIV_I_GLAccountText` [0..*]

## Access control

Role inherits the conditions of `I_GLAccountInChartOfAccounts`.

## Example use case

Balances per account group; P&L accounts only.

## Open verification items

`FI-001`, `FI-D01` - see `BATCH_REPORT.md`.
