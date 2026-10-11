# ZPSV_C_ProjectCostMasterQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Project Cost by Project Profile |
| Module | link: `project` + `project_cost` + `wbs_element` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZPSV_I_ProjectCostWithMaster` |
| Source file | `src/zpsv_c_projectcostmasterq.ddls.asddls` |

## Purpose

Analytical query on ZPSV_I_ProjectCostWithMaster: cost per project profile and project.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query (link); authorization is enforced by the DCL of its provider ZPSV_I_ProjectCostWithMaster (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
