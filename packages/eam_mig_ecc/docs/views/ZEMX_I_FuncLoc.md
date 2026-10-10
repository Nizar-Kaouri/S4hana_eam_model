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

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the hierarchy of plant 1000 top-down: filter MaintenancePlanningPlant = '1000'.

## Open verification items

`XFL-G01`, `XGEN-003`, `XGEN-005` - see `BATCH_REPORT.md`.
