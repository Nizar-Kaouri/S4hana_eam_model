# ZEAM_I_MaintNotifCause

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Notification Cause |
| Module | `notification_item` |
| Batch | 5 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_MaintenanceNotificationCause` |
| Source file | `src/zeam_i_maintnotifcause.ddls.asddls` |

## Purpose

One row per cause of a notification item with cause code group, cause code and text.

## Keys

- `MaintenanceNotification`
- `MaintenanceNotificationItem`
- `MaintenanceNotificationCause`

## Associations defined here

- `_MaintenanceNotification` → `ZEAM_I_MaintNotif` [1..1]
- `_Item` → `ZEAM_I_MaintNotifItem` [1..1]

## Access control

Role inherits the conditions of `I_MaintenanceNotificationCause`.

## Example use case

Root-cause Pareto (cause codes) per planning plant and notification type.

## Open verification items

`NI-010`, `NI-011`, `NI-D02` - see `BATCH_REPORT.md`.
