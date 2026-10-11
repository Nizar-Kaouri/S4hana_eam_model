# ZPSV_B_ProjectJournalItem

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Project Journal Item |
| Module | `project_cost` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_JournalEntryItem` |
| Source file | `src/zpsv_b_projectjournalitem.ddls.asddls` |

## Purpose

Universal Journal line items posted on a WBS element (all ledgers), with project, G/L account (cost element), period, business transaction and amounts; settlement postings flagged.

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

Actual cost per WBS element and cost element; settlement to assets or cost centers.

## Open verification items

`PS-020`, `PS-021`, `PS-D03`, `RPT-C04` - see `BATCH_REPORT.md`.
