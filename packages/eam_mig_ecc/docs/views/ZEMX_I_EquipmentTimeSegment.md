# ZEMX_I_EquipmentTimeSegment

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment time segment |
| Module | `equipment` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `equz` |
| Source file | `src/zemx_i_equipmenttimesegment.ddls.asddls` |

## Purpose

Time segments of equipment (EQUZ): planning plant, planner group, main work center, superordinate equipment and location record per validity period.

## Keys

- `equnr`
- `datbi`
- `eqlfn`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the installation history of equipment 10000001 (all segments).

## Open verification items

`XEQ-002`, `XEQ-003`, `XEQ-006` - see `BATCH_REPORT.md`.
