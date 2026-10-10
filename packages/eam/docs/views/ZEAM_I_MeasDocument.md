# ZEAM_I_MeasDocument

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Measurement Document |
| Module | `measurement_document` |
| Batch | 3 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_MeasurementDocument` |
| Source file | `src/zeam_i_measdocument.ddls.asddls` |

## Purpose

One row per measurement document (reading) with date/time, reading in the measuring point unit, counter reading, valuation code, text and cancellation flag.

## Keys

- `MeasurementDocument`

## Associations defined here

- `_MeasuringPoint` → `ZEAM_I_MeasPoint` [1..1]

## Access control

Role inherits the conditions of `I_MeasurementDocument`.

## Example use case

Trend of a temperature or vibration reading; latest counter reading per measuring point.

## Open verification items

`MD-001`, `MD-002`, `MD-003`, `MD-004`, `MD-D01` - see `BATCH_REPORT.md`.
