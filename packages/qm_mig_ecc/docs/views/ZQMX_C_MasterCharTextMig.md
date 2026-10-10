# ZQMX_C_MasterCharTextMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | MasterCharTextMig |
| Module | `master_inspection_characteristic` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZQMX_I_MasterCharText` |
| Source file | `src/zqmx_c_masterchartextmig.ddls.asddls` |

## Purpose

Read MasterCharTextMig as source candidates; approve the key-date population before posting.

## Keys

- `Plant`
- `MasterInspectionCharacteristic`
- `CharacteristicVersion`
- `Language`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

none
