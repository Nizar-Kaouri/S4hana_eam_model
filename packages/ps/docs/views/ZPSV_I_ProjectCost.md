# ZPSV_I_ProjectCost

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Project Cost - Cube |
| Module | `project_cost` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZPSV_B_ProjectJournalItem` |
| Source file | `src/zpsv_i_projectcost.ddls.asddls` |

## Purpose

Project cost cube: actual cost before settlement, settlement and remaining balance per WBS element, project, cost element and period.

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

Role inherits the conditions of `ZPSV_B_ProjectJournalItem`.

## Example use case

Actual cost per project and fiscal period; WBS elements with costs not yet settled.

## Open verification items

none
