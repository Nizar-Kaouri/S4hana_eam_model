# ZMMX_C_PurchaseOrderMigCount

> Version **1.0.0**

| | |
|---|---|
| Description | PurchaseOrderMigCount |
| Module | `purchase_order` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZMMX_C_PurchaseOrderMig` |
| Source file | `src/zmmx_c_purchaseordermigcount.ddls.asddls` |

## Purpose

Read PurchaseOrderMigCount as source records; approve the key-date population before posting.

## Keys

- `PurchaseOrder`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
