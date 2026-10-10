# ZEMX_C_MaintPlanMigCount

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance plan count (migration) |
| Module | `maintenance_plan` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_C_MaintenancePlanMig` |
| Source file | `src/zemx_c_maintplanmigcount.ddls.asddls` |

## Purpose

Record count of the maintenance plans delivered by ZEMX_C_MaintenancePlanMig per MaintenancePlanCategory, MaintenanceStrategy; compared with the same count on S/4HANA by tools/mig_reconcile.py.

## Keys

- `MaintenancePlanCategory`
- `MaintenanceStrategy`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export this view before the load and the S/4HANA count view after it; the reconcile tool lists every MaintenancePlanCategory / MaintenanceStrategy combination whose counts differ.

## Open verification items

none
