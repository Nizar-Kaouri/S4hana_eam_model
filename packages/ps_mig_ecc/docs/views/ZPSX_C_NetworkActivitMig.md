# ZPSX_C_NetworkActivitMig

> Version **1.0.0**

| | |
|---|---|
| Description | NetworkActivitMig |
| Module | `network` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZPSX_I_NetworkActivit` |
| Source file | `src/zpsx_c_networkactivitmig.ddls.asddls` |

## Purpose

Read NetworkActivitMig as source records; approve the key-date population before posting.

## Keys

- `RoutingNumber`
- `OperationInternalID`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
