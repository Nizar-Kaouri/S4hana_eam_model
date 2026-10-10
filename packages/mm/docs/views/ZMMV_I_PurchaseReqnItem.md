# ZMMV_I_PurchaseReqnItem

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Purchase Requisition Item |
| Module | `purchase_requisition` |
| Batch | 3 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_PurchaseRequisitionItemAPI01` |
| Source file | `src/zmmv_i_purchasereqnitem.ddls.asddls` |

## Purpose

One row per purchase requisition item: material, plant, purchasing group, requested quantity, delivery date, release status and deletion / closed flags.

## Keys

- `PurchaseRequisition`
- `PurchaseRequisitionItem`

## Associations defined here

- `_Plant` → `I_Plant` [0..1]

## Access control

Role inherits the conditions of `I_PurchaseRequisitionItemAPI01`.

## Example use case

Open requisitions per purchasing group; requisitions for spare parts not yet converted to orders.

## Open verification items

`MM-030`, `MM-031`, `MM-032`, `MM-D05` - see `BATCH_REPORT.md`.
