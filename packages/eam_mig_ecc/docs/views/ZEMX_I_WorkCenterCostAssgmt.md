# ZEMX_I_WorkCenterCostAssgmt

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Work center cost center assignment |
| Module | `work_center` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `crco` |
| Source file | `src/zemx_i_workcentercostassgmt.ddls.asddls` |

## Purpose

Cost center assignments of work centers per validity period (CRCO).

## Keys

- `objid`
- `laset`
- `endda`
- `lanum`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the cost center of work center object 10000001 valid today.

## Open verification items

`XWC-004` - see `BATCH_REPORT.md`.
