# ZEMX_I_StatusDeletionFlag

> Version **1.0.0**

| | |
|---|---|
| Description | Objects with status deletion flag (DLFL) |
| Module | `core` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `jest` |
| Source file | `src/zemx_i_statusdeletionflag.ddls.asddls` |

## Purpose

Object numbers whose system status I0076 - deletion flag (DLFL) - is active; joined by the composite views to derive the scope flags.

## Keys

- `ObjectNumber`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Check whether order object number OR000004000001 carries I0076.
