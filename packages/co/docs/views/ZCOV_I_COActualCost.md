# ZCOV_I_COActualCost

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | CO Actual Cost - Cube |
| Module | `cost_actuals` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZCOV_B_COJournalItem` |
| Source file | `src/zcov_i_coactualcost.ddls.asddls` |

## Purpose

CO actual cost cube: primary, secondary and total costs per cost center, order, WBS element, profit center, cost element and period.

## Keys

- `SourceLedger`
- `CompanyCode`
- `FiscalYear`
- `AccountingDocument`
- `LedgerGLLineItem`
- `Ledger`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZCOV_B_COJournalItem`.

## Example use case

Cost center report per period; secondary cost allocations between cost centers.

## Open verification items

none
