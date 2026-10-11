# ZSDX_B_ConditionHdrData

> Version **1.0.0**

| | |
|---|---|
| Description | ConditionHdrData |
| Module | `pricing_condition` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `konh` |
| Source file | `src/zsdx_b_conditionhdrdata.ddls.asddls` |

## Purpose

Read ConditionHdrData as source records; approve the key-date population before posting.

## Keys

- `ConditionRecord`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
