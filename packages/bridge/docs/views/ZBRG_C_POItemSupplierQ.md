# ZBRG_C_POItemSupplierQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Purchasing by Supplier Country |
| Module | bridge: `fi:supplier` + `mm:purchase_order` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZBRG_I_POItemWithSupplier` |
| Source file | `src/zbrg_c_poitemsupplierq.ddls.asddls` |

## Purpose

Analytical query on ZBRG_I_POItemWithSupplier: purchase volume per supplier country and supplier.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query (link); authorization is enforced by the DCL of its provider ZBRG_I_POItemWithSupplier (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
