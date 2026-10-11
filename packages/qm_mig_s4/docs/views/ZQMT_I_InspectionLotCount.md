# ZQMT_I_InspectionLotCount

> Version **1.0.0**

| | |
|---|---|
| Description | InspectionLotCount |
| Module | `inspection_lot` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZQMT_B_InspectionLotCompare` |
| Source file | `src/zqmt_i_inspectionlotcount.ddls.asddls` |

## Purpose

Read InspectionLotCount as target comparison records.

## Keys

- `InspectionLot`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
