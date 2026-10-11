# ZEMX_C_UserStatusMigCount

> Version **1.0.0**

| | |
|---|---|
| Description | User status count (migration) |
| Module | `object_status` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_C_UserStatusMig` |
| Source file | `src/zemx_c_userstatusmigcount.ddls.asddls` |

## Purpose

Record count of the user statuses delivered by ZEMX_C_UserStatusMig per StatusObjectType, StatusCode; compared with the same count on S/4HANA by tools/mig_reconcile.py.

## Keys

- `StatusObjectType`
- `StatusCode`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export this view before the load and the S/4HANA count view after it; the reconcile tool lists every StatusObjectType / StatusCode combination whose counts differ.
