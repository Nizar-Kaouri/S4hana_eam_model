# ZEAM_R_FuncLoc

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Functional Location - Cube |
| Module | `functional_location` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZEAM_I_FuncLoc` |
| Source file | `src/zeam_r_funcloc.ddls.asddls` |

## Purpose

Cube with measure NumberOfFunctionalLocations.

## Keys

- `FunctionalLocation`

## Associations defined here

- `_FunctionalLocation` → `ZEAM_I_FuncLoc` [1..1]

## Access control

Role inherits the conditions of `ZEAM_I_FuncLoc`.

## Example use case

Number of functional locations per plant and category.

## Open verification items

`FL-R01` - see `BATCH_REPORT.md`.
