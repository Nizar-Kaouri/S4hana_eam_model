# ZPSX_I_NetworkPlanData

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | NetworkPlanData |
| Module | `network` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `afko` |
| Source file | `src/zpsx_i_networkplandata.ddls.asddls` |

## Purpose

Read NetworkPlanData as source candidates; approve the key-date population before posting.

## Keys

- `Network`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`PSX-006` - see `BATCH_REPORT.md`.
