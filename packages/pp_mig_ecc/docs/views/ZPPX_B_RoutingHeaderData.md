# ZPPX_B_RoutingHeaderData

> Version **1.0.0**

| | |
|---|---|
| Description | RoutingHeaderData |
| Module | `routing` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `plko` |
| Source file | `src/zppx_b_routingheaderdata.ddls.asddls` |

## Purpose

Read RoutingHeaderData as source records; approve the key-date population before posting.

## Keys

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
