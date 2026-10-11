# ZEAM_I_MaintNotifItem

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Notification Item (Damage) - Cube |
| Module | `notification_item` |
| Batch | 5 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZEAM_B_MaintNotifItem` |
| Source file | `src/zeam_i_maintnotifitem.ddls.asddls` |

## Purpose

Damage analysis: number of notification items per object part and damage code, with notification header characteristics.

## Keys

- `MaintenanceNotification`
- `MaintenanceNotificationItem`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZEAM_B_MaintNotifItem`.

## Example use case

Damage-code Pareto per planning plant and notification type.

## Open verification items

none
