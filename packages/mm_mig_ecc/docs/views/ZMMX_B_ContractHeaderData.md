# ZMMX_B_ContractHeaderData

> Version **1.0.0**

| | |
|---|---|
| Description | ContractHeaderData |
| Module | `purchasing_contract` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `ekko` |
| Source file | `src/zmmx_b_contractheaderdata.ddls.asddls` |

## Purpose

Read ContractHeaderData as source records; approve the key-date population before posting.

## Keys

- `PurchasingContract`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
