# ZEMX_I_EquipSerialStockData

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | EquipSerialStock source data |
| Module | `equipment` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `eqbs` |
| Source file | `src/zemx_i_equipserialstockdata.ddls.asddls` |

## Purpose

EquipSerialStock source data

## Keys

- `equnr`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Export the selected migration scope; validate keys and row counts before loading.

## Open verification items

`XADD-51` - see `BATCH_REPORT.md`.
