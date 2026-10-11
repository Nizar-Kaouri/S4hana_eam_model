# ZSDX_I_BillingPartner

> Version **1.0.0**

| | |
|---|---|
| Description | BillingPartner |
| Module | `billing_document` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZSDX_B_SalesPartnerData`, join `ZSDX_I_Billing` |
| Source file | `src/zsdx_i_billingpartner.ddls.asddls` |

## Purpose

Preserve the business key and selected parent population without flattening repeating records.

## Keys

- `BillingDocument`
- `BillingDocumentItem`
- `PartnerFunction`

## Associations defined here

- `_Address` → `ZSDX_B_Address` [0..1]

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
