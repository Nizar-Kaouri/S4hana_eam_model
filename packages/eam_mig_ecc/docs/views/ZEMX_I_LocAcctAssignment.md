# ZEMX_I_LocAcctAssignment

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Location and account assignment |
| Module | `core` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `iloa` |
| Source file | `src/zemx_i_locacctassignment.ddls.asddls` |

## Purpose

Location and account assignment data (ILOA) shared by functional locations, equipment, notifications, orders and maintenance items.

## Keys

- `iloan`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the plant section and cost center of location record 0000123456.

## Open verification items

`XFL-004` - see `BATCH_REPORT.md`.
