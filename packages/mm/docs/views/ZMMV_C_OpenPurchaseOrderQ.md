# ZMMV_C_OpenPurchaseOrderQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Open Purchase Order Analysis |
| Module | `rpt_open_purchase_order` |
| Batch | 4 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZMMV_R_OpenPurchaseOrder` |
| Source file | `src/zmmv_c_openpurchaseorderq.ddls.asddls` |

## Purpose

Analytical query on ZMMV_R_OpenPurchaseOrder: open items per purchasing group and age bucket.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZMMV_R_OpenPurchaseOrder (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
