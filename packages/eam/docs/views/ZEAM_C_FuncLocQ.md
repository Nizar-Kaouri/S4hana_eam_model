# ZEAM_C_FuncLocQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Functional Location Analysis |
| Module | `functional_location` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZEAM_I_FuncLoc` |
| Source file | `src/zeam_c_funclocq.ddls.asddls` |

## Purpose

Analytical query on the functional location cube.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZEAM_I_FuncLoc (see GEN-Q01).

## Example use case

Structure overview per plant in an analytical list page.

## Open verification items

`GEN-Q01`, `GEN-Q03` - see `BATCH_REPORT.md`.
