# ZPPX_I_RoutingMateria

> Version **1.0.0**

| | |
|---|---|
| Description | RoutingMateria |
| Module | `routing` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZPPX_B_RoutingMateriaData` |
| Source file | `src/zppx_i_routingmateria.ddls.asddls` |

## Purpose

Read RoutingMateria as source records; approve the key-date population before posting.

## Keys

- `Material`
- `Plant`
- `TaskListType`
- `TaskListGroup`
- `TaskListGroupCounter`
- `InternalCounter`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
