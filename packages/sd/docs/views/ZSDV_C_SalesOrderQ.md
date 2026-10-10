# ZSDV_C_SalesOrderQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Sales Order Analysis |
| Module | `sales_order` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZSDV_R_SalesOrderItem` |
| Source file | `src/zsdv_c_salesorderq.ddls.asddls` |

## Purpose

Analytical query on ZSDV_R_SalesOrderItem: order value per sales organization and sold-to party.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZSDV_R_SalesOrderItem (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
