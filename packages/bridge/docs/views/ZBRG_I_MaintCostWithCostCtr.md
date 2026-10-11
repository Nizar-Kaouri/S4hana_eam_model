# ZBRG_I_MaintCostWithCostCtr

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Cost with Cost Center |
| Module | bridge: `co:cost_center` + `eam:rpt_order_cost` |
| Batch | 1 |
| Layer | link (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZEAM_I_MaintOrderCost` |
| Source file | `src/zbrg_i_maintcostwithcostctr.ddls.asddls` |

## Purpose

Maintenance order actual costs enriched with the master data of the order's responsible cost center (category, person responsible, texts via the dimension).

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

Role inherits the conditions of `ZEAM_I_MaintOrderCost`.

## Example use case

Maintenance cost per cost center category and person responsible.

## Open verification items

none
