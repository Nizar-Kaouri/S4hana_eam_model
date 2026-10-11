# ZSDT_I_DeliveryCount

> Version **1.0.0**

| | |
|---|---|
| Description | DeliveryCount |
| Module | `outbound_delivery` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZSDT_I_DeliveryCompare` |
| Source file | `src/zsdt_i_deliverycount.ddls.asddls` |

## Purpose

Read DeliveryCount as target comparison records.

## Keys

- `DeliveryDocument`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
