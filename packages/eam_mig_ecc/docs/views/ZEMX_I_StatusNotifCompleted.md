# ZEMX_I_StatusNotifCompleted

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Objects with status notification completed (NOCO) |
| Module | `core` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `jest` |
| Source file | `src/zemx_i_statusnotifcompleted.ddls.asddls` |

## Purpose

Object numbers whose system status I0072 - notification completed (NOCO) - is active; joined by the composite views to derive the scope flags.

## Keys

- `objnr`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Check whether order object number OR000004000001 carries I0072.

## Open verification items

none
