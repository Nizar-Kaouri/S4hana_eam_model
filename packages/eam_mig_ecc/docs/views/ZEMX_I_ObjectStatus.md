# ZEMX_I_ObjectStatus

> Version **1.0.0**

| | |
|---|---|
| Description | Object status |
| Module | `object_status` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #FACT |
| Data source | `ZEMX_I_ObjectStatusEntry` |
| Source file | `src/zemx_i_objectstatus.ddls.asddls` |

## Purpose

Active statuses with object type, object key and status profile.

## Keys

- `ObjectNumber`
- `StatusCode`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the active user statuses of the orders: filter StatusObjectType = 'OR' and StatusKind = 'E'.
