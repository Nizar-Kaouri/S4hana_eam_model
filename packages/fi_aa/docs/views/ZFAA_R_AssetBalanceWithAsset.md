# ZFAA_R_AssetBalanceWithAsset

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Asset Net Book Value with Asset Master |
| Module | link: `fixed_asset` + `rpt_asset_balance` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZFAA_R_AssetBalance` |
| Source file | `src/zfaa_r_assetbalancewithasset.ddls.asddls` |

## Purpose

Net book value at a key date (parameter) enriched with fixed asset master data: asset class, cost center, plant, active flag and capitalization date via the asset dimension.

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

- `_FixedAsset` → `ZFAA_I_FixedAsset` [0..1]

## Access control

Role inherits the conditions of `ZFAA_R_AssetBalance`.

## Example use case

Net book value per asset class and cost center at fiscal year end - the classic asset balance report.

## Open verification items

`LNK-101` - see `BATCH_REPORT.md`.
