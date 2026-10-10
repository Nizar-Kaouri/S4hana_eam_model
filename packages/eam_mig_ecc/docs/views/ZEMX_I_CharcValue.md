# ZEMX_I_CharcValue

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Characteristic value |
| Module | `classification` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #FACT |
| Data source | `ZEMX_I_ObjectCharcValue`, join `ZEMX_I_Characteristic` |
| Source file | `src/zemx_i_charcvalue.ddls.asddls` |

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

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the values of equipment 10000001: filter ClassType = '002'.

## Open verification items

none
