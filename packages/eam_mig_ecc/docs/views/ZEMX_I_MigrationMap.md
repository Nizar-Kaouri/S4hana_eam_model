# ZEMX_I_MigrationMap

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Migration value and key map |
| Module | `core` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `zemx_map` |
| Source file | `src/zemx_i_migrationmap.ddls.asddls` |

## Purpose

Customer-maintained translation table (map name, old value, new value) used by every consumption view; a value without an entry is delivered unchanged.

## Keys

- `map_name`
- `source_value`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Map plant 1000 to P100: insert MAP_NAME = 'PLANT', SOURCE_VALUE = '1000', TARGET_VALUE = 'P100' into ZEMX_MAP.

## Open verification items

`XGEN-002`, `XGEN-004` - see `BATCH_REPORT.md`.
