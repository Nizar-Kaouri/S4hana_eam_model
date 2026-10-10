# ZSDX_I_BillingData

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | BillingData |
| Module | `billing_document` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `vbrk` |
| Source file | `src/zsdx_i_billingdata.ddls.asddls` |

## Purpose

Read BillingData as source candidates; approve the key-date population before posting.

## Keys

- `BillingDocument`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`SDX-011` - see `BATCH_REPORT.md`.
