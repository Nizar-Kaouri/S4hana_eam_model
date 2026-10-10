# ZSDT_I_DeliveryCompare

> Status: **draft-unverified** · tested release: none (draft, S/4HANA 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | DeliveryCompare |
| Module | `outbound_delivery` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_DeliveryDocument` |
| Source file | `src/zsdt_i_deliverycompare.ddls.asddls` |

## Purpose

Read DeliveryCompare as target comparison candidates.

## Keys

- `DeliveryDocument`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`SDT-009` - see `BATCH_REPORT.md`.
