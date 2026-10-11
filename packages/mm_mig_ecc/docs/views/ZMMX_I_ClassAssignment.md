# ZMMX_I_ClassAssignment

> Version **1.0.0**

| | |
|---|---|
| Description | Class assignment |
| Module | `product` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `ZMMX_B_ObjectClassAssgmt` |
| Source file | `src/zmmx_i_classassignment.ddls.asddls` |

## Purpose

Class assignments with the class name instead of the internal class number.

## Keys

- `ClassifiedObject`
- `ClassType`
- `ClassInternalID`
- `ChangeCounter`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Read the equipment classes: filter ClassType = '002'.
