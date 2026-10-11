# ZPSV_C_ProjectCostToDateQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Project Cost to Date |
| Module | `rpt_project_cost_to_date` |
| Batch | 3 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZPSV_I_ProjectCostToDate` |
| Source file | `src/zpsv_c_projectcosttodateq.ddls.asddls` |

## Purpose

Analytical query on ZPSV_I_ProjectCostToDate: cost to date per project and WBS element at a key date.

## Parameters

- `P_KeyDate` : `abap.dats`

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZPSV_I_ProjectCostToDate (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
