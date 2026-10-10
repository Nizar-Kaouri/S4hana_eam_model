# ZEAM_I_MeasPoint

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Measuring Point |
| Module | `measuring_point` |
| Batch | 3 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_MeasuringPoint` |
| Source file | `src/zeam_i_measpoint.ddls.asddls` |

## Purpose

One row per measuring point with description, category, reference object (equipment or functional location as plain fields), characteristic unit, counter indicator and status.

## Keys

- `MeasuringPoint`

## Associations defined here

- none

## Access control

Role inherits the conditions of `I_MeasuringPoint`.

## Example use case

List all counters (operating hours) of a plant; dimension for measurement reading analysis.

## Open verification items

`MP-001`, `MP-002`, `MP-003`, `MP-004`, `MP-005`, `MP-D01` - see `BATCH_REPORT.md`.
