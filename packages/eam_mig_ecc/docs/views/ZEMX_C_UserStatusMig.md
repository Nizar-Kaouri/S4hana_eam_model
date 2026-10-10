# ZEMX_C_UserStatusMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | User status (migration) |
| Module | `object_status` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_ObjectStatus` |
| Source file | `src/zemx_c_userstatusmig.ddls.asddls` |

## Purpose

Active user statuses (kind E) with object key and status profile; system statuses are set by S/4HANA and not migrated.

## Keys

- `StatusObjectKey`
- `StatusCode`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

The load program sets the user statuses after the objects are loaded (filter StatusObjectType per object).

## Open verification items

none
