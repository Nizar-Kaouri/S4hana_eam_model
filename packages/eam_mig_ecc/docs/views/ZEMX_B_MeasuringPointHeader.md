# ZEMX_B_MeasuringPointHeader

> Version **1.0.0**

| | |
|---|---|
| Description | Measuring point header |
| Module | `measuring_point` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `imptt` |
| Source file | `src/zemx_b_measuringpointheader.ddls.asddls` |

## Purpose

Measuring points and counters (IMPTT) with object number, characteristic, ranges and indicators.

## Keys

- `MeasuringPoint`

## Associations defined here

- `_Characteristic` → `ZEMX_B_Characteristic` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the counters: filter MeasuringPointIsCounter = 'X'.
