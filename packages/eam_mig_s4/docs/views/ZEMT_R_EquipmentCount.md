# ZEMT_R_EquipmentCount

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment count (reconciliation) |
| Module | `equipment` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_Equipment` |
| Source file | `src/zemt_r_equipmentcount.ddls.asddls` |

## Purpose

Record count of equipments on S/4HANA per MaintenancePlanningPlant, EquipmentCategory; same structure as the ECC count view.

## Keys

- `MaintenancePlanningPlant`
- `EquipmentCategory`

## Associations defined here

- none

## Access control

No DCL by design: Reconciliation view: it must see every migrated record to prove completeness. Grant it only to the migration / reconciliation role (decision TGEN-D01); no CDS access control by design.

## Example use case

Export after the load: python3 tools/mig_reconcile.py counts --module equipment --source <ECC export> --target <this export>.

## Open verification items

none
