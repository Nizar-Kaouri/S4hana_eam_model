# ZQMV_R_QualityNotif

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Quality Notification - Cube |
| Module | `quality_notification` |
| Batch | 3 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZQMV_I_QualityNotif` |
| Source file | `src/zqmv_r_qualitynotif.ddls.asddls` |

## Purpose

Quality notification cube: all and open notifications per type, plant, material, supplier, customer and month.

## Keys

- `QualityNotification`

## Associations defined here

- `_QualityNotification` → `ZQMV_I_QualityNotif` [1..1]

## Access control

Role inherits the conditions of `ZQMV_I_QualityNotif`.

## Example use case

Supplier complaints per month; open customer complaints per plant.

## Open verification items

none
