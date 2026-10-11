# ZEAM_I_DowntimeWithTechObj

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Downtime with Technical Object |
| Module | link: `equipment` + `functional_location` + `rpt_downtime` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZEAM_I_NotifDowntime` |
| Source file | `src/zeam_i_downtimewithtechobj.ddls.asddls` |

## Purpose

Downtime cube enriched with technical object master data (foreign keys to equipment and functional location dimensions plus equipment category, ABC indicator, manufacturer, location category).

## Keys

- `MaintenanceNotification`

## Associations defined here

- `_Equipment` → `ZEAM_B_Equipment` [0..1]
- `_FunctionalLocation` → `ZEAM_B_FuncLoc` [0..1]

## Access control

Role inherits the conditions of `ZEAM_I_NotifDowntime`.

## Example use case

Breakdown hours per equipment category and manufacturer; downtime of ABC-class A equipment.

## Open verification items

none
