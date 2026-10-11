# ZSDX_I_ConditionHdr

> Version **1.0.0**

| | |
|---|---|
| Description | ConditionHdr |
| Module | `pricing_condition` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZSDX_B_ConditionHdrData` |
| Source file | `src/zsdx_i_conditionhdr.ddls.asddls` |

## Purpose

Read ConditionHdr as source records; approve the key-date population before posting.

## Keys

- `ConditionRecord`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
