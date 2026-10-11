# ZEHT_B_SpecIdentifierCompare

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | SpecIdentifierCompare |
| Module | `specification` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `estri` |
| Source file | `src/zeht_b_specidentifiercompare.ddls.asddls` |

## Purpose

Read SpecIdentifierCompare as target comparison candidates.

## Keys

- `RecordNumber`
- `ChangeState`

## Associations defined here

- none

## Access control

No DCL by design: Read-only native migration extraction without DCL. Restrict the CDS extraction channel to authorized migration users; native table display authorization alone does not protect every CDS consumer. Verify business authorization and current-client isolation on SAP.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`EHT-006` - see `BATCH_REPORT.md`.
