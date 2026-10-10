# ZCOV_R_CostCenterYTD

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Cost Center Costs Year to Date |
| Module | `rpt_cost_center_ytd` |
| Batch | 3 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZCOV_I_COJournalItem` |
| Source file | `src/zcov_r_costcenterytd.ddls.asddls` |

## Purpose

Cost center year-to-date cube (parameters fiscal year, prior fiscal year, to period): costs of the current and prior year for the same periods per cost center and cost element.

## Parameters

- `P_FiscalYear` : `abap.numc(`
- `P_PriorFiscalYear` : `abap.numc(`
- `P_ToFiscalPeriod` : `abap.numc(`

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

Role inherits the conditions of `ZCOV_I_COJournalItem`.

## Example use case

Cost center report YTD vs. prior year for period 9.

## Open verification items

`CO-R01` - see `BATCH_REPORT.md`.
