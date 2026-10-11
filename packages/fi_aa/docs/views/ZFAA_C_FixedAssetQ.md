# ZFAA_C_FixedAssetQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Asset Register Analysis |
| Module | `fixed_asset` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZFAA_I_FixedAsset` |
| Source file | `src/zfaa_c_fixedassetq.ddls.asddls` |

## Purpose

Analytical query on ZFAA_I_FixedAsset. Number of (active) assets per company code and asset class.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZFAA_I_FixedAsset (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
