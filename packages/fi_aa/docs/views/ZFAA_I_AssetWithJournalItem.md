# ZFAA_I_AssetWithJournalItem

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Fixed Asset with Journal Items |
| Module | link: `asset_transaction` + `fixed_asset` |
| Batch | 2 |
| Layer | link (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZFAA_I_FixedAsset` |
| Source file | `src/zfaa_i_assetwithjournalitem.ddls.asddls` |

## Purpose

Fixed asset with a to-many association to all Universal Journal line items posted on it.

## Keys

- `CompanyCode`
- `MasterFixedAsset`
- `FixedAsset`

## Associations defined here

- `_JournalItem` → `ZFAA_I_AssetJournalItem` [0..*]

## Access control

Role inherits the conditions of `ZFAA_I_FixedAsset`.

## Example use case

Asset history in an object page: acquisitions, depreciation and retirements of one asset.

## Open verification items

none
