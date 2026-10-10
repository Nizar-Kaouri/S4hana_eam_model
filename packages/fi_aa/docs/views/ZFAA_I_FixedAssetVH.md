# ZFAA_I_FixedAssetVH

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Fixed Asset - Value Help |
| Module | `fixed_asset` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #VALUE_HELP |
| Data source | `ZFAA_I_FixedAsset` |
| Source file | `src/zfaa_i_fixedassetvh.ddls.asddls` |

## Purpose

Searchable value help for fixed assets (company code, asset number, subnumber, description).

## Keys

- `CompanyCode`
- `MasterFixedAsset`
- `FixedAsset`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZFAA_I_FixedAsset`.

## Example use case

Value help for MasterFixedAsset / FixedAsset in asset reports or in the EAM bridge later.

## Open verification items

none
