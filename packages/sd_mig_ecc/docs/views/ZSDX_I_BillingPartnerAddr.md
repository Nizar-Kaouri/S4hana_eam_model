# ZSDX_I_BillingPartnerAddr

> Version **1.0.0**

| | |
|---|---|
| Description | BillingPartnerAddr |
| Module | `billing_document` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZSDX_I_BillingPartner`, join `ZSDX_B_Address` |
| Source file | `src/zsdx_i_billingpartneraddr.ddls.asddls` |

## Purpose

Preserve the business key and selected parent population without flattening repeating records.

## Keys

- `BillingDocument`
- `BillingDocumentItem`
- `PartnerFunction`
- `AddressValidFrom`
- `AddressVersion`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
