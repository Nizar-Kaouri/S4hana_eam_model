# ZEMX_I_EquipLongText

> Version **1.0.0**

| | |
|---|---|
| Description | Equipment long text index |
| Module | `equipment` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_B_LongTextHeader`, join `ZEMX_I_Equipment` |
| Source file | `src/zemx_i_equiplongtext.ddls.asddls` |

## Purpose

Equipment long text index linked to an existing non-deleted current equipment master.

## Keys

- `Equipment`
- `TextObject`
- `TextName`
- `TextID`
- `Language`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected equipment population and retain Equipment as the parent key.
