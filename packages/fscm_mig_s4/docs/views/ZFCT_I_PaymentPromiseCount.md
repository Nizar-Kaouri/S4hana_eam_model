# ZFCT_I_PaymentPromiseCount

> Status: **draft-unverified** · tested release: none (draft, S/4HANA 2025 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | PaymentPromiseCount |
| Module | `promise_to_pay` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZFCT_I_PaymentPromiseCompare` |
| Source file | `src/zfct_i_paymentpromisecount.ddls.asddls` |

## Purpose

Read PaymentPromiseCount as target comparison candidates.

## Keys

- `SourceSystem`
- `SourceClient`
- `ExportBatch`

## Associations defined here

- none

## Access control

No DCL by design: Administrative staging only. No DCL supplied: restrict table and CDS access to authorized migration users in an isolated client. These views do not inherit native EWM/TM/FSCM/EHS business authorizations. Never expose sensitive staging data through an unrestricted service.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

none
