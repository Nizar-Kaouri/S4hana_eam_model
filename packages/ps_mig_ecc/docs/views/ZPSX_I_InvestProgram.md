# ZPSX_I_InvestProgram

> Version **1.0.0**

| | |
|---|---|
| Description | InvestProgram |
| Module | `investment_measure` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZPSX_I_InvestProgramData` |
| Source file | `src/zpsx_i_investprogram.ddls.asddls` |

## Purpose

Read InvestProgram as source records; approve the key-date population before posting.

## Keys

- `InvestmentProgram`
- `ApprovalFiscalYear`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
