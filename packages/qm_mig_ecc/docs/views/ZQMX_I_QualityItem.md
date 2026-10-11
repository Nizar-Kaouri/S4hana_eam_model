# ZQMX_I_QualityItem

> Version **1.0.0**

| | |
|---|---|
| Description | QualityItem |
| Module | `quality_notification` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZQMX_I_QualityItemData` |
| Source file | `src/zqmx_i_qualityitem.ddls.asddls` |

## Purpose

Read QualityItem as source records; approve the key-date population before posting.

## Keys

- `QualityNotification`
- `NotificationItem`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
