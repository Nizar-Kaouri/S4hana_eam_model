# ZFAA_C_AssetBalanceAssetQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Asset Balance by Asset Class |
| Module | link: `fixed_asset` + `rpt_asset_balance` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZFAA_R_AssetBalanceWithAsset` |
| Source file | `src/zfaa_c_assetbalanceassetq.ddls.asddls` |

## Purpose

Asset balance report at a key date: net book value, acquisitions and depreciation to date per company code and asset class, with cost center, plant and the individual asset as drill-downs.

## Parameters

- `P_KeyDate` : `abap.dats`

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query (link); authorization is enforced by the DCL of its provider cube (see GEN-Q01).

## Example use case

Year-end asset balance per asset class (enter the key date, e.g. the last day of the fiscal year).

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
