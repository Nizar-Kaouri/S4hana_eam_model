# ZFAA_R_FixedAsset

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Fixed Asset - Cube |
| Module | `fixed_asset` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZFAA_I_FixedAsset` |
| Source file | `src/zfaa_r_fixedasset.ddls.asddls` |

## Purpose

Asset register cube: number of assets, active and deactivated assets, by company code, asset class, capitalization year, cost center and plant.

## Keys

- `CompanyCode`
- `MasterFixedAsset`
- `FixedAsset`

## Associations defined here

- `_FixedAsset` → `ZFAA_I_FixedAsset` [1..1]

## Access control

Role inherits the conditions of `ZFAA_I_FixedAsset`.

## Example use case

Number of active assets per asset class and plant; assets capitalized per year.

## Open verification items

none
