# ZBRG_C_OrderCompProductQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Spare-Part Demand by Product Group |
| Module | bridge: `eam:maintenance_order` + `mm:product` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZBRG_R_OrderCompWithProduct` |
| Source file | `src/zbrg_c_ordercompproductq.ddls.asddls` |

## Purpose

Analytical query on ZBRG_R_OrderCompWithProduct: spare-part demand per planning plant and product group.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query (link); authorization is enforced by the DCL of its provider ZBRG_R_OrderCompWithProduct (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
