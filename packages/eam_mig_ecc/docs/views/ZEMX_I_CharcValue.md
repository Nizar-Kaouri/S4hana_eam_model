# ZEMX_I_CharcValue

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Characteristic value |
| Module | `classification` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #FACT |
| Data source | `ZEMX_I_ObjectCharcValue` |
| Source file | `src/zemx_i_charcvalue.ddls.asddls` |

## Purpose

Characteristic values with the characteristic name instead of the internal number.

## Keys

- `ClassifiedObject`
- `CharcInternalID`
- `CharcValuePositionNumber`
- `ClassType`
- `ChangeCounter`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the values of equipment 10000001: filter ClassType = '002'.

## Open verification items

none
