# ZCOX_B_InternalOrderData

> Version **1.0.0**

| | |
|---|---|
| Description | InternalOrderData |
| Module | `internal_order` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `aufk` |
| Source file | `src/zcox_b_internalorderdata.ddls.asddls` |

## Purpose

Read InternalOrderData as source records; approve the key-date population before posting.

## Keys

- `InternalOrder`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
