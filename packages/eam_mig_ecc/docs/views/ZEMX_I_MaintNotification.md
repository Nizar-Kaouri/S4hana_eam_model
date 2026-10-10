# ZEMX_I_MaintNotification

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance notification |
| Module | `maintenance_notification` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #FACT |
| Data source | `ZEMX_I_NotificationHeader`, join `ZEMX_I_NotificationMaintData` |
| Source file | `src/zemx_i_maintnotification.ddls.asddls` |

## Purpose

PM notification with maintenance data, reference object, location, main work center (business key) and completion / deletion flags.

## Keys

- `MaintenanceNotification`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the open notifications: filter IsCompleted = '' and IsMarkedForDeletion = ''.

## Open verification items

none
