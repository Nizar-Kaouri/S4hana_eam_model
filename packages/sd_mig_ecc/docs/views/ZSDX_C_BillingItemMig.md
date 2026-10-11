# ZSDX_C_BillingItemMig

> Version **1.0.0**

| | |
|---|---|
| Description | BillingItemMig |
| Module | `billing_document` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZSDX_I_BillingItem` |
| Source file | `src/zsdx_c_billingitemmig.ddls.asddls` |

## Purpose

Read BillingItemMig as source records; approve the key-date population before posting.

## Keys

- `BillingDocument`
- `BillingDocumentItem`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
