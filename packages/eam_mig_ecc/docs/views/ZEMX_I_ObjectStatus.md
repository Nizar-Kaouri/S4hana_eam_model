# ZEMX_I_ObjectStatus

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Object status (migration extract) |
| Module | `object_status` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `jest`, join `jsto` |
| Source file | `src/zemx_i_objectstatus.ddls.asddls` |

## Purpose

Active system and user statuses of all objects (equipment IE, functional location IF, notification QM, order OR, ...) with the status profile for user statuses.

## Keys

- `objnr`
- `stat`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Extract the user statuses of equipment: filter StatusObjectType = 'IE' and StatusKind = 'E'.

## Open verification items

`XST-001`, `XST-002` - see `BATCH_REPORT.md`.
