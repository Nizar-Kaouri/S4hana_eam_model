# ZCOV_C_COCostProfitCtrQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Costs by Profit Center |
| Module | link: `cost_actuals` + `profit_center` |
| Batch | 2 |
| Layer | link (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZCOV_R_COCostWithProfitCtr` |
| Source file | `src/zcov_c_cocostprofitctrq.ddls.asddls` |

## Purpose

Analytical query on ZCOV_R_COCostWithProfitCtr: costs per segment and profit center.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query (link); authorization is enforced by the DCL of its provider ZCOV_R_COCostWithProfitCtr (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
