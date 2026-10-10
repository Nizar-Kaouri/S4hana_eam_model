# ZCOX_I_CostCenterData

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | CostCenterData |
| Module | `cost_center` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `csks` |
| Source file | `src/zcox_i_costcenterdata.ddls.asddls` |

## Purpose

Read CostCenterData as source candidates; approve the key-date population before posting.

## Keys

- `ControllingArea`
- `CostCenter`
- `ValidityEndDate`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`COX-001` - see `BATCH_REPORT.md`.
