# ZEMX_C_UserStatusMig

> Version **1.0.0**

| | |
|---|---|
| Description | User status (migration) |
| Module | `object_status` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_ObjectStatus` |
| Source file | `src/zemx_c_userstatusmig.ddls.asddls` |

## Purpose

Active user statuses (kind E) with object key and status profile; system statuses are set by S/4HANA and not migrated.

## Keys

- `StatusObjectKey`
- `StatusCode`
- `StatusObjectType`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

The load program sets the user statuses after the objects are loaded (filter StatusObjectType per object).
