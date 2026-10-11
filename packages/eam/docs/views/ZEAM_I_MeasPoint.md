# ZEAM_I_MeasPoint

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Measuring Point - Cube |
| Module | `measuring_point` |
| Batch | 3 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZEAM_B_MeasPoint` |
| Source file | `src/zeam_i_measpoint.ddls.asddls` |

## Purpose

Measuring point cube with counters for all, counter-type and inactive measuring points.

## Keys

- `MeasuringPoint`

## Associations defined here

- `_MeasuringPoint` → `ZEAM_B_MeasPoint` [1..1]

## Access control

Role inherits the conditions of `ZEAM_B_MeasPoint`.

## Example use case

Coverage of condition monitoring: measuring points per category and reference object type.

## Open verification items

none
