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

- `mdocm`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the readings of measuring point 1234 in 2025.

## Open verification items

`XMD-001` - see `BATCH_REPORT.md`.
