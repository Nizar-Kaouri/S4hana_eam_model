# ZEMX_I_EquipStatus

> Version **1.0.0**

| | |
|---|---|
| Description | Equipment active statuses |
| Module | `equipment` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_ObjectStatus`, join `ZEMX_I_Equipment` |
| Source file | `src/zemx_i_equipstatus.ddls.asddls` |

## Purpose

Equipment active statuses linked to an existing non-deleted current equipment master.

## Keys

- `Equipment`
- `StatusCode`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected equipment population and retain Equipment as the parent key.
