# ZEAM_I_MaintNotifCause

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Notification Cause - Cube |
| Module | `notification_item` |
| Batch | 5 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZEAM_B_MaintNotifCause` |
| Source file | `src/zeam_i_maintnotifcause.ddls.asddls` |

## Purpose

Cause analysis: number of causes per cause code, with item damage code and notification header characteristics.

## Keys

- `MaintenanceNotification`
- `MaintenanceNotificationItem`
- `MaintenanceNotificationCause`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZEAM_B_MaintNotifCause`.

## Example use case

Root-cause Pareto per planning plant; causes of breakdown notifications only.

## Open verification items

none
