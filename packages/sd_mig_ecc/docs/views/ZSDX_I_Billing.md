# ZSDX_I_Billing

> Version **1.0.0**

| | |
|---|---|
| Description | Billing |
| Module | `billing_document` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZSDX_B_BillingData` |
| Source file | `src/zsdx_i_billing.ddls.asddls` |

## Purpose

Read Billing as source records; approve the key-date population before posting.

## Keys

- `BillingDocument`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
