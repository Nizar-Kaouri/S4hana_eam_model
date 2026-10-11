# ZEHX_C_IncidentMigCount

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | IncidentMigCount |
| Module | `incident` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEHX_C_IncidentMig` |
| Source file | `src/zehx_c_incidentmigcount.ddls.asddls` |

## Purpose

Read IncidentMigCount as source candidates; approve the key-date population before posting.

## Keys

- none (transient / aggregated)

## Associations defined here

- none

## Access control

No DCL by design: Read-only native extraction without DCL. Restrict and test authorized CDS extraction channels and current-client isolation. Table display authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

none
