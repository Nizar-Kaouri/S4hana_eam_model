# ZEMX_I_ObjectStatusEntry

> Version **1.0.0**

| | |
|---|---|
| Description | Active object status |
| Module | `object_status` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `jest` |
| Source file | `src/zemx_i_objectstatusentry.ddls.asddls` |

## Purpose

Active system and user statuses of all objects (JEST, INACT = space) with the object type and status kind decoded.

## Keys

- `ObjectNumber`
- `StatusCode`

## Associations defined here

- `_StatusObject` → `ZEMX_I_StatusObjectInfo` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the user statuses of equipment: filter StatusObjectType = 'IE' and StatusKind = 'E'.
