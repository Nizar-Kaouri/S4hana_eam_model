# ZEMX_I_MeasurementDocument

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Measurement document (migration extract) |
| Module | `measurement_document` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `imrg` |
| Source file | `src/zemx_i_measurementdocument.ddls.asddls` |

## Purpose

One row per measurement document (reading or counter reading) with reading date / time, values in SI and entry unit, valuation code and cancellation flag.

## Keys

- `mdocm`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Extract the readings of the last two years: filter MsmtRdngDate >= '20240101' and MsmtDocumentIsCancelled = ''.

## Open verification items

`XMD-001`, `XMD-003` - see `BATCH_REPORT.md`.
