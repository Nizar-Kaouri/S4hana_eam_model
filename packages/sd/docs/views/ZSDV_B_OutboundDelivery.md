# ZSDV_B_OutboundDelivery

> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Outbound Delivery |
| Module | `outbound_delivery` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | #DIMENSION |
| Data source | `I_DeliveryDocument` |
| Source file | `src/zsdv_b_outbounddelivery.ddls.asddls` |

## Purpose

One row per outbound delivery: type, shipping point, sales organization, sold-to and ship-to party, delivery date, planned and actual goods issue date, goods movement and picking status; derived goods-issue and on-time flags.

## Keys

- `DeliveryDocument`

## Associations defined here

- none

## Access control

Role inherits the conditions of `I_DeliveryDocument`.

## Example use case

On-time delivery rate per shipping point; deliveries without goods issue.

## Open verification items

`SD-010`, `SD-011`, `SD-D03` - see `BATCH_REPORT.md`.
