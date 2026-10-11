# ZPSX_B_InvestProgramData

> Version **1.0.0**

| | |
|---|---|
| Description | InvestProgramData |
| Module | `investment_measure` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `imtp` |
| Source file | `src/zpsx_b_investprogramdata.ddls.asddls` |

## Purpose

Read InvestProgramData as source records; approve the key-date population before posting.

## Keys

- `InvestmentProgram`
- `ApprovalFiscalYear`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
