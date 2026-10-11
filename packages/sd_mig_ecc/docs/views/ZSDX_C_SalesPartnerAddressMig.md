# ZSDX_C_SalesPartnerAddressMig

> Version **1.0.0**

| | |
|---|---|
| Description | SalesPartnerAddressMig |
| Module | `sales_order` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZSDX_I_SalesPartnerAddress` |
| Source file | `src/zsdx_c_salespartneraddressmig.ddls.asddls` |

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
