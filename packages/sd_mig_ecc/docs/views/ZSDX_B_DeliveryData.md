# ZSDX_B_DeliveryData

> Version **1.0.0**

| | |
|---|---|
| Description | DeliveryData |
| Module | `outbound_delivery` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `likp` |
| Source file | `src/zsdx_b_deliverydata.ddls.asddls` |

## Purpose

Read DeliveryData as source records; approve the key-date population before posting.

## Keys

- `DeliveryDocument`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
