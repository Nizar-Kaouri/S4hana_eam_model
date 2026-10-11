# ZSDX_C_BillingMig

> Version **1.0.0**

| | |
|---|---|
| Description | BillingMig |
| Module | `billing_document` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZSDX_I_Billing` |
| Source file | `src/zsdx_c_billingmig.ddls.asddls` |

## Purpose

Read BillingMig as source records; approve the key-date population before posting.

## Keys

- `BillingDocument`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
