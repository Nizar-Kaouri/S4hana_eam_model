# ZBRG_I_EquipmentWithAsset

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment with Fixed Asset |
| Module | bridge: `eam:equipment` + `fi_aa:fixed_asset` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZEAM_I_Equipment` |
| Source file | `src/zbrg_i_equipmentwithasset.ddls.asddls` |

## Purpose

Equipment assigned to a fixed asset, with the asset's class, capitalization date and active flag and an association to the asset master.

## Keys

- `Equipment`

## Associations defined here

- `_FixedAsset` → `ZFAA_I_FixedAsset` [0..1]

## Access control

Role inherits the conditions of `ZEAM_I_Equipment`.

## Example use case

Which equipment belongs to which asset; equipment whose asset is already deactivated.

## Open verification items

`BRG-001` - see `BATCH_REPORT.md`.
