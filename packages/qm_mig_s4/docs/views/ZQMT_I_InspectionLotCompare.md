# ZQMT_I_InspectionLotCompare

> Status: **draft-unverified** · tested release: none (draft, S/4HANA 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | InspectionLotCompare |
| Module | `inspection_lot` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_InspectionLot` |
| Source file | `src/zqmt_i_inspectionlotcompare.ddls.asddls` |

## Purpose

Read InspectionLotCompare as target comparison candidates.

## Keys

- `InspectionLot`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`QMT-001` - see `BATCH_REPORT.md`.
