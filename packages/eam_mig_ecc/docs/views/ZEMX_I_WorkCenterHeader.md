# ZEMX_I_WorkCenterHeader

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Work center header |
| Module | `work_center` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `crhd` |
| Source file | `src/zemx_i_workcenterheader.ddls.asddls` |

## Purpose

Work centers of object type 'A' (CRHD) with plant, category, responsible person, validity and deletion flag.

## Keys

- `objid`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the work centers of plant 1000: filter Plant = '1000'.

## Open verification items

`XWC-001`, `XWC-002`, `XWC-003` - see `BATCH_REPORT.md`.
