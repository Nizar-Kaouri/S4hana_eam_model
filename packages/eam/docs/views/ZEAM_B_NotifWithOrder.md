# ZEAM_B_NotifWithOrder

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Notification with Maintenance Order |
| Module | link: `maintenance_notification` + `maintenance_order` |
| Batch | 2 |
| Layer | link (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZEAM_B_MaintNotif` |
| Source file | `src/zeam_b_notifwithorder.ddls.asddls` |

## Purpose

Notifications that have a maintenance order assigned, with order type, open flag and dates of that order (path expressions) and an association to the order.

## Keys

- `MaintenanceNotification`

## Associations defined here

- `_MaintenanceOrder` → `ZEAM_B_MaintOrder` [0..1]

## Access control

Role inherits the conditions of `ZEAM_B_MaintNotif`.

## Example use case

Lead time from notification creation to order creation; notifications whose order is still open.

## Open verification items

`LNK-003` - see `BATCH_REPORT.md`.
