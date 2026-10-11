# ZBRG_C_RevenueCustomerQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Revenue by Customer Country |
| Module | bridge: `fi:customer` + `sd:billing_document` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZBRG_I_RevenueWithCustomer` |
| Source file | `src/zbrg_c_revenuecustomerq.ddls.asddls` |

## Purpose

Analytical query on ZBRG_I_RevenueWithCustomer: revenue per customer country and sold-to party.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query (link); authorization is enforced by the DCL of its provider ZBRG_I_RevenueWithCustomer (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
