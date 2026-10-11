# ZFIX_B_SupplierCompanData

> Version **1.0.0**

| | |
|---|---|
| Description | SupplierCompanData |
| Module | `supplier` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `lfb1` |
| Source file | `src/zfix_b_suppliercompandata.ddls.asddls` |

## Purpose

Read SupplierCompanData as source records; approve the key-date population before posting.

## Keys

- `Supplier`
- `CompanyCode`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
