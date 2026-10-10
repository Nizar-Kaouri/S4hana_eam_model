# ZEMX_I_UserStatusText

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | User status text (migration extract) |
| Module | `object_status` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #TEXT |
| Data source | `tj30t` |
| Source file | `src/zemx_i_userstatustext.ddls.asddls` |

## Purpose

Short and long texts of user statuses per status profile: the basis of the user status value map.

## Keys

- `stsma`
- `estat`
- `spras`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Build the value map 'user_status': list all statuses of profile PM000001.

## Open verification items

`XST-003` - see `BATCH_REPORT.md`.
