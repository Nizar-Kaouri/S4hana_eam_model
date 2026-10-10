# ZCOV_R_COCostWithProfitCtr

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | CO Actual Cost with Profit Center |
| Module | link: `cost_actuals` + `profit_center` |
| Batch | 2 |
| Layer | link (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZCOV_R_COActualCost` |
| Source file | `src/zcov_r_cocostwithprofitctr.ddls.asddls` |

## Purpose

CO actual cost cube enriched with profit center master data (segment, person responsible, texts via the dimension).

## Keys

- `SourceLedger`
- `CompanyCode`
- `FiscalYear`
- `AccountingDocument`
- `LedgerGLLineItem`
- `Ledger`

## Associations defined here

- `_ProfitCenter` → `ZCOV_I_ProfitCenter` [0..1]

## Access control

Role inherits the conditions of `ZCOV_R_COActualCost`.

## Example use case

Costs per profit center segment.

## Open verification items

none
