# ZPSX_I_ProjectCostData

> Version **1.0.0**

| | |
|---|---|
| Description | ProjectCostData |
| Module | `project_cost` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `coep` |
| Source file | `src/zpsx_i_projectcostdata.ddls.asddls` |

## Purpose

Read ProjectCostData as source records; approve the key-date population before posting.

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
