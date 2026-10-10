# ZEMX_I_MeasuringPointHeader

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Measuring point header |
| Module | `measuring_point` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `imptt` |
| Source file | `src/zemx_i_measuringpointheader.ddls.asddls` |

## Purpose

Measuring points and counters (IMPTT) with object number, characteristic, ranges and indicators.

## Keys

- `MeasuringPoint`

## Associations defined here

- `_Characteristic` → `ZEMX_I_Characteristic` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the counters: filter MeasuringPointIsCounter = 'X'.

## Open verification items

`XMP-001`, `XMP-003`, `XMP-004` - see `BATCH_REPORT.md`.
