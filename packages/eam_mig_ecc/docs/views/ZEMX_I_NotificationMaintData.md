# ZEMX_I_NotificationMaintData

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

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

## Open verification items

`XNO-003` - see `BATCH_REPORT.md`.
