# ZEMX_C_MaintNotifMigCount

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Open notification count (migration) |
| Module | `maintenance_notification` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_C_MaintNotificationMig` |
| Source file | `src/zemx_c_maintnotifmigcount.ddls.asddls` |

## Purpose

Record count of the open maintenance notifications delivered by ZEMX_C_MaintNotificationMig per NotificationType, MaintenancePlanningPlant; compared with the same count on S/4HANA by tools/mig_reconcile.py.

## Keys

- `NotificationType`
- `MaintenancePlanningPlant`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export this view before the load and the S/4HANA count view after it; the reconcile tool lists every NotificationType / MaintenancePlanningPlant combination whose counts differ.

## Open verification items

none
