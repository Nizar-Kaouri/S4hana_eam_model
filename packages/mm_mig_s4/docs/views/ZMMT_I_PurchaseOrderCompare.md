# ZMMT_I_PurchaseOrderCompare

> Status: **draft-unverified** · tested release: none (draft, S/4HANA 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | PurchaseOrderCompare |
| Module | `purchase_order` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_PurchaseOrderAPI01` |
| Source file | `src/zmmt_i_purchaseordercompare.ddls.asddls` |

## Purpose

Read PurchaseOrderCompare as target comparison candidates.

## Keys

- `PurchaseOrder`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`MMT-017` - see `BATCH_REPORT.md`.
