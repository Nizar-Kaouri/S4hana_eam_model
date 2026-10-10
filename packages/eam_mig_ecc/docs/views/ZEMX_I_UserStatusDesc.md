# ZEMX_I_UserStatusDesc

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | User status description |
| Module | `object_status` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #TEXT |
| Data source | `tj30t` |
| Source file | `src/zemx_i_userstatusdesc.ddls.asddls` |

## Purpose

Short and long texts of user statuses per status profile (TJ30T): reference list of the user statuses in use.

## Keys

- `stsma`
- `estat`
- `spras`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

List all statuses of profile PM000001 .

## Open verification items

`XST-003` - see `BATCH_REPORT.md`.
