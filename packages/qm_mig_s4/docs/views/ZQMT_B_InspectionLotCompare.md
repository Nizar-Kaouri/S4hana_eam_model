# ZQMT_B_InspectionLotCompare

> Version **1.0.0**

| | |
|---|---|
| Description | InspectionLotCompare |
| Module | `inspection_lot` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_InspectionLot` |
| Source file | `src/zqmt_b_inspectionlotcompare.ddls.asddls` |

## Purpose

Read InspectionLotCompare as target comparison records.

## Keys

- `InspectionLot`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
