# ZCOV_I_COCostWithCostCenter

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | CO Actual Cost with Cost Center |
| Module | link: `cost_actuals` + `cost_center` |
| Batch | 2 |
| Layer | link (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZCOV_I_COActualCost` |
| Source file | `src/zcov_i_cocostwithcostcenter.ddls.asddls` |

## Purpose

CO actual cost cube enriched with cost center master data (category, person responsible, functional area, texts via the dimension).

## Keys

- `SourceLedger`
- `CompanyCode`
- `FiscalYear`
- `AccountingDocument`
- `LedgerGLLineItem`
- `Ledger`

## Associations defined here

- `_CostCenter` → `ZCOV_B_CostCenter` [0..1]

## Access control

Role inherits the conditions of `ZCOV_I_COActualCost`.

## Example use case

Costs per cost center category and person responsible.

## Open verification items

none
