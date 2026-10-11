# ZEAM_B_NotifDowntime

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Notification Downtime |
| Module | `rpt_downtime` |
| Batch | 4 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZEAM_B_MaintNotif` |
| Source file | `src/zeam_b_notifdowntime.ddls.asddls` |

## Purpose

One row per notification with a malfunction start: malfunction period, breakdown flag, closed flag and the computed downtime in hours (only when start and end are maintained).

## Keys

- `MaintenanceNotification`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZEAM_B_MaintNotif`.

## Example use case

Basis for downtime / breakdown analysis and for the MTBF / MTTR report.

## Open verification items

`RPT-D01`, `RPT-D02` - see `BATCH_REPORT.md`.
