# ZEMX_B_MaintPlanCycle

> Version **1.0.0**

| | |
|---|---|
| Description | Maintenance plan cycle |
| Module | `maintenance_plan` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `mmpt` |
| Source file | `src/zemx_b_maintplancycle.ddls.asddls` |

## Purpose

Cycles of single-cycle and multiple-counter plans and packages of strategy plans (MMPT).

## Keys

- `MaintenancePlan`
- `MaintenancePlanCycle`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the performance-based cycles: filter MeasuringPoint <> ''.
