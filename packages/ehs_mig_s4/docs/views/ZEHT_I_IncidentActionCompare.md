# ZEHT_I_IncidentActionCompare

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been activated on a system.

| | |
|---|---|
| Description | IncidentActionCompare |
| Module | `incident` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `ehhssd_iac_root` |
| Source file | `src/zeht_i_incidentactioncompare.ddls.asddls` |

## Purpose

Read IncidentActionCompare as target comparison candidates.

## Keys

- `ActionUUID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only native extraction without DCL. Restrict and test authorized CDS extraction channels and current-client isolation. Table display authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

`EHT-012` - see `BATCH_REPORT.md`.
