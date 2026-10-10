# ZEMX_I_ObjectStatusEntry

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Active object status |
| Module | `object_status` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `jest` |
| Source file | `src/zemx_i_objectstatusentry.ddls.asddls` |

## Purpose

Active system and user statuses of all objects (JEST, INACT = space) with the object type and status kind decoded.

## Keys

- `objnr`
- `stat`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the user statuses of equipment: filter StatusObjectType = 'IE' and StatusKind = 'E'.

## Open verification items

`XST-002` - see `BATCH_REPORT.md`.
