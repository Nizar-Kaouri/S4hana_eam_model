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

- `qmnum`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the breakdowns: filter MaintenanceObjectIsDown = 'X'.

## Open verification items

`XNO-003` - see `BATCH_REPORT.md`.
