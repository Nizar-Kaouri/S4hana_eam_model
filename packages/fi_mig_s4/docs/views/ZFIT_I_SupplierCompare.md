# ZFIT_I_SupplierCompare

> Version **1.0.0**

| | |
|---|---|
| Description | SupplierCompare |
| Module | `supplier` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_Supplier` |
| Source file | `src/zfit_i_suppliercompare.ddls.asddls` |

## Purpose

Read SupplierCompare as target comparison records.

## Keys

- `Supplier`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
