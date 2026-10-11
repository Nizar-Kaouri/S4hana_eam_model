# ZEMX_I_NotificationHeader

> Version **1.0.0**

| | |
|---|---|
| Description | Notification header |
| Module | `maintenance_notification` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `qmel` |
| Source file | `src/zemx_i_notificationheader.ddls.asddls` |

## Purpose

Notification headers (QMEL): type, texts, dates, priority, coding, order reference and object number.

## Keys

- `MaintenanceNotification`

## Associations defined here

- `_MainWorkCenter` → `ZEMX_I_WorkCenterHeader` [0..1]
- `_CompletedFlag` → `ZEMX_I_StatusNotifCompleted` [0..1]
- `_DeletionFlag` → `ZEMX_I_StatusDeletionFlag` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the notifications created in 2025.
