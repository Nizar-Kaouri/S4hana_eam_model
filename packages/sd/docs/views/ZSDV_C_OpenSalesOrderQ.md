# ZSDV_C_OpenSalesOrderQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Open Sales Order Analysis |
| Module | `rpt_open_sales_orders` |
| Batch | 3 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZSDV_R_OpenSalesOrder` |
| Source file | `src/zsdv_c_opensalesorderq.ddls.asddls` |

## Purpose

Analytical query on ZSDV_R_OpenSalesOrder: order backlog per sales organization and age bucket.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZSDV_R_OpenSalesOrder (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
