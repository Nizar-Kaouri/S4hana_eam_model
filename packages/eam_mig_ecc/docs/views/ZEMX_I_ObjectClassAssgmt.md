# ZEMX_I_ObjectClassAssgmt

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Object class assignment |
| Module | `classification` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `kssk` |
| Source file | `src/zemx_i_objectclassassgmt.ddls.asddls` |

## Purpose

Class assignments of objects (KSSK, object indicator 'O').

## Keys

- `ClassifiedObject`
- `ClassType`
- `ClassInternalID`
- `ChangeCounter`

## Associations defined here

- `_Class` → `ZEMX_I_ClassHeader` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the classes of equipment 10000001.

## Open verification items

`XCL-001`, `XCL-002` - see `BATCH_REPORT.md`.
