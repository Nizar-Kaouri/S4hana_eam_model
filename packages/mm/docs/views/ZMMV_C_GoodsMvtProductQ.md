# ZMMV_C_GoodsMvtProductQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Goods Movements by Product Group |
| Module | link: `goods_movement` + `product` |
| Batch | 2 |
| Layer | link (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZMMV_I_GoodsMvtWithProduct` |
| Source file | `src/zmmv_c_goodsmvtproductq.ddls.asddls` |

## Purpose

Analytical query on ZMMV_I_GoodsMvtWithProduct: receipts and issues per plant and product group.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query (link); authorization is enforced by the DCL of its provider ZMMV_I_GoodsMvtWithProduct (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
