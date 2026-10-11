# ZFAA_I_AssetTransaction

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Asset Transaction - Cube |
| Module | `asset_transaction` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZFAA_B_AssetJournalItem` |
| Source file | `src/zfaa_i_assettransaction.ddls.asddls` |

## Purpose

Asset transaction cube: journal amounts split into acquisitions, retirements, transfers and depreciation, by company code, ledger, depreciation area, period and G/L account.

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

Role inherits the conditions of `ZFAA_B_AssetJournalItem`.

## Example use case

Depreciation posted per period and depreciation area; acquisitions per year (capex view).

## Open verification items

`AT-R01` - see `BATCH_REPORT.md`.
