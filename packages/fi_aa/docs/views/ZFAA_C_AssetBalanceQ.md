# ZFAA_C_AssetBalanceQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Asset Net Book Value Analysis |
| Module | `rpt_asset_balance` |
| Batch | 3 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZFAA_R_AssetBalance` |
| Source file | `src/zfaa_c_assetbalanceq.ddls.asddls` |

## Purpose

Net book value query at a key date (parameter) per company code, ledger and depreciation area.

## Parameters

- `P_KeyDate` : `abap.dats`

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZFAA_R_AssetBalance (see GEN-Q01).

## Example use case

Asset balance at fiscal year end per company code; drill down to the individual asset.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
