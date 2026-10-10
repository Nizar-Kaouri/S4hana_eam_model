# ZEMT_R_WorkCenterCount

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Work center count (reconciliation) |
| Module | `work_center` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_WorkCenter` |
| Source file | `src/zemt_r_workcentercount.ddls.asddls` |

## Purpose

Record count of work centers on S/4HANA per Plant, WorkCenterCategoryCode; same structure as the ECC count view.

## Keys

- `Plant`
- `WorkCenterCategoryCode`

## Associations defined here

- none

## Access control

No DCL by design: Reconciliation view: it must see every migrated record to prove completeness. Grant it only to the migration / reconciliation role (decision TGEN-D01); no CDS access control by design.

## Example use case

Export after the load: python3 tools/mig_reconcile.py counts --module work_center --source <ECC export> --target <this export>.

## Open verification items

none
