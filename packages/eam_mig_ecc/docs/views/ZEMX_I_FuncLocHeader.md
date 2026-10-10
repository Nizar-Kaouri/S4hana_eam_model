# ZEMX_I_FuncLocHeader

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Functional location header |
| Module | `functional_location` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `iflot` |
| Source file | `src/zemx_i_funclocheader.ddls.asddls` |

## Purpose

Functional location master records (IFLOT) with category, hierarchy, planning data and general data.

## Keys

- `tplnr`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the superior location of FL 1000-PUMP-01.

## Open verification items

`PUMP-01`, `XFL-001`, `XFL-002`, `XFL-003` - see `BATCH_REPORT.md`.
