# ZFAA_R_AssetTransWithAsset

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Asset Transaction with Asset Master |
| Module | link: `asset_transaction` + `fixed_asset` |
| Batch | 2 |
| Layer | link (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZFAA_R_AssetTransaction` |
| Source file | `src/zfaa_r_assettranswithasset.ddls.asddls` |

## Purpose

Asset transaction cube enriched with fixed asset master data: foreign key to the asset dimension (navigation attributes) and asset class, capitalization year and plant as characteristics.

## Keys

- `SourceLedger`
- `CompanyCode`
- `FiscalYear`
- `AccountingDocument`
- `LedgerGLLineItem`
- `Ledger`

## Associations defined here

- `_FixedAsset` → `ZFAA_I_FixedAsset` [0..1]

## Access control

Role inherits the conditions of `ZFAA_R_AssetTransaction`.

## Example use case

Acquisitions (capex) per asset class and plant; depreciation per asset class and period.

## Open verification items

none
