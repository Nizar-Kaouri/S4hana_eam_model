# ZSDT_I_BillingCount

> Version **1.0.0**

| | |
|---|---|
| Description | BillingCount |
| Module | `billing_document` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZSDT_B_BillingCompare` |
| Source file | `src/zsdt_i_billingcount.ddls.asddls` |

## Purpose

Read BillingCount as target comparison records.

## Keys

- `BillingDocument`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
