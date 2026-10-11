# ZSDV_C_DeliveryQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Outbound Delivery Analysis |
| Module | `outbound_delivery` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZSDV_I_DeliveryItem` |
| Source file | `src/zsdv_c_deliveryq.ddls.asddls` |

## Purpose

Analytical query on ZSDV_I_DeliveryItem: delivery items per shipping point, split by on-time flag.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZSDV_I_DeliveryItem (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
