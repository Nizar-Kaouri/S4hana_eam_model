# ZSDX_I_SalesFlow

> Version **1.0.0**

| | |
|---|---|
| Description | SalesFlow |
| Module | `sales_order` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZSDX_I_SalesFlowData` |
| Source file | `src/zsdx_i_salesflow.ddls.asddls` |

## Purpose

Read SalesFlow as source records; approve the key-date population before posting.

## Keys

- `PrecedingDocument`
- `PrecedingDocumentItem`
- `SubsequentDocument`
- `SubsequentDocumentItem`
- `SubsequentDocumentCategory`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
