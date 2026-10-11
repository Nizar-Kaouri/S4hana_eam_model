# ZFCX_B_CreditExposureData

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | CreditExposureData |
| Module | `credit_exposure` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `ukm_totals` |
| Source file | `src/zfcx_b_creditexposuredata.ddls.asddls` |

## Purpose

Read CreditExposureData as source candidates; approve the key-date population before posting.

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

`FCX-004` - see `BATCH_REPORT.md`.
