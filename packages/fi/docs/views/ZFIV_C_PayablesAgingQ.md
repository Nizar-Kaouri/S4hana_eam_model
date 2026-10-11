# ZFIV_C_PayablesAgingQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Payables Aging by Supplier |
| Module | link: `open_items` + `supplier` |
| Batch | 2 |
| Layer | link (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZFIV_I_OpenItemWithSupplier` |
| Source file | `src/zfiv_c_payablesagingq.ddls.asddls` |

## Purpose

Analytical query on ZFIV_I_OpenItemWithSupplier: open and overdue amounts per supplier and aging bucket.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query (link); authorization is enforced by the DCL of its provider ZFIV_I_OpenItemWithSupplier (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
