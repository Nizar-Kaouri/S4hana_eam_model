# ZQMX_C_QualityNotificMigCount

> Version **1.0.0**

| | |
|---|---|
| Description | QualityNotificMigCount |
| Module | `quality_notification` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZQMX_C_QualityNotificMig` |
| Source file | `src/zqmx_c_qualitynotificmigcount.ddls.asddls` |

## Purpose

Read QualityNotificMigCount as source records; approve the key-date population before posting.

## Keys

- `QualityNotification`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
