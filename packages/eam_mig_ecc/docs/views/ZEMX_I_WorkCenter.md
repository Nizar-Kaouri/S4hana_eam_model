# ZEMX_I_WorkCenter

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Work center (migration extract) |
| Module | `work_center` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `crhd` |
| Source file | `src/zemx_i_workcenter.ddls.asddls` |

## Purpose

One row per work center of type 'A' (resource / work center) with plant, category, responsible person and validity; source for the work center migration object.

## Keys

- `objid`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Extract all maintenance work centers of plant 1000: filter Plant = '1000' and WorkCenterCategoryCode = '0005'.

## Open verification items

`XWC-001`, `XWC-002`, `XWC-003`, `XWC-G01` - see `BATCH_REPORT.md`.
