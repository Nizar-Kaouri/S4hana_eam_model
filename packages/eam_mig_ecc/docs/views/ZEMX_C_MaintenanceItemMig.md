# ZEMX_C_MaintenanceItemMig

> Version **1.0.0**

| | |
|---|---|
| Description | Maintenance item (migration) |
| Module | `maintenance_plan` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_MaintenanceItem` |
| Source file | `src/zemx_c_maintenanceitemmig.ddls.asddls` |

## Purpose

Maintenance items of the plans in scope with reference objects, work center, types and task list.

## Keys

- `MaintenanceItem`

## Associations defined here

- `_MaintenancePlan` → `ZEMX_I_MaintenancePlan` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

The load program adds the items to the plan created from ZEMX_C_MaintenancePlanMig.
