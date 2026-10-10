# ZEAM_R_MaintNotif

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Notification - Cube |
| Module | `maintenance_notification` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZEAM_I_MaintNotif` |
| Source file | `src/zeam_r_maintnotif.ddls.asddls` |

## Purpose

Notification cube with counters for all, open and breakdown notifications.

## Keys

- `MaintenanceNotification`

## Associations defined here

- `_MaintenanceNotification` → `ZEAM_I_MaintNotif` [1..1]

## Access control

Role inherits the conditions of `ZEAM_I_MaintNotif`.

## Example use case

Open breakdown notifications per planning plant and priority; notification intake per month.

## Open verification items

`NT-R01` - see `BATCH_REPORT.md`.
