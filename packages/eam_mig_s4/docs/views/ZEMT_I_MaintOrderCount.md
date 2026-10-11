# ZEMT_I_MaintOrderCount

> Version **1.0.0**

| | |
|---|---|
| Description | Maintenance order count (reconciliation) |
| Module | `maintenance_order` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_MaintenanceOrder` |
| Source file | `src/zemt_i_maintordercount.ddls.asddls` |

## Purpose

Record count of maintenance orders on S/4HANA per MaintenanceOrderType, MaintenancePlanningPlant; same structure as the ECC count view.

## Keys

- `MaintenanceOrderType`
- `MaintenancePlanningPlant`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export after the load: python3 tools/mig_reconcile.py counts --module maintenance_order --source <ECC export> --target <this export>.
