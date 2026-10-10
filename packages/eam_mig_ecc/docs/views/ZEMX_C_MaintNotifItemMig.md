# ZEMX_C_MaintNotifItemMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Notification item (migration) |
| Module | `maintenance_notification` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_MaintNotifItem` |
| Source file | `src/zemx_c_maintnotifitemmig.ddls.asddls` |

## Purpose

Items of the open notifications with code groups and codes.

## Keys

- `MaintenanceNotification`
- `MaintNotificationItem`

## Associations defined here

- `_MaintNotification` → `ZEMX_I_MaintNotification` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

The load program adds the items to the notification created from ZEMX_C_MaintNotificationMig.

## Open verification items

none
