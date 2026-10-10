# ZEMX_I_ClassAssignment

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Class assignment (migration extract) |
| Module | `classification` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `kssk`, join `klah` |
| Source file | `src/zemx_i_classassignment.ddls.asddls` |

## Purpose

Class assignments of objects (class type 002 equipment, 003 functional location, ...) with the class name instead of the internal class number.

## Keys

- `objek`
- `klart`
- `clint`
- `adzhl`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Extract the equipment classes: filter ClassType = '002'.

## Open verification items

`XCL-001`, `XCL-002` - see `BATCH_REPORT.md`.
