# ZMMX_B_PurchaseItemData

> Version **1.0.0**

| | |
|---|---|
| Description | PurchaseItemData |
| Module | `purchase_order` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `ekpo` |
| Source file | `src/zmmx_b_purchaseitemdata.ddls.asddls` |

## Purpose

Read PurchaseItemData as source records; approve the key-date population before posting.

## Keys

- `PurchaseOrder`
- `PurchaseOrderItem`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
