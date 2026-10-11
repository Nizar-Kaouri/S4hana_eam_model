# ZEMX_I_MaintPlanLastCall

> Version **1.0.0**

| | |
|---|---|
| Description | Maintenance plan last call |
| Module | `maintenance_plan` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_MaintPlanCallHistory` |
| Source file | `src/zemx_i_maintplanlastcall.ddls.asddls` |

## Purpose

Last call number and last completion date per maintenance plan: the restart point of the schedule on S/4HANA.

## Keys

- `MaintenancePlan`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the last completion date of plan 100.
