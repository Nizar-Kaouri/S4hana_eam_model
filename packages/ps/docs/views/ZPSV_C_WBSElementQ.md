# ZPSV_C_WBSElementQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | WBS Element Analysis |
| Module | `wbs_element` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZPSV_R_WBSElement` |
| Source file | `src/zpsv_c_wbselementq.ddls.asddls` |

## Purpose

Analytical query on ZPSV_R_WBSElement: WBS elements per company code and project.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZPSV_R_WBSElement (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
