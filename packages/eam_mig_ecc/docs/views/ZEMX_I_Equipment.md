# ZEMX_I_Equipment

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment (migration extract) |
| Module | `equipment` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `equi`, join `equz`, join `iloa`, join `crhd`, join `jest` |
| Source file | `src/zemx_i_equipment.ddls.asddls` |

## Purpose

One row per equipment (current time segment) with installation location, superordinate equipment, main work center, location / account assignment and manufacturer data; source for the equipment migration object.

## Keys

- `equnr`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Extract the equipment of plant 1000 in installation order: filter MaintenancePlanningPlant = '1000', load superordinate equipment first.

## Open verification items

`XEQ-001`, `XEQ-002`, `XEQ-003`, `XEQ-004`, `XEQ-005` - see `BATCH_REPORT.md`.
