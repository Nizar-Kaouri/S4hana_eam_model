# ZFAA_I_AssetBalance

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Asset Net Book Value at Key Date |
| Module | `rpt_asset_balance` |
| Batch | 3 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZFAA_B_AssetJournalItem` |
| Source file | `src/zfaa_i_assetbalance.ddls.asddls` |

## Purpose

Net book value per fixed asset, ledger and depreciation area at a key date (parameter): sum of all balance-sheet postings on the asset up to the key date, plus cumulative acquisitions and depreciation on balance-sheet accounts.

## Parameters

- `P_KeyDate` : `abap.dats`

## Keys

- `CompanyCode`
- `MasterFixedAsset`
- `FixedAsset`
- `Ledger`
- `AssetDepreciationArea`
- `CompanyCodeCurrency`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZFAA_B_AssetJournalItem`.

## Example use case

Net book value per asset class at fiscal year end (with the link cube); assets fully depreciated.

## Open verification items

`AB-D01`, `AB-R01`, `AB-R02` - see `BATCH_REPORT.md`.
