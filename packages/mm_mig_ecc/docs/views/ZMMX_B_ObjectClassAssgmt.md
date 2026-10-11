# ZMMX_B_ObjectClassAssgmt

> Version **1.0.0**

| | |
|---|---|
| Description | Object class assignment |
| Module | `product` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `kssk` |
| Source file | `src/zmmx_b_objectclassassgmt.ddls.asddls` |

## Purpose

Class assignments of objects (KSSK, object indicator 'O').

## Keys

- `ClassifiedObject`
- `ClassType`
- `ClassInternalID`
- `ChangeCounter`

## Associations defined here

- `_Class` → `ZMMX_B_ClassHeader` [0..1]

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Read the classes of equipment 10000001.
