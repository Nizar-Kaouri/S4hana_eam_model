# ZMMV_I_PurchaseReqnItem

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Purchase Requisition - Cube |
| Module | `purchase_requisition` |
| Batch | 3 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | #CUBE |
| Data source | `ZMMV_B_PurchaseReqnItem` |
| Source file | `src/zmmv_i_purchasereqnitem.ddls.asddls` |

## Purpose

Requisition cube: number of items, open items and requested quantity per plant, purchasing group and release status.

## Keys

- `PurchaseRequisition`
- `PurchaseRequisitionItem`

## Associations defined here

- none

## Access control

Role inherits the conditions of `ZMMV_B_PurchaseReqnItem`.

## Example use case

Open requisition items per purchasing group and plant.

## Open verification items

none
