# ZEAM_C_MaintOrderCostQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Cost Analysis |
| Module | `rpt_order_cost` |
| Batch | 4 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZEAM_R_MaintOrderCost` |
| Source file | `src/zeam_c_maintordercostq.ddls.asddls` |

## Purpose

Analytical query on ZEAM_R_MaintOrderCost. Actual maintenance cost per planning plant and activity type, in global and company code currency.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZEAM_R_MaintOrderCost (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
