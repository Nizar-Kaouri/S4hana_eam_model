# ZQMT_I_QualityNotificCompare

> Version **1.0.0**

| | |
|---|---|
| Description | QualityNotificCompare |
| Module | `quality_notification` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_QualityNotification` |
| Source file | `src/zqmt_i_qualitynotificcompare.ddls.asddls` |

## Purpose

Read QualityNotificCompare as target comparison records.

## Keys

- `QualityNotification`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
