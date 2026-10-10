# ZEMX_I_EquipmentHeader

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment header |
| Module | `equipment` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `equi` |
| Source file | `src/zemx_i_equipmentheader.ddls.asddls` |

## Purpose

Equipment master records (EQUI): category, object type, manufacturer, acquisition and serial data.

## Keys

- `equnr`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the manufacturer data of equipment 10000001.

## Open verification items

`XEQ-004`, `XEQ-005` - see `BATCH_REPORT.md`.
