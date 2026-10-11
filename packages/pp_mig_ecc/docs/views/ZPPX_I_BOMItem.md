# ZPPX_I_BOMItem

> Version **1.0.0**

| | |
|---|---|
| Description | BOMItem |
| Module | `bill_of_material` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZPPX_B_BOMItemData` |
| Source file | `src/zppx_i_bomitem.ddls.asddls` |

## Purpose

Read BOMItem as source records; approve the key-date population before posting.

## Keys

- `BOMCategory`
- `BillOfMaterial`
- `BOMNode`
- `InternalCounter`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
