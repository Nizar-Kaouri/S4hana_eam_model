# ZFIT_I_CustomerCompare

> Status: **draft-unverified** · tested release: none (draft, S/4HANA 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | CustomerCompare |
| Module | `customer` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_Customer` |
| Source file | `src/zfit_i_customercompare.ddls.asddls` |

## Purpose

Read CustomerCompare as target comparison candidates.

## Keys

- `Customer`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`FIT-007` - see `BATCH_REPORT.md`.
