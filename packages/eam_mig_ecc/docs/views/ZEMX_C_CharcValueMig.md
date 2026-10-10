# ZEMX_C_CharcValueMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Characteristic value (migration) |
| Module | `classification` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_CharcValue` |
| Source file | `src/zemx_c_charcvaluemig.ddls.asddls` |

## Purpose

Characteristic values of equipment and functional locations; numeric values in the base unit.

## Keys

- `ClassifiedObject`
- `ClassType`
- `Characteristic`
- `CharcValuePositionNumber`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

The load program sets the values after the class assignment.

## Open verification items

none
