# ZSDX_I_BillingItem

> Version **1.0.0**

| | |
|---|---|
| Description | BillingItem |
| Module | `billing_document` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZSDX_I_BillingItemData` |
| Source file | `src/zsdx_i_billingitem.ddls.asddls` |

## Purpose

Read BillingItem as source records; approve the key-date population before posting.

## Keys

- `BillingDocument`
- `BillingDocumentItem`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
