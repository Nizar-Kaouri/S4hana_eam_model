# ZFAA_B_AssetJournalItem

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Fixed Asset Journal Item |
| Module | `asset_transaction` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_JournalEntryItem` |
| Source file | `src/zfaa_b_assetjournalitem.ddls.asddls` |

## Purpose

Universal Journal line items that carry a fixed asset, with ledger, depreciation area, asset transaction type, G/L account and account type, amounts in company code and global currency, and a derived value category (acquisition, retirement, transfer, depreciation, other).

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

Acquisitions and depreciation per asset class and period; basis for the net book value report.

## Open verification items

`AT-001`, `AT-002`, `AT-003`, `AT-004`, `AT-005`, `AT-D01` - see `BATCH_REPORT.md`.
