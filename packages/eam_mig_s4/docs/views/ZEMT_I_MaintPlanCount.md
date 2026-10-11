# ZEMT_I_MaintPlanCount

> Version **1.0.0**

| | |
|---|---|
| Description | Maintenance plan count (reconciliation) |
| Module | `maintenance_plan` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_MaintenancePlan` |
| Source file | `src/zemt_i_maintplancount.ddls.asddls` |

## Purpose

Record count of maintenance plans on S/4HANA per MaintenancePlanCategory, MaintenanceStrategy; same structure as the ECC count view.

## Keys

- `MaintenancePlanCategory`
- `MaintenanceStrategy`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export after the load: python3 tools/mig_reconcile.py counts --module maintenance_plan --source <ECC export> --target <this export>.
