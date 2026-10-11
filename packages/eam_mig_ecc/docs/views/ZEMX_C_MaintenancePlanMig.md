# ZEMX_C_MaintenancePlanMig

> Version **1.0.0**

| | |
|---|---|
| Description | Maintenance plan (migration) |
| Module | `maintenance_plan` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_MaintenancePlan` |
| Source file | `src/zemx_c_maintenanceplanmig.ddls.asddls` |

## Purpose

Maintenance plans to migrate with scheduling parameters and restart point.

## Keys

- `MaintenancePlan`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

The load program creates the plan and starts it from LastCompletionDate (no open calls are migrated).
