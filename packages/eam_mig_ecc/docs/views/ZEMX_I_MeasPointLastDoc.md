# ZEMX_I_MeasPointLastDoc

> Version **1.0.0**

| | |
|---|---|
| Description | Last measurement document per point |
| Module | `measurement_document` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_B_MeasurementDocument`, join `ZEMX_I_MeasPointLastTime` |
| Source file | `src/zemx_i_measpointlastdoc.ddls.asddls` |

## Purpose

Latest non-cancelled reading by date and time; highest document ID breaks timestamp ties.

## Keys

- `MeasuringPoint`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read LastMeasurementDocument of measuring point 1234.
