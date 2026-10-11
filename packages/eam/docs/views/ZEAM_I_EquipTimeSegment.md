# ZEAM_I_EquipTimeSegment

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment Installation History - Cube |
| Module | `equipment_history` |
| Batch | 5 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZEAM_B_EquipmentTimeSegment` |
| Source file | `src/zeam_i_equiptimesegment.ddls.asddls` |

## Purpose

Installation history cube: equipment time segments with segment duration in days (open segment counted up to today) by functional location, plant and cost center.

## Keys

- `Equipment`
- `ValidityEndDate`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZEAM_B_EquipmentTimeSegment`.

## Example use case

Equipment-days per functional location in a year; average installation duration per equipment category.

## Open verification items

`EH-R01` - see `BATCH_REPORT.md`.
