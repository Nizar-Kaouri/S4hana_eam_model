# ZSDX_I_SalesPartner

> Version **1.0.0**

| | |
|---|---|
| Description | SalesPartner |
| Module | `sales_order` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZSDX_I_SalesPartnerData` |
| Source file | `src/zsdx_i_salespartner.ddls.asddls` |

## Purpose

Read SalesPartner as source records; approve the key-date population before posting.

## Keys

- `SalesDocument`
- `SalesDocumentItem`
- `PartnerFunction`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
