# ZEMX_I_EquipmentDesc

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Equipment description |
| Module | `equipment` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #TEXT |
| Data source | `eqkt` |
| Source file | `src/zemx_i_equipmentdesc.ddls.asddls` |

## Purpose

Equipment descriptions (EQKT) per language with the long-text indicator.

## Keys

- `equnr`
- `spras`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the English description of equipment 10000001.

## Open verification items

none
