# ZFCT_I_CreditExposureCount

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | CreditExposureCount |
| Module | `credit_exposure` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZFCT_B_CreditExposureCompare` |
| Source file | `src/zfct_i_creditexposurecount.ddls.asddls` |

## Purpose

Read CreditExposureCount as target comparison candidates.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Read-only native extraction without DCL. Restrict and test authorized CDS extraction channels and current-client isolation. Table display authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

none
