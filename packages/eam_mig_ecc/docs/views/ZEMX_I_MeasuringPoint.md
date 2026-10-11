# ZEMX_I_MeasuringPoint

> Version **1.0.0**

| | |
|---|---|
| Description | Measuring point |
| Module | `measuring_point` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `ZEMX_I_MeasuringPointHeader` |
| Source file | `src/zemx_i_measuringpoint.ddls.asddls` |

## Purpose

Measuring point with the technical object it belongs to (decoded from the object number) and the characteristic name instead of the internal number.

## Keys

- `MeasuringPoint`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the counters of equipment: filter MeasuringPointObjectType = 'IE' and MeasuringPointIsCounter = 'X'.
