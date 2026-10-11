# ZFIX_I_CustomerIBAN

> Version **1.0.0**

| | |
|---|---|
| Description | CustomerIBAN |
| Module | `customer` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZFIX_B_CustomerIBANData`, join `ZFIX_I_CustomerBank` |
| Source file | `src/zfix_i_customeriban.ddls.asddls` |

## Purpose

Preserve the business key and selected parent population without flattening repeating records.

## Keys

- `Customer`
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
