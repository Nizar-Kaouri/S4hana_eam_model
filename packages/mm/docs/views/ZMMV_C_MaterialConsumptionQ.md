# ZMMV_C_MaterialConsumptionQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Material Consumption Analysis |
| Module | `rpt_material_consumption` |
| Batch | 4 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZMMV_I_MaterialConsumption` |
| Source file | `src/zmmv_c_materialconsumptionq.ddls.asddls` |

## Purpose

Analytical query on ZMMV_I_MaterialConsumption: consumption per plant and month.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZMMV_I_MaterialConsumption (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
