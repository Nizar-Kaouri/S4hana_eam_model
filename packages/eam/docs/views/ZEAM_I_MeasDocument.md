# ZEAM_I_MeasDocument

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Measurement Document - Cube |
| Module | `measurement_document` |
| Batch | 3 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZEAM_B_MeasDocument` |
| Source file | `src/zeam_i_measdocument.ddls.asddls` |

## Purpose

Reading cube (cancelled documents excluded): number of readings, minimum / maximum / summed reading as decimals, with measuring point characteristics via path expressions.

## Keys

- `MeasurementDocument`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZEAM_B_MeasDocument`.

## Example use case

Maximum vibration per equipment and month; number of readings per measuring point category.

## Open verification items

`MD-R01`, `MD-R02` - see `BATCH_REPORT.md`.
