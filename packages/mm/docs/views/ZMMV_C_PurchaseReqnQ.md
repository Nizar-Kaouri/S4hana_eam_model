# ZMMV_C_PurchaseReqnQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Purchase Requisition Analysis |
| Module | `purchase_requisition` |
| Batch | 3 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZMMV_I_PurchaseReqnItem` |
| Source file | `src/zmmv_c_purchasereqnq.ddls.asddls` |

## Purpose

Analytical query on ZMMV_I_PurchaseReqnItem: requisition items per plant and purchasing group.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZMMV_I_PurchaseReqnItem (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
