# ZFAA_I_FixedAsset

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Fixed Asset |
| Module | `fixed_asset` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_FixedAsset` |
| Source file | `src/zfaa_i_fixedasset.ddls.asddls` |

## Purpose

One row per fixed asset (asset main number + subnumber) with asset class, description, capitalization / deactivation date and organizational assignment (cost center, plant, profit center); analytical dimension for every cube that references an asset.

## Keys

- `CompanyCode`
- `MasterFixedAsset`
- `FixedAsset`

## Associations defined here

- `_CompanyCode` → `I_CompanyCode` [0..1]
- `_AssetClass` → `I_AssetClass` [0..1]
- `_Plant` → `I_Plant` [0..1]

## Access control

Role inherits the conditions of `I_FixedAsset`.

## Example use case

Asset register per company code and asset class; asset attributes next to journal values.

## Open verification items

`FA-001`, `FA-002`, `FA-003`, `FA-004`, `FA-005`, `FA-D01` - see `BATCH_REPORT.md`.
