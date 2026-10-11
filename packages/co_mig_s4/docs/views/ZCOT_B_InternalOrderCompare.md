# ZCOT_B_InternalOrderCompare

> Version **1.0.0**

| | |
|---|---|
| Description | InternalOrderCompare |
| Module | `internal_order` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_InternalOrder` |
| Source file | `src/zcot_b_internalordercompare.ddls.asddls` |

## Purpose

Read InternalOrderCompare as target comparison records.

## Keys

- `InternalOrder`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
