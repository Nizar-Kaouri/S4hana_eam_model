# ZSDX_I_SalesPartnerAddress

> Version **1.0.0**

| | |
|---|---|
| Description | SalesPartnerAddress |
| Module | `sales_order` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZSDX_I_SalesPartner`, join `ZSDX_B_Address` |
| Source file | `src/zsdx_i_salespartneraddress.ddls.asddls` |

## Purpose

Preserve the business key and selected parent population without flattening repeating records.

## Keys

- `SalesDocument`
- `SalesDocumentItem`
- `PartnerFunction`
- `AddressValidFrom`
- `AddressVersion`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
