# ZQMV_C_QualityNotifQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Quality Notification Analysis |
| Module | `quality_notification` |
| Batch | 3 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZQMV_R_QualityNotif` |
| Source file | `src/zqmv_c_qualitynotifq.ddls.asddls` |

## Purpose

Analytical query on ZQMV_R_QualityNotif: notifications per plant and type.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZQMV_R_QualityNotif (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
