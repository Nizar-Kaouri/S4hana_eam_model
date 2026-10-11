# ZSDX_C_DeliveryPartnerMig

> Version **1.0.0**

| | |
|---|---|
| Description | DeliveryPartnerMig |
| Module | `outbound_delivery` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZSDX_I_DeliveryPartner` |
| Source file | `src/zsdx_c_deliverypartnermig.ddls.asddls` |

## Purpose

Preserve the business key and selected parent population without flattening repeating records.

## Keys

- `DeliveryDocument`
- `DeliveryDocumentItem`
- `PartnerFunction`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
