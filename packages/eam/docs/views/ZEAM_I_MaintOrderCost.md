# ZEAM_I_MaintOrderCost

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Order Cost - Cube |
| Module | `rpt_order_cost` |
| Batch | 4 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZEAM_B_MaintOrderActualCost`, join `ZEAM_B_MaintOrder` |
| Source file | `src/zeam_i_maintordercost.ddls.asddls` |

## Purpose

Maintenance order actual cost cube: Universal Journal amounts (company code and global currency) joined with maintenance order attributes (order type, activity type, planning plant, reference objects, open flag).

## Keys

- `SourceLedger`
- `CompanyCode`
- `FiscalYear`
- `AccountingDocument`
- `LedgerGLLineItem`
- `Ledger`

## Associations defined here

- `_MaintenanceOrder` → `ZEAM_B_MaintOrder` [1..1]

## Access control

Role inherits the conditions of `ZEAM_B_MaintOrderActualCost` and `ZEAM_B_MaintOrder`.

## Example use case

Actual maintenance cost per plant and activity type (preventive vs. corrective) per period.

## Open verification items

`GEN-D03`, `RPT-C05` - see `BATCH_REPORT.md`.
