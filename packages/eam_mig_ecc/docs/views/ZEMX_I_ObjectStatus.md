# ZEMX_I_ObjectStatus

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Object status |
| Module | `object_status` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #FACT |
| Data source | `ZEMX_I_ObjectStatusEntry` |
| Source file | `src/zemx_i_objectstatus.ddls.asddls` |

## Purpose

Active statuses with object type, object key and status profile.

## Keys

- `ObjectNumber`
- `StatusCode`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the active user statuses of the orders: filter StatusObjectType = 'OR' and StatusKind = 'E'.

## Open verification items

none
