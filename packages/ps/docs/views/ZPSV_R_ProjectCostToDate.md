# ZPSV_R_ProjectCostToDate

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Project Cost to Date |
| Module | `rpt_project_cost_to_date` |
| Batch | 3 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZPSV_I_ProjectJournalItem` |
| Source file | `src/zpsv_r_projectcosttodate.ddls.asddls` |

## Purpose

Project cost to date at a key date (parameter): cumulative actual cost, settled amount and balance per WBS element and ledger.

## Parameters

- `P_KeyDate` : `abap.dats`

## Keys

- `CompanyCode`
- `WBSElementInternalID`
- `Ledger`
- `CompanyCodeCurrency`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZPSV_I_ProjectJournalItem`.

## Example use case

Cost to date per WBS element at month end; WBS elements with unsettled balance.

## Open verification items

`PS-D04`, `PS-R01` - see `BATCH_REPORT.md`.
