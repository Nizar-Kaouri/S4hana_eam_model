# ZFIX_I_CustomerWHT

> Version **1.0.0**

| | |
|---|---|
| Description | CustomerWHT |
| Module | `customer` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZFIX_B_CustomerWHTData`, join `ZFIX_I_CustomerCompan` |
| Source file | `src/zfix_i_customerwht.ddls.asddls` |

## Purpose

Preserve the business key and selected parent population without flattening repeating records.

## Keys

- `Customer`
- `CompanyCode`
- `WithholdingTaxType`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
