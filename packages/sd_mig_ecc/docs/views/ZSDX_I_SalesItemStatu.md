# ZSDX_I_SalesItemStatu

> Version **1.0.0**

| | |
|---|---|
| Description | SalesItemStatu |
| Module | `sales_order` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZSDX_B_SalesItemStatuData` |
| Source file | `src/zsdx_i_salesitemstatu.ddls.asddls` |

## Purpose

Read SalesItemStatu as source records; approve the key-date population before posting.

## Keys

- `SalesDocument`
- `SalesDocumentItem`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
