# ZEMX_C_FuncLocMigCount

> Version **1.0.0**

| | |
|---|---|
| Description | Functional location count (migration) |
| Module | `functional_location` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_C_FuncLocMig` |
| Source file | `src/zemx_c_funclocmigcount.ddls.asddls` |

## Purpose

Record count of the functional locations delivered by ZEMX_C_FuncLocMig per MaintenancePlanningPlant, FunctionalLocationCategory.

## Keys

- `MaintenancePlanningPlant`
- `FunctionalLocationCategory`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export this source count view to record the selected extraction population by its dimensions.
