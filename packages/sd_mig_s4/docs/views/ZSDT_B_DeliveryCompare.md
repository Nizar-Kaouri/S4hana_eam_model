# ZSDT_B_DeliveryCompare

> Version **1.0.0**

| | |
|---|---|
| Description | DeliveryCompare |
| Module | `outbound_delivery` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_DeliveryDocument` |
| Source file | `src/zsdt_b_deliverycompare.ddls.asddls` |

## Purpose

Read DeliveryCompare as target comparison records.

## Keys

- `DeliveryDocument`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
