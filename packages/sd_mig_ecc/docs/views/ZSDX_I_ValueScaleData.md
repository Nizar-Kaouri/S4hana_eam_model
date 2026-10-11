# ZSDX_I_ValueScaleData

> Version **1.0.0**

| | |
|---|---|
| Description | ValueScaleData |
| Module | `pricing_condition` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `konw` |
| Source file | `src/zsdx_i_valuescaledata.ddls.asddls` |

## Purpose

Read ValueScaleData as source records; approve the key-date population before posting.

## Keys

- `ConditionRecord`
- `ConditionItem`
- `ScaleLine`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
