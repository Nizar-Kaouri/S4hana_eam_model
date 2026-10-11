# ZQMX_B_InspectionLotData

> Version **1.0.0**

| | |
|---|---|
| Description | InspectionLotData |
| Module | `inspection_lot` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `qals` |
| Source file | `src/zqmx_b_inspectionlotdata.ddls.asddls` |

## Purpose

Read InspectionLotData as source records; approve the key-date population before posting.

## Keys

- `InspectionLot`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
