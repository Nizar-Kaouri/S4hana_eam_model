# ZEMX_I_FuncLocText

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Functional location text (migration extract) |
| Module | `functional_location` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #TEXT |
| Data source | `iflotx` |
| Source file | `src/zemx_i_funcloctext.ddls.asddls` |

## Purpose

Functional location descriptions in every maintained language and the long-text indicator.

## Keys

- `tplnr`
- `spras`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Extract all texts of the locations in scope: join on FunctionalLocation with ZEMX_I_FuncLoc.

## Open verification items

none
