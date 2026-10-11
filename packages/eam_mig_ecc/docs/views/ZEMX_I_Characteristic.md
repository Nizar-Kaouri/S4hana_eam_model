# ZEMX_I_Characteristic

> Version **1.0.0**

| | |
|---|---|
| Description | Characteristic |
| Module | `core` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `cabn` |
| Source file | `src/zemx_i_characteristic.ddls.asddls` |

## Purpose

Characteristic names by internal number (current version): the name is the key used on S/4HANA, the internal number differs.

## Keys

- `CharcInternalID`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Find the name of characteristic 0000000815.
