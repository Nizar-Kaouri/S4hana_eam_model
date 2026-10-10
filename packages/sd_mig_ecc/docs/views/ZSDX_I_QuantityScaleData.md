# ZSDX_I_QuantityScaleData

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | QuantityScaleData |
| Module | `pricing_condition` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `konm` |
| Source file | `src/zsdx_i_quantityscaledata.ddls.asddls` |

## Purpose

Read QuantityScaleData as source candidates; approve the key-date population before posting.

## Keys

- `ConditionRecord`
- `ConditionItem`
- `ScaleLine`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`SDX-015` - see `BATCH_REPORT.md`.
