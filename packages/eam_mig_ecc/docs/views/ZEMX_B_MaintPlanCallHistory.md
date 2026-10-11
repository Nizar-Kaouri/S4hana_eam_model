# ZEMX_B_MaintPlanCallHistory

> Version **1.0.0**

| | |
|---|---|
| Description | Maintenance plan call history |
| Module | `maintenance_plan` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `mhis` |
| Source file | `src/zemx_b_maintplancallhistory.ddls.asddls` |

## Purpose

Scheduled and completed calls per maintenance plan (MHIS).

## Keys

- `MaintenancePlan`
- `MaintPlanCallNumber`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the calls of plan 100.
