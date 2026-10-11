# ZEMX_I_NotificationMaintData

> Version **1.0.0**

| | |
|---|---|
| Description | Notification maintenance data |
| Module | `maintenance_notification` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `qmih` |
| Source file | `src/zemx_i_notificationmaintdata.ddls.asddls` |

## Purpose

Maintenance data of PM notifications (QMIH): reference object, planning plant, planner group, breakdown and malfunction data.

## Keys

- `MaintenanceNotification`

## Associations defined here

- `_LocAcctAssignment` → `ZEMX_I_LocAcctAssignment` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the breakdowns: filter MaintenanceObjectIsDown = 'X'.
