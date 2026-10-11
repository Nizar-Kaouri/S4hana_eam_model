# ZFIV_C_OpenItemAgingQ

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Payables and Receivables Aging |
| Module | `open_items` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | transient view entity |
| Data category | analytical query |
| Data source | `ZFIV_I_OpenItemAging` |
| Source file | `src/zfiv_c_openitemagingq.ddls.asddls` |

## Purpose

Analytical query on ZFIV_I_OpenItemAging: open and overdue amounts per account type and aging bucket.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Transient analytical query; authorization is enforced by the DCL of the provider ZFIV_I_OpenItemAging (see GEN-Q01).

## Example use case

Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.

## Open verification items

`GEN-Q01` - see `BATCH_REPORT.md`.
