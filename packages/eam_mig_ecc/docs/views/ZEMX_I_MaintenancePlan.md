# ZEMX_I_MaintenancePlan

> Version **1.0.0**

| | |
|---|---|
| Description | Maintenance plan |
| Module | `maintenance_plan` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `ZEMX_B_MaintenancePlanHeader` |
| Source file | `src/zemx_i_maintenanceplan.ddls.asddls` |

## Purpose

Maintenance plan with scheduling parameters, deletion flag and the restart point (last call / last completion date).

## Keys

- `MaintenancePlan`

## Associations defined here

- `_LastCall` → `ZEMX_I_MaintPlanLastCall` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the restart point of every strategy plan.
