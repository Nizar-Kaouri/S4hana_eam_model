# ZBRG_I_EquipmentAssetValue

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment with Asset Net Book Value |
| Module | bridge: `eam:equipment` + `fi_aa:rpt_asset_balance` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZEAM_B_Equipment`, join `ZFAA_I_AssetBalance` |
| Source file | `src/zbrg_i_equipmentassetvalue.ddls.asddls` |

## Purpose

Net book value, acquisitions and depreciation to date (key date parameter) of the fixed asset behind each equipment.

## Parameters

- `P_KeyDate` : `abap.dats`

## Keys

- `Equipment`
- `Ledger`
- `AssetDepreciationArea`
- `CompanyCodeCurrency`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZEAM_B_Equipment` and `ZFAA_I_AssetBalance`.

## Example use case

Net book value of the installed base per equipment category and plant; old equipment with zero book value.

## Open verification items

`BRG-002`, `BRG-D01` - see `BATCH_REPORT.md`.
