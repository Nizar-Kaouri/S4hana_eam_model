# ZSDT_I_BillingCompare

> Status: **draft-unverified** · tested release: none (draft, S/4HANA 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | BillingCompare |
| Module | `billing_document` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_BillingDocument` |
| Source file | `src/zsdt_i_billingcompare.ddls.asddls` |

## Purpose

Read BillingCompare as target comparison candidates.

## Keys

- `BillingDocument`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`SDT-011` - see `BATCH_REPORT.md`.
