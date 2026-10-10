# ZEMX_I_MeasuringPoint

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Measuring point (migration extract) |
| Module | `measuring_point` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `imptt`, join `cabn` |
| Source file | `src/zemx_i_measuringpoint.ddls.asddls` |

## Purpose

One row per measuring point / counter with the technical object it belongs to (decoded from the object number), characteristic name, ranges and counter indicator.

## Keys

- `point`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Extract the counters of equipment: filter MeasuringPointObjectType = 'IE' and MeasuringPointIsCounter = 'X'.

## Open verification items

`XMP-001`, `XMP-002`, `XMP-003`, `XMP-004` - see `BATCH_REPORT.md`.
