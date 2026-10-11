# ZSDX_I_DeliveryPartnerAddr

> Version **1.0.0**

| | |
|---|---|
| Description | DeliveryPartnerAddr |
| Module | `outbound_delivery` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZSDX_I_DeliveryPartner`, join `ZSDX_B_Address` |
| Source file | `src/zsdx_i_deliverypartneraddr.ddls.asddls` |

## Purpose

Preserve the business key and selected parent population without flattening repeating records.

## Keys

- `DeliveryDocument`
- `DeliveryDocumentItem`
- `PartnerFunction`
- `AddressValidFrom`
- `AddressVersion`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
