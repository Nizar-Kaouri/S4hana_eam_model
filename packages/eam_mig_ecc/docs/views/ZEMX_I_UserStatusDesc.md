# ZEMX_I_UserStatusDesc

> Version **1.0.0**

| | |
|---|---|
| Description | User status description |
| Module | `object_status` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #TEXT |
| Data source | `tj30t` |
| Source file | `src/zemx_i_userstatusdesc.ddls.asddls` |

## Purpose

Short and long texts of user statuses per status profile (TJ30T): reference list of the user statuses in use.

## Keys

- `StatusProfile`
- `StatusCode`
- `Language`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

List all statuses of profile PM000001 .
