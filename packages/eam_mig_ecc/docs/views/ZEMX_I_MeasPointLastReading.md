# ZEMX_I_MeasPointLastReading

> Version **1.0.0**

| | |
|---|---|
| Description | Last reading per measuring point |
| Module | `measurement_document` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #FACT |
| Data source | `ZEMX_I_MeasPointLastDoc`, join `ZEMX_B_MeasurementDocument` |
| Source file | `src/zemx_i_measpointlastreading.ddls.asddls` |

## Purpose

Latest valid reading per measuring point: migrated as the initial reading so that counters and performance-based plans continue.

## Keys

- `MeasuringPoint`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the last reading of every counter.
