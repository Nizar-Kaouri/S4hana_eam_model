# ZCOV_C_InternalOrderQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Internal Order Analysis |
| Module | `internal_order` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZCOV_R_InternalOrder` |
| Source file | `src/zcov_c_internalorderq.ddls.asddls` |

## Purpose

Analytical query on ZCOV_R_InternalOrder: internal orders per company code and order type.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZCOV_R_InternalOrder (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
