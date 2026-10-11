# ZSDX_C_ValueScaleMig

> Version **1.0.0**

| | |
|---|---|
| Description | ValueScaleMig |
| Module | `pricing_condition` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZSDX_I_ValueScale` |
| Source file | `src/zsdx_c_valuescalemig.ddls.asddls` |

## Purpose

Read ValueScaleMig as source records; approve the key-date population before posting.

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
