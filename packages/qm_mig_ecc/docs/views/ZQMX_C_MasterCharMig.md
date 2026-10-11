# ZQMX_C_MasterCharMig

> Version **1.0.0**

| | |
|---|---|
| Description | MasterCharMig |
| Module | `master_inspection_characteristic` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZQMX_I_MasterChar` |
| Source file | `src/zqmx_c_mastercharmig.ddls.asddls` |

## Purpose

Read MasterCharMig as source records; approve the key-date population before posting.

## Keys

- `Plant`
- `MasterInspectionCharacteristic`
- `CharacteristicVersion`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
