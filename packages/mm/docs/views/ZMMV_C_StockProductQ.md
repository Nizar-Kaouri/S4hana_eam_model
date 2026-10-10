# ZMMV_C_StockProductQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Stock by Product Group |
| Module | link: `material_stock` + `product` |
| Batch | 2 |
| Layer | link (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZMMV_R_StockWithProduct` |
| Source file | `src/zmmv_c_stockproductq.ddls.asddls` |

## Purpose

Analytical query on ZMMV_R_StockWithProduct: stock per plant and product group.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query (link); authorization is enforced by the DCL of its provider ZMMV_R_StockWithProduct (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
