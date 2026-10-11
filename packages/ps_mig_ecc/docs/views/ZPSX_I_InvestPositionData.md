# ZPSX_I_InvestPositionData

> Version **1.0.0**

| | |
|---|---|
| Description | InvestPositionData |
| Module | `investment_measure` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `impr` |
| Source file | `src/zpsx_i_investpositiondata.ddls.asddls` |

## Purpose

Read InvestPositionData as source records; approve the key-date population before posting.

## Keys

- `InvestmentPositionInternalID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
