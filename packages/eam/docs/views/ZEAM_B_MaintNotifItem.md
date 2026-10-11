# ZEAM_B_MaintNotifItem

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Notification Item |
| Module | `notification_item` |
| Batch | 5 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_MaintenanceNotificationItem` |
| Source file | `src/zeam_b_maintnotifitem.ddls.asddls` |

## Purpose

One row per notification item with object part and damage codes (catalog code group + code) and item text.

## Keys

- `MaintenanceNotification`
- `MaintenanceNotificationItem`

## Associations defined here

- `_MaintenanceNotification` → `ZEAM_B_MaintNotif` [1..1]

## Access control

Role inherits the conditions of `I_MaintenanceNotificationItem`.

## Example use case

Pareto of damage codes per equipment category (with the link cube) or per planning plant.

## Open verification items

`NI-001`, `NI-002`, `NI-D01` - see `BATCH_REPORT.md`.
