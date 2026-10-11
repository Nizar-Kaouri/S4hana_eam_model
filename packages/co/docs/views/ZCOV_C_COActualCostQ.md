# ZCOV_C_COActualCostQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Actual Cost Analysis |
| Module | `cost_actuals` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZCOV_I_COActualCost` |
| Source file | `src/zcov_c_coactualcostq.ddls.asddls` |

## Purpose

Analytical query on ZCOV_I_COActualCost: primary and secondary costs per controlling area and period.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZCOV_I_COActualCost (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
