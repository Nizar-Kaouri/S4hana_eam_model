# ZQMX_B_SingleResultData

> Version **1.0.0**

| | |
|---|---|
| Description | SingleResultData |
| Module | `inspection_result` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `qase` |
| Source file | `src/zqmx_b_singleresultdata.ddls.asddls` |

## Purpose

Read SingleResultData as source records; approve the key-date population before posting.

## Keys

- `InspectionLot`
- `OperationInternalID`
- `CharacteristicNumber`
- `SampleNumber`
- `ResultNumber`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
