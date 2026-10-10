# ZQMV_C_InspectionLotQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Inspection Lot Analysis |
| Module | `inspection_lot` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZQMV_R_InspectionLot` |
| Source file | `src/zqmv_c_inspectionlotq.ddls.asddls` |

## Purpose

Analytical query on ZQMV_R_InspectionLot: lots and rejections per plant and origin, with the rejection rate.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZQMV_R_InspectionLot (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01`, `QM-Q01`, `RPT-Q01` - see `BATCH_REPORT.md`.
