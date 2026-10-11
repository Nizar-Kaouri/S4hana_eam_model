# ZCOV_C_COCostCostCenterQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Costs by Cost Center Category |
| Module | link: `cost_actuals` + `cost_center` |
| Batch | 2 |
| Layer | link (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZCOV_I_COCostWithCostCenter` |
| Source file | `src/zcov_c_cocostcostcenterq.ddls.asddls` |

## Purpose

Analytical query on ZCOV_I_COCostWithCostCenter: costs per cost center category and cost center.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query (link); authorization is enforced by the DCL of its provider ZCOV_I_COCostWithCostCenter (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
