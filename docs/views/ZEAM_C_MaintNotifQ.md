# ZEAM_C_MaintNotifQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Notification Analysis |
| Module | `maintenance_notification` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZEAM_R_MaintNotif` |
| Source file | `src/zeam_c_maintnotifq.ddls.asddls` |

## Purpose

Analytical query on the notification cube (rows planning plant x notification type).

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZEAM_R_MaintNotif (see GEN-Q01).

## Example use case

Notification backlog and breakdown share per plant in an analytical list page.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
