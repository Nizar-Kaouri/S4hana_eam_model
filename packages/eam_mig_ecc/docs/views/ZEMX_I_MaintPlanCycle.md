# ZEMX_I_MaintPlanCycle

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance plan cycle |
| Module | `maintenance_plan` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `mmpt` |
| Source file | `src/zemx_i_maintplancycle.ddls.asddls` |

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

## Open verification items

`XPL-005` - see `BATCH_REPORT.md`.
