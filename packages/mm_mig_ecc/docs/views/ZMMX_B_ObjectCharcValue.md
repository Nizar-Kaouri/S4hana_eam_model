# ZMMX_B_ObjectCharcValue

> Version **1.0.0**

| | |
|---|---|
| Description | Object characteristic value |
| Module | `product` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `ausp` |
| Source file | `src/zmmx_b_objectcharcvalue.ddls.asddls` |

## Purpose

Characteristic values of objects (AUSP, object indicator 'O').

## Keys

- `ClassifiedObject`
- `CharcInternalID`
- `CharcValuePositionNumber`
- `ClassType`
- `ChangeCounter`

## Associations defined here

- `_Characteristic` → `ZMMX_B_Characteristic` [0..1]

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Read the values of equipment 10000001.
