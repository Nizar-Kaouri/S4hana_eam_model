# ZEMX_I_ClassAssignment

> Version **1.0.0**

| | |
|---|---|
| Description | Class assignment |
| Module | `classification` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `ZEMX_B_ObjectClassAssgmt` |
| Source file | `src/zemx_i_classassignment.ddls.asddls` |

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

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the equipment classes: filter ClassType = '002'.
