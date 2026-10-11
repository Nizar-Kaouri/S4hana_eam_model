# ZFIX_I_SupplierPhone

> Version **1.0.0**

| | |
|---|---|
| Description | SupplierPhone |
| Module | `supplier` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZFIX_B_SupplierPhoneData`, join `ZFIX_I_Supplier` |
| Source file | `src/zfix_i_supplierphone.ddls.asddls` |

## Purpose

Preserve the business key and selected parent population without flattening repeating records.

## Keys

- `Supplier`
- `AddressNumber`
- `PersonNumber`
- `CommunicationValidFrom`
- `CommunicationCounter`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
