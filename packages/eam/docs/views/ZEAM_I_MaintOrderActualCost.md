# ZEAM_I_MaintOrderActualCost

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance Order Actual Cost Item |
| Module | `rpt_order_cost` |
| Batch | 4 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_JournalEntryItem` |
| Source file | `src/zeam_i_maintorderactualcost.ddls.asddls` |

## Purpose

Actual cost line items posted on orders (Universal Journal, leading ledger), without order settlement credits; one row per journal entry item.

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

Role inherits the conditions of `I_JournalEntryItem`.

## Example use case

Actual maintenance costs per order, cost element (G/L account) and period.

## Open verification items

`RPT-C01`, `RPT-C02`, `RPT-C03`, `RPT-C04`, `RPT-C06` - see `BATCH_REPORT.md`.
