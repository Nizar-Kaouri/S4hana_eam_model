# ZQMV_I_InspLotWithQualNotif

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Inspection Lot with Quality Notifications |
| Module | link: `inspection_lot` + `quality_notification` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZQMV_I_InspectionLot` |
| Source file | `src/zqmv_i_insplotwithqualnotif.ddls.asddls` |

## Purpose

Inspection lot with a to-many association to the quality notifications created for it (defects recorded from results recording).

## Keys

- `InspectionLot`

## Associations defined here

- `_QualityNotification` → `ZQMV_I_QualityNotif` [0..*]

## Access control

Role inherits the conditions of `ZQMV_I_InspectionLot`.

## Example use case

Rejected lots and the complaints that followed.

## Open verification items

none
