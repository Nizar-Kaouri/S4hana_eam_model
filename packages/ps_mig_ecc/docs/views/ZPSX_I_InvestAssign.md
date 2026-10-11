# ZPSX_I_InvestAssign

> Version **1.0.0**

| | |
|---|---|
| Description | InvestAssign |
| Module | `investment_measure` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZPSX_I_InvestAssignData` |
| Source file | `src/zpsx_i_investassign.ddls.asddls` |

## Purpose

Read InvestAssign as source records; approve the key-date population before posting.

## Keys

- `InvestmentPositionInternalID`
- `AssignedObject`
- `ApprovalFiscalYear`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
