# ZEMX_C_FuncLocMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Functional location (migration) |
| Module | `functional_location` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_FuncLoc` |
| Source file | `src/zemx_c_funclocmig.ddls.asddls` |

## Purpose

Functional locations to migrate (not flagged for deletion) with all fields as stored in ECC.

## Keys

- `FunctionalLocation`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

The load program creates the locations level by level (SuperiorFunctionalLocation first).

## Open verification items

none
