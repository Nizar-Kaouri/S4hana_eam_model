# ZQMX_C_QualityActivitMig

> Version **1.0.0**

| | |
|---|---|
| Description | QualityActivitMig |
| Module | `quality_notification` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZQMX_I_QualityActivit` |
| Source file | `src/zqmx_c_qualityactivitmig.ddls.asddls` |

## Purpose

Read QualityActivitMig as source records; approve the key-date population before posting.

## Keys

- `QualityNotification`
- `ActivityNumber`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
