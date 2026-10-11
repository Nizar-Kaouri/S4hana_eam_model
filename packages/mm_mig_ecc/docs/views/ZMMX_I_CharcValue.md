# ZMMX_I_CharcValue

> Version **1.0.0**

| | |
|---|---|
| Description | Characteristic value |
| Module | `product` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #FACT |
| Data source | `ZMMX_B_ObjectCharcValue` |
| Source file | `src/zmmx_i_charcvalue.ddls.asddls` |

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

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Read the values of equipment 10000001: filter ClassType = '002'.
