# ZEMT_I_MaintPlanCount

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance plan count (reconciliation) |
| Module | `maintenance_plan` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_MaintenancePlan` |
| Source file | `src/zemt_i_maintplancount.ddls.asddls` |

## Purpose

Record count of maintenance plans on S/4HANA per MaintenancePlanCategory, MaintenanceStrategy; same structure as the ECC count view.

## Keys

- `MaintenancePlanCategory`
- `MaintenanceStrategy`

## Associations defined here

- none

## Access control

No DCL by design: Reconciliation view: it must see every migrated record to prove completeness. Grant it only to the migration / reconciliation role (decision TGEN-D01); no CDS access control by design.

## Example use case

Export after the load: python3 tools/mig_reconcile.py counts --module maintenance_plan --source <ECC export> --target <this export>.

## Open verification items

none
