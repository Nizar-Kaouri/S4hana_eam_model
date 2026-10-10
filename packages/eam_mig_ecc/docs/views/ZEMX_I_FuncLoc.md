# ZEMX_I_FuncLoc

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Functional location (migration extract) |
| Module | `functional_location` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `iflot`, join `iloa`, join `jest` |
| Source file | `src/zemx_i_funcloc.ddls.asddls` |

## Purpose

One row per functional location with hierarchy (superior location), category, planning data and location / account assignment from ILOA; source for the functional location migration object.

## Keys

- `tplnr`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Extract the hierarchy of plant 1000 top-down: filter MaintenancePlanningPlant = '1000' and load parents before children (SuperiorFunctionalLocation).

## Open verification items

`XFL-001`, `XFL-002`, `XFL-003`, `XFL-004`, `XFL-G01`, `XGEN-001`, `XGEN-002`, `XGEN-003` - see `BATCH_REPORT.md`.
