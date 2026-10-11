# ZEMX_B_MeasurementDocument

> Version **1.0.0**

| | |
|---|---|
| Description | Measurement document |
| Module | `measurement_document` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `imrg` |
| Source file | `src/zemx_b_measurementdocument.ddls.asddls` |

## Purpose

Measurement documents (IMRG): readings and counter readings with date, time, values, valuation code and cancellation flag.

## Keys

- `MeasurementDocument`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the readings of measuring point 1234 in 2025.
