# ZPSX_C_CommitmentMig

> Version **1.0.0**

| | |
|---|---|
| Description | CommitmentMig |
| Module | `commitment` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZPSX_I_Commitment` |
| Source file | `src/zpsx_c_commitmentmig.ddls.asddls` |

## Purpose

Read CommitmentMig as source records; approve the key-date population before posting.

## Keys

- `ObjectNumber`
- `FiscalYear`
- `ValueType`
- `Version`
- `CostElement`
- `OriginGroup`
- `BusinessTransaction`
- `CommitmentDocument`
- `CommitmentItem`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
