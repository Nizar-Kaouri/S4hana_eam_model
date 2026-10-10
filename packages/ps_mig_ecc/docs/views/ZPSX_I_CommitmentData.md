# ZPSX_I_CommitmentData

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | CommitmentData |
| Module | `commitment` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `cooi` |
| Source file | `src/zpsx_i_commitmentdata.ddls.asddls` |

## Purpose

Read CommitmentData as source candidates; approve the key-date population before posting.

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

## Open verification items

`PSX-011` - see `BATCH_REPORT.md`.
