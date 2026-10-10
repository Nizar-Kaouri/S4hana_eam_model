# ZEMX_I_WorkCenterCostCtr

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Work center cost center (migration extract) |
| Module | `work_center` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `crco`, join `crhd` |
| Source file | `src/zemx_i_workcentercostctr.ddls.asddls` |

## Purpose

Cost center assignments of work centers per validity period (needed to load the costing view of the work center).

## Keys

- `objid`
- `laset`
- `endda`
- `lanum`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Find work centers without a valid cost center: compare this view with ZEMX_I_WorkCenter.

## Open verification items

`XWC-004` - see `BATCH_REPORT.md`.
