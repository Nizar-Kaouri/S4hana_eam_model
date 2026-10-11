# ZQMX_C_SamplingProcMigCount

> Version **1.0.0**

| | |
|---|---|
| Description | SamplingProcMigCount |
| Module | `sampling_procedure` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZQMX_C_SamplingProcMig` |
| Source file | `src/zqmx_c_samplingprocmigcount.ddls.asddls` |

## Purpose

Read SamplingProcMigCount as source records; approve the key-date population before posting.

## Keys

- `SamplingProcedure`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
