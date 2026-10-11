# ZFIX_I_Supplier

> Version **1.0.0**

| | |
|---|---|
| Description | Supplier |
| Module | `supplier` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZFIX_B_SupplierData` |
| Source file | `src/zfix_i_supplier.ddls.asddls` |

## Purpose

Read Supplier as source records; approve the key-date population before posting.

## Keys

- `Supplier`

## Associations defined here

- `_Address` → `ZFIX_B_Address` [0..1]

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
