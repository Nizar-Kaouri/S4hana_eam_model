# ZEAM_C_MeasDocumentQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Measurement Reading Analysis |
| Module | `measurement_document` |
| Batch | 3 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZEAM_I_MeasDocument` |
| Source file | `src/zeam_c_measdocumentq.ddls.asddls` |

## Purpose

Analytical query on ZEAM_I_MeasDocument. Reading statistics per measuring point and day (unit = MeasurementRangeUnit).

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZEAM_I_MeasDocument (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
