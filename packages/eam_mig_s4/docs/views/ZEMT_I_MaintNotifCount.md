# ZEMT_I_MaintNotifCount

> Version **1.0.0**

| | |
|---|---|
| Description | Maintenance notification count (reconciliation) |
| Module | `maintenance_notification` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_MaintenanceNotification` |
| Source file | `src/zemt_i_maintnotifcount.ddls.asddls` |

## Purpose

Record count of maintenance notifications on S/4HANA per NotificationType, MaintenancePlanningPlant; same structure as the ECC count view.

## Keys

- `NotificationType`
- `MaintenancePlanningPlant`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export after the load: python3 tools/mig_reconcile.py counts --module maintenance_notification --source <ECC export> --target <this export>.
