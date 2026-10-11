# ZPPV_C_BOMItemQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Bill of Material Analysis |
| Module | `bill_of_material` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZPPV_I_BOMItem` |
| Source file | `src/zppv_c_bomitemq.ddls.asddls` |

## Purpose

Analytical query on ZPPV_I_BOMItem: BOM items per category and component.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZPPV_I_BOMItem (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
