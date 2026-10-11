# ZEMX_B_ObjectCharcValue

> Version **1.0.0**

| | |
|---|---|
| Description | Object characteristic value |
| Module | `classification` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `ausp` |
| Source file | `src/zemx_b_objectcharcvalue.ddls.asddls` |

## Purpose

Characteristic values of objects (AUSP, object indicator 'O').

## Keys

- `ClassifiedObject`
- `CharcInternalID`
- `CharcValuePositionNumber`
- `ClassType`
- `ChangeCounter`

## Associations defined here

- `_Characteristic` → `ZEMX_B_Characteristic` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the values of equipment 10000001.
