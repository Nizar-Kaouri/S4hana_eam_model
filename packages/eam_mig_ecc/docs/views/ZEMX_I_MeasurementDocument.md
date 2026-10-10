# ZEMX_I_MeasurementDocument

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Measurement document |
| Module | `measurement_document` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `imrg` |
| Source file | `src/zemx_i_measurementdocument.ddls.asddls` |

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

## Open verification items

`XMD-001` - see `BATCH_REPORT.md`.
