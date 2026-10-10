# ZEMX_R_MeasPointLastDoc

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Last measurement document per point |
| Module | `measurement_document` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_MeasurementDocument` |
| Source file | `src/zemx_r_measpointlastdoc.ddls.asddls` |

## Purpose

Highest non-cancelled measurement document number per measuring point (helper for the last reading).

## Keys

- `MeasuringPoint`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Read LastMeasurementDocument for measuring point 1234 to see which reading becomes the initial counter reading on S/4HANA.

## Open verification items

`XMD-002` - see `BATCH_REPORT.md`.
