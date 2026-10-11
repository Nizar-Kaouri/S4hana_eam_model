# ZQMX_I_QualityActivitData

> Version **1.0.0**

| | |
|---|---|
| Description | QualityActivitData |
| Module | `quality_notification` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `qmma` |
| Source file | `src/zqmx_i_qualityactivitdata.ddls.asddls` |

## Purpose

Read QualityActivitData as source records; approve the key-date population before posting.

## Keys

- `QualityNotification`
- `ActivityNumber`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
