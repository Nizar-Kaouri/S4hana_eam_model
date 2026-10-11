# ZPSX_C_ProjectCostMig

> Version **1.0.0**

| | |
|---|---|
| Description | ProjectCostMig |
| Module | `project_cost` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZPSX_I_ProjectCost` |
| Source file | `src/zpsx_c_projectcostmig.ddls.asddls` |

## Purpose

Read ProjectCostMig as source records; approve the key-date population before posting.

## Keys

- `ControllingArea`
- `COAccountingDocument`
- `COAccountingDocumentItem`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
