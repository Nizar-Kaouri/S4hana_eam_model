# ZQMX_C_NotifUserStatusMig

> Version **1.0.0**

| | |
|---|---|
| Description | NotifUserStatusMig |
| Module | `quality_notification` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZQMX_I_NotifUserStatus` |
| Source file | `src/zqmx_c_notifuserstatusmig.ddls.asddls` |

## Purpose

Preserve the business key and selected parent population without flattening repeating records.

## Keys

- `QualityNotification`
- `StatusCode`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
