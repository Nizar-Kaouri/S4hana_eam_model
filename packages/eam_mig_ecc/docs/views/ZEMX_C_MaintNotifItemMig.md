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

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

The load program adds the items to the notification created from ZEMX_C_MaintNotificationMig.

## Open verification items

none
