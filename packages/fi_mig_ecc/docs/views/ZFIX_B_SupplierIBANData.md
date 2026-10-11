# ZFIX_B_SupplierIBANData

> Version **1.0.0**

| | |
|---|---|
| Description | SupplierIBANData |
| Module | `supplier` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `tiban` |
| Source file | `src/zfix_b_supplieribandata.ddls.asddls` |

## Purpose

Preserve the business key and selected parent population without flattening repeating records.

## Keys

- `BankCountry`
- `Bank`
- `BankAccount`
- `BankControlKey`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
