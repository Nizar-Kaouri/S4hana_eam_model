# ZEMX_C_WorkCenterMigCount

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Work center count (migration) |
| Module | `work_center` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_C_WorkCenterMig` |
| Source file | `src/zemx_c_workcentermigcount.ddls.asddls` |

## Purpose

Record count of the work centers delivered by ZEMX_C_WorkCenterMig per Plant, WorkCenterCategoryCode (values already translated); compared with the same count on S/4HANA by tools/mig_reconcile.py.

## Keys

- `Plant`
- `WorkCenterCategoryCode`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Export this view before the load and the S/4HANA count view after it; the reconcile tool lists every Plant / WorkCenterCategoryCode combination whose counts differ.

## Open verification items

none
