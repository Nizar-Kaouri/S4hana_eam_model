# ZFAA_C_AssetTransactionQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Asset Transaction Analysis |
| Module | `asset_transaction` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZFAA_R_AssetTransaction` |
| Source file | `src/zfaa_c_assettransactionq.ddls.asddls` |

## Purpose

Analytical query on ZFAA_R_AssetTransaction. Acquisitions, retirements, transfers and depreciation per company code and period.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZFAA_R_AssetTransaction (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
