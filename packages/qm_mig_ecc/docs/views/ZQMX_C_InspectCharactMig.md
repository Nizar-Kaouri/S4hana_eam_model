# ZQMX_C_InspectCharactMig

> Version **1.0.0**

| | |
|---|---|
| Description | InspectCharactMig |
| Module | `inspection_result` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZQMX_I_InspectCharact` |
| Source file | `src/zqmx_c_inspectcharactmig.ddls.asddls` |

## Purpose

Read InspectCharactMig as source records; approve the key-date population before posting.

## Keys

- `InspectionLot`
- `OperationInternalID`
- `CharacteristicNumber`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
