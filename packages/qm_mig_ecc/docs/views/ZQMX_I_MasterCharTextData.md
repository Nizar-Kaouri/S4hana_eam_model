# ZQMX_I_MasterCharTextData

> Version **1.0.0**

| | |
|---|---|
| Description | MasterCharTextData |
| Module | `master_inspection_characteristic` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `qpmt` |
| Source file | `src/zqmx_i_masterchartextdata.ddls.asddls` |

## Purpose

Read MasterCharTextData as source records; approve the key-date population before posting.

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
