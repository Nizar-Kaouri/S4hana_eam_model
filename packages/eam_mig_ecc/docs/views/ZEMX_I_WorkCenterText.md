# ZEMX_I_WorkCenterText

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Work center text (migration extract) |
| Module | `work_center` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #TEXT |
| Data source | `crtx`, join `crhd` |
| Source file | `src/zemx_i_workcentertext.ddls.asddls` |

## Purpose

Work center descriptions in every maintained language, with the business key (work center + plant) the target system needs.

## Keys

- `objid`
- `spras`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Extract the German and English texts: filter Language = 'D' or 'E'.

## Open verification items

none
