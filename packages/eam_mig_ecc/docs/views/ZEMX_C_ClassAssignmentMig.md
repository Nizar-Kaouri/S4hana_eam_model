# ZEMX_C_ClassAssignmentMig

> Version **1.0.0**

| | |
|---|---|
| Description | Class assignment (migration) |
| Module | `classification` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_ClassAssignment` |
| Source file | `src/zemx_c_classassignmentmig.ddls.asddls` |

## Purpose

Class assignments of equipment (002) and functional locations (003).

## Keys

- `ClassifiedObject`
- `ClassType`
- `Class`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

The load program assigns the classes after the technical objects are loaded.
