# ZQMV_C_SupplierQualityQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Supplier Quality Analysis |
| Module | `rpt_supplier_quality` |
| Batch | 4 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZQMV_I_SupplierQuality` |
| Source file | `src/zqmv_c_supplierqualityq.ddls.asddls` |

## Purpose

Analytical query on ZQMV_I_SupplierQuality: decided, accepted and rejected lots per supplier with rejection rate.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZQMV_I_SupplierQuality (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
