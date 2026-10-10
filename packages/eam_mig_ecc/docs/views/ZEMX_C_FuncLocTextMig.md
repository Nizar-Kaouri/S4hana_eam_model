# ZEMX_C_FuncLocTextMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Functional location text (migration) |
| Module | `functional_location` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_FuncLocDesc` |
| Source file | `src/zemx_c_funcloctextmig.ddls.asddls` |

## Purpose

Descriptions of the functional locations in scope per language.

## Keys

- `FunctionalLocation`
- `Language`

## Associations defined here

- `_FuncLoc` → `ZEMX_I_FuncLoc` [0..1]

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the texts of FL 1000-PUMP-01: filter FunctionalLocation = '1000-PUMP-01'.

## Open verification items

`PUMP-01` - see `BATCH_REPORT.md`.
