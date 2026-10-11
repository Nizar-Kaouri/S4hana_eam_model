# ZEMX_I_MaintNotifItem

> Version **1.0.0**

| | |
|---|---|
| Description | Maintenance notification item |
| Module | `maintenance_notification` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #FACT |
| Data source | `ZEMX_I_NotificationItemData`, join `ZEMX_I_NotificationMaintData` |
| Source file | `src/zemx_i_maintnotifitem.ddls.asddls` |

## Purpose

Items of PM notifications (restricted to notifications with maintenance data).

## Keys

- `MaintenanceNotification`
- `MaintNotificationItem`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the items of notification 10000001.
