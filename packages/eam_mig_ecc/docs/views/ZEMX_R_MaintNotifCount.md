# ZEMX_R_MaintNotifCount

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Open notification count (reconciliation) |
| Module | `maintenance_notification` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_MaintNotification` |
| Source file | `src/zemx_r_maintnotifcount.ddls.asddls` |

## Purpose

Record count of open maintenance notifications per NotificationType, MaintenancePlanningPlant on the ECC source (migration scope only); compared with the same count on S/4HANA by tools/mig_reconcile.py.

## Keys

- `NotificationType`
- `MaintenancePlanningPlant`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Export this view before the load and the S/4HANA count view after it; the reconcile tool reports every NotificationType / MaintenancePlanningPlant combination whose counts differ.

## Open verification items

none
