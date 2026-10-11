# ZFCT_I_CreditExposureCompare

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | CreditExposureCompare |
| Module | `credit_exposure` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ukm_totals` |
| Source file | `src/zfct_i_creditexposurecompare.ddls.asddls` |

## Purpose

Read CreditExposureCompare as target comparison candidates.

## Keys

- `BusinessPartner`
- `CreditSegment`
- `ExposureCategory`
- `Currency`

## Associations defined here

- none

## Access control

No DCL by design: Read-only native extraction without DCL. Restrict and test authorized CDS extraction channels and current-client isolation. Table display authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`FCT-004` - see `BATCH_REPORT.md`.
