# ZQMX_I_MasterCharData

> Version **1.0.0**

| | |
|---|---|
| Description | MasterCharData |
| Module | `master_inspection_characteristic` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `qpmk` |
| Source file | `src/zqmx_i_masterchardata.ddls.asddls` |

## Purpose

Read MasterCharData as source records; approve the key-date population before posting.

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
