# ZPSX_I_NetworkQuantitData

> Version **1.0.0**

| | |
|---|---|
| Description | NetworkQuantitData |
| Module | `network` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `afvv` |
| Source file | `src/zpsx_i_networkquantitdata.ddls.asddls` |

## Purpose

Read NetworkQuantitData as source records; approve the key-date population before posting.

## Keys

- `RoutingNumber`
- `OperationInternalID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
