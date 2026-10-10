# ZEMX_I_FuncLoc

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Functional location |
| Module | `functional_location` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `ZEMX_I_FuncLocHeader` |
| Source file | `src/zemx_i_funcloc.ddls.asddls` |

## Purpose

Functional location with hierarchy, category, planning data, location / account assignment and deletion flag: the complete business object.

## Keys

- `FunctionalLocation`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the hierarchy of plant 1000 top-down: filter MaintenancePlanningPlant = '1000'.

## Open verification items

`XFL-G01`, `XGEN-003`, `XGEN-005` - see `BATCH_REPORT.md`.
