# ZEAM_C_FuncLocQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Module | `functional_location` |
| Layer | Consumption (transient analytical query) |
| Data source | `ZEAM_R_FuncLoc` |
| Source file | `src/zeam_c_funclocq.ddls.asddls` |

## Purpose

Analytical query: rows MaintenancePlant × FunctionalLocationCategory, column NumberOfFunctionalLocations.

## Keys

- (none - transient)

## Associations

- none

## Access control

No DCL by design (GEN-Q01); provider DCL applies.

## Example use case

Structure overview per plant in an analytical list page.

## Open verification items

`GEN-Q01`, `GEN-Q02`, `GEN-Q03`, `GEN-A01` - see `BATCH_REPORT.md`.
