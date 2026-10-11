# ZEMX_C_LongTextMigCount

> Version **1.0.0**

| | |
|---|---|
| Description | Long text count (migration) |
| Module | `long_text` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_C_LongTextIndexMig` |
| Source file | `src/zemx_c_longtextmigcount.ddls.asddls` |

## Purpose

Record count of the long texts delivered by ZEMX_C_LongTextIndexMig per TextObject, TextID.

## Keys

- `TextObject`
- `TextID`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export this source count view to record the selected extraction population by its dimensions.
