# ZMMX_I_SalesOrderStocData

> Version **1.0.0**

| | |
|---|---|
| Description | SalesOrderStocData |
| Module | `material_stock` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `mska` |
| Source file | `src/zmmx_i_salesorderstocdata.ddls.asddls` |

## Purpose

Read SalesOrderStocData as source records; approve the key-date population before posting.

## Keys

- `Product`
- `Plant`
- `StorageLocation`
- `Batch`
- `SpecialStock`
- `SalesOrder`
- `SalesOrderItem`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
