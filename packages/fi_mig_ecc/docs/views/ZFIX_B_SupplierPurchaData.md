# ZFIX_B_SupplierPurchaData

> Version **1.0.0**

| | |
|---|---|
| Description | SupplierPurchaData |
| Module | `supplier` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `lfm1` |
| Source file | `src/zfix_b_supplierpurchadata.ddls.asddls` |

## Purpose

Read SupplierPurchaData as source records; approve the key-date population before posting.

## Keys

- `Supplier`
- `PurchasingOrganization`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
