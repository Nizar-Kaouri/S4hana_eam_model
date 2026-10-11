# ZSDX_C_SalesItemStatuMig

> Version **1.0.0**

| | |
|---|---|
| Description | SalesItemStatuMig |
| Module | `sales_order` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZSDX_I_SalesItemStatu` |
| Source file | `src/zsdx_c_salesitemstatumig.ddls.asddls` |

## Purpose

Read SalesItemStatuMig as source records; approve the key-date population before posting.

## Keys

- `SalesDocument`
- `SalesDocumentItem`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
