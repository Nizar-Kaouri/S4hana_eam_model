# ZMMX_I_InfoRecordData

> Version **1.0.0**

| | |
|---|---|
| Description | InfoRecordData |
| Module | `purchasing_info_record` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `eina` |
| Source file | `src/zmmx_i_inforecorddata.ddls.asddls` |

## Purpose

Read InfoRecordData as source records; approve the key-date population before posting.

## Keys

- `PurchasingInfoRecord`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
