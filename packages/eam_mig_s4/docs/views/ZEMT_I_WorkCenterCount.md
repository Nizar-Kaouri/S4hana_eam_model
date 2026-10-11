# ZEMT_I_WorkCenterCount

> Version **1.0.0**

| | |
|---|---|
| Description | Work center count (reconciliation) |
| Module | `work_center` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_WorkCenter` |
| Source file | `src/zemt_i_workcentercount.ddls.asddls` |

## Purpose

Record count of work centers on S/4HANA per Plant, WorkCenterCategoryCode; same structure as the ECC count view.

## Keys

- `Plant`
- `WorkCenterCategoryCode`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export after the load: python3 tools/mig_reconcile.py counts --module work_center --source <ECC export> --target <this export>.
