# ZSDX_C_DeliveryMig

> Version **1.0.0**

| | |
|---|---|
| Description | DeliveryMig |
| Module | `outbound_delivery` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZSDX_I_Delivery` |
| Source file | `src/zsdx_c_deliverymig.ddls.asddls` |

## Purpose

Read DeliveryMig as source records; approve the key-date population before posting.

## Keys

- `DeliveryDocument`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
