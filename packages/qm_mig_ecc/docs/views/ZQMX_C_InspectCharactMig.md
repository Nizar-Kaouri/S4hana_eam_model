# ZQMX_C_InspectCharactMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

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

Read InspectCharactMig as source candidates; approve the key-date population before posting.

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

## Open verification items

none
