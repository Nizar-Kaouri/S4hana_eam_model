# ZCOX_I_CostActual

> Version **1.0.0**

| | |
|---|---|
| Description | CostActual |
| Module | `cost_actuals` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZCOX_I_CostActualData` |
| Source file | `src/zcox_i_costactual.ddls.asddls` |

## Purpose

Read CostActual as source records; approve the key-date population before posting.

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
