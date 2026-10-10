# ZEMX_I_NotificationItemData

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Notification item |
| Module | `maintenance_notification` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `qmfe` |
| Source file | `src/zemx_i_notificationitemdata.ddls.asddls` |

## Purpose

Notification items (QMFE): object part and damage codes with text.

## Keys

- `qmnum`
- `fenum`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the items of notification 10000001.

## Open verification items

`XNO-004` - see `BATCH_REPORT.md`.
