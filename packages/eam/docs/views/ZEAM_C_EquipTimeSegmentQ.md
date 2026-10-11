# ZEAM_C_EquipTimeSegmentQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment Installation History |
| Module | `equipment_history` |
| Batch | 5 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZEAM_I_EquipTimeSegment` |
| Source file | `src/zeam_c_equiptimesegmentq.ddls.asddls` |

## Purpose

Analytical query on ZEAM_I_EquipTimeSegment. Installation history (equipment-days) per functional location and equipment category.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZEAM_I_EquipTimeSegment (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
