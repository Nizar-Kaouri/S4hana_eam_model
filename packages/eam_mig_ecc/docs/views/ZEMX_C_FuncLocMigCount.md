# ZEMX_C_FuncLocMigCount

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

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

Record count of the functional locations delivered by ZEMX_C_FuncLocMig per MaintenancePlanningPlant, FunctionalLocationCategory; compared with the same count on S/4HANA by tools/mig_reconcile.py.

## Keys

- `MaintenancePlanningPlant`
- `FunctionalLocationCategory`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export this view before the load and the S/4HANA count view after it; the reconcile tool lists every MaintenancePlanningPlant / FunctionalLocationCategory combination whose counts differ.

## Open verification items

none
