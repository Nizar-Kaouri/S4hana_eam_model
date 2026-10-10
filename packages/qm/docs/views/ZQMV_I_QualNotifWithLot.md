# ZQMV_I_QualNotifWithLot

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Quality Notification with Inspection Lot |
| Module | link: `inspection_lot` + `quality_notification` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZQMV_I_QualityNotif` |
| Source file | `src/zqmv_i_qualnotifwithlot.ddls.asddls` |

## Purpose

Quality notification with its inspection lot (origin and usage decision via path expressions).

## Keys

- `QualityNotification`

## Associations defined here

- `_InspectionLot` → `ZQMV_I_InspectionLot` [0..1]

## Access control

Role inherits the conditions of `ZQMV_I_QualityNotif`.

## Example use case

Supplier complaints with the usage decision of the underlying goods-receipt lot.

## Open verification items

none
