# ZEMX_I_NotifCause

> Version **1.0.0**

| | |
|---|---|
| Description | NotifCause migration business data |
| Module | `maintenance_notification` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_NotifCauseData` |
| Source file | `src/zemx_i_notifcause.ddls.asddls` |

## Purpose

NotifCause migration business data

## Keys

- `MaintenanceNotification`
- `MaintNotificationItem`
- `CauseNumber`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected migration scope; validate keys and row counts before loading.
