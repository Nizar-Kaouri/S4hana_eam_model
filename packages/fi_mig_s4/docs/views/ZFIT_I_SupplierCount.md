# ZFIT_I_SupplierCount

> Version **1.0.0**

| | |
|---|---|
| Description | SupplierCount |
| Module | `supplier` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZFIT_I_SupplierCompare` |
| Source file | `src/zfit_i_suppliercount.ddls.asddls` |

## Purpose

Read SupplierCount as target comparison records.

## Keys

- `Supplier`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
