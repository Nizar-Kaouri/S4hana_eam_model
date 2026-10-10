# ZCOT_I_InternalOrderCompare

> Status: **draft-unverified** · tested release: none (draft, S/4HANA 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | InternalOrderCompare |
| Module | `internal_order` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_InternalOrder` |
| Source file | `src/zcot_i_internalordercompare.ddls.asddls` |

## Purpose

Read InternalOrderCompare as target comparison candidates.

## Keys

- `InternalOrder`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`COT-005` - see `BATCH_REPORT.md`.
