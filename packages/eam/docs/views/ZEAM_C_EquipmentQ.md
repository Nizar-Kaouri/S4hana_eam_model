# ZEAM_C_EquipmentQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment Analysis |
| Module | `equipment` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZEAM_I_Equipment` |
| Source file | `src/zeam_c_equipmentq.ddls.asddls` |

## Purpose

Analytical query on the equipment cube (rows plant x category, columns count and acquisition value).

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZEAM_I_Equipment (see GEN-Q01).

## Example use case

Expose in a service definition, bind as OData V4 and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01`, `GEN-Q02`, `GEN-Q03` - see `BATCH_REPORT.md`.
