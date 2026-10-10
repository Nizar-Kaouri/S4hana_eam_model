# ZBRG_C_InspLotProductQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Quality by Product Group |
| Module | bridge: `mm:product` + `qm:inspection_lot` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZBRG_R_InspLotWithProduct` |
| Source file | `src/zbrg_c_insplotproductq.ddls.asddls` |

## Purpose

Analytical query on ZBRG_R_InspLotWithProduct: lots and rejections per plant and product group, with rejection rate.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query (link); authorization is enforced by the DCL of its provider ZBRG_R_InspLotWithProduct (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
