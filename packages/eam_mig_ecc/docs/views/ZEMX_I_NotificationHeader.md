# ZEMX_I_NotificationHeader

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

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

- `qmnum`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the notifications created in 2025.

## Open verification items

`XNO-001`, `XNO-002` - see `BATCH_REPORT.md`.
