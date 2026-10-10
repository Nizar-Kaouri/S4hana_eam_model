# ZEMX_I_ClassAssignment

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Class assignment |
| Module | `classification` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `ZEMX_I_ObjectClassAssgmt`, join `ZEMX_I_ClassHeader` |
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

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the equipment classes: filter ClassType = '002'.

## Open verification items

none
