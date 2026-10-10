# ZBRG_C_MaintCostCostCtrQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Cost by Cost Center |
| Module | bridge: `co:cost_center` + `eam:rpt_order_cost` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZBRG_R_MaintCostWithCostCtr` |
| Source file | `src/zbrg_c_maintcostcostctrq.ddls.asddls` |

## Purpose

Analytical query on ZBRG_R_MaintCostWithCostCtr: maintenance cost per cost center category and cost center.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query (link); authorization is enforced by the DCL of its provider ZBRG_R_MaintCostWithCostCtr (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
