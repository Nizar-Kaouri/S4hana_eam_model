# ZEAM_B_FuncLocWithMeasPoint

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Functional Location with Measuring Points |
| Module | link: `functional_location` + `measuring_point` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZEAM_B_FuncLoc` |
| Source file | `src/zeam_b_funclocwithmeaspoint.ddls.asddls` |

## Purpose

Functional location with a to-many association to its measuring points.

## Keys

- `FunctionalLocation`

## Associations defined here

- `_MeasuringPoint` → `ZEAM_B_MeasPoint` [0..*]

## Access control

Role inherits the conditions of `ZEAM_B_FuncLoc`.

## Example use case

Condition monitoring overview of a production line.

## Open verification items

none
