# ZEMX_C_MaintNotificationMig

> Version **1.0.0**

| | |
|---|---|
| Description | Maintenance notification (migration) |
| Module | `maintenance_notification` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_MaintNotification` |
| Source file | `src/zemx_c_maintnotificationmig.ddls.asddls` |

## Purpose

Open notifications (not completed, not deleted).

## Keys

- `MaintenanceNotification`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

The load program creates one notification per row.
