# ZEMX_I_CapacityHeaderData

> Version **1.0.0**

| | |
|---|---|
| Description | CapacityHeader source data |
| Module | `work_center` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `kako` |
| Source file | `src/zemx_i_capacityheaderdata.ddls.asddls` |

## Purpose

CapacityHeader source data

## Keys

- `CapacityInternalID`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected migration scope; validate keys and row counts before loading.
