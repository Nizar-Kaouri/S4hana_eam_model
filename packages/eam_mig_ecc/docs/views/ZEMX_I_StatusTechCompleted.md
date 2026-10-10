# ZEMX_I_StatusTechCompleted

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Objects with status technically completed (TECO) |
| Module | `core` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `jest` |
| Source file | `src/zemx_i_statustechcompleted.ddls.asddls` |

## Purpose

Object numbers whose system status I0045 - technically completed (TECO) - is active; joined by the composite views to derive the scope flags.

## Keys

- `objnr`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Check whether order object number OR000004000001 carries I0045.

## Open verification items

none
