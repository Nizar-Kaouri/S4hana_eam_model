# ZSDX_I_ConditionItem

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | ConditionItem |
| Module | `pricing_condition` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZSDX_I_ConditionItemData` |
| Source file | `src/zsdx_i_conditionitem.ddls.asddls` |

## Purpose

Read ConditionItem as source candidates; approve the key-date population before posting.

## Keys

- `ConditionRecord`
- `ConditionItem`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

none
