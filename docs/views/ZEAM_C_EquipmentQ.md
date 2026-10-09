# ZEAM_C_EquipmentQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Module | `equipment` |
| Layer | Consumption (transient analytical query) |
| Data source | `ZEAM_R_Equipment` |
| Source file | `src/zeam_c_equipmentq.ddls.asddls` |

## Purpose

Analytical query: rows MaintenancePlant × EquipmentCategory, columns NumberOfEquipments and AcquisitionValue, remaining characteristics free. Consumable via an OData V4 analytical service or SAP Analytics Cloud live connection.

## Keys

- (none - transient)

## Associations

- none

## Access control

No DCL by design: transient entities are not SQL-readable; the provider's DCL (`ZEAM_R_Equipment`) applies (GEN-Q01).

## Example use case

Expose in a service definition (`expose ZEAM_C_EquipmentQ;`) bound as OData V4 UI and open it in an Analytical List Page / Fiori Elements analytical table.

## Open verification items

`GEN-Q01`, `GEN-Q02`, `GEN-Q03`, `GEN-A01` - see `BATCH_REPORT.md`.
