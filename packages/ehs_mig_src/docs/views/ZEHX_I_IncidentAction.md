# ZEHX_I_IncidentAction

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | IncidentAction |
| Module | `incident` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZEHX_B_IncidentActionData` |
| Source file | `src/zehx_i_incidentaction.ddls.asddls` |

## Purpose

Read IncidentAction as source candidates; approve the key-date population before posting.

## Keys

- `ActionUUID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only native extraction without DCL. Restrict and test authorized CDS extraction channels and current-client isolation. Table display authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

none
