# ZCOV_C_CostCenterYTDQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Cost Center YTD vs. Prior Year |
| Module | `rpt_cost_center_ytd` |
| Batch | 3 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZCOV_I_CostCenterYTD` |
| Source file | `src/zcov_c_costcenterytdq.ddls.asddls` |

## Purpose

Analytical query on ZCOV_I_CostCenterYTD: costs YTD vs. prior year per cost center and cost element, with the variance.

## Parameters

- `P_FiscalYear` : `abap.numc(`
- `P_PriorFiscalYear` : `abap.numc(`
- `P_ToFiscalPeriod` : `abap.numc(`

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZCOV_I_CostCenterYTD (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
