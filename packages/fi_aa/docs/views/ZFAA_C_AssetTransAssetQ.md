# ZFAA_C_AssetTransAssetQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Asset Transactions by Asset Class |
| Module | link: `asset_transaction` + `fixed_asset` |
| Batch | 2 |
| Layer | link (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZFAA_I_AssetTransWithAsset` |
| Source file | `src/zfaa_c_assettransassetq.ddls.asddls` |

## Purpose

Analytical query on ZFAA_I_AssetTransWithAsset. Acquisitions, retirements, transfers and depreciation per company code and asset class.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query (link); authorization is enforced by the DCL of its provider cube (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
