# ZEMT_I_MaintOrderCount

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance order count (reconciliation) |
| Module | `maintenance_order` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_MaintenanceOrder` |
| Source file | `src/zemt_i_maintordercount.ddls.asddls` |

## Purpose

Record count of maintenance orders on S/4HANA per MaintenanceOrderType, MaintenancePlanningPlant; same structure as the ECC count view.

## Keys

- `MaintenanceOrderType`
- `MaintenancePlanningPlant`

## Associations defined here

- none

## Access control

No DCL by design: Reconciliation view: it must see every migrated record to prove completeness. Grant it only to the migration / reconciliation role (decision TGEN-D01); no CDS access control by design.

## Example use case

Export after the load: python3 tools/mig_reconcile.py counts --module maintenance_order --source <ECC export> --target <this export>.

## Open verification items

none
