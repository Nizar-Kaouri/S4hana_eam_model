# ZPSV_I_ProjectCostWithMaster

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Project Cost with Project Master |
| Module | link: `project` + `project_cost` + `wbs_element` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZPSV_I_ProjectCost` |
| Source file | `src/zpsv_i_projectcostwithmaster.ddls.asddls` |

## Purpose

Project cost cube enriched with WBS element and project master data (external numbers, responsible cost center, project profile and status).

## Keys

- `SourceLedger`
- `CompanyCode`
- `FiscalYear`
- `AccountingDocument`
- `LedgerGLLineItem`
- `Ledger`

## Associations defined here

- `_WBSElement` → `ZPSV_B_WBSElement` [0..1]
- `_Project` → `ZPSV_B_Project` [0..1]

## Access control

Role inherits the conditions of `ZPSV_I_ProjectCost`.

## Example use case

Actual cost per project profile and responsible cost center.

## Open verification items

none
