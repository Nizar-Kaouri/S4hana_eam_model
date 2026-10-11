# ZSDX_I_DeliveryStatus

> Version **1.0.0**

| | |
|---|---|
| Description | DeliveryStatus |
| Module | `outbound_delivery` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZSDX_B_DeliveryStatusData`, join `ZSDX_I_Delivery` |
| Source file | `src/zsdx_i_deliverystatus.ddls.asddls` |

## Purpose

Preserve the business key and selected parent population without flattening repeating records.

## Keys

- `DeliveryDocument`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
