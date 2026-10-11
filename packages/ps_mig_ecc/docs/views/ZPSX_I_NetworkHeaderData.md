# ZPSX_I_NetworkHeaderData

> Version **1.0.0**

| | |
|---|---|
| Description | NetworkHeaderData |
| Module | `network` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `aufk` |
| Source file | `src/zpsx_i_networkheaderdata.ddls.asddls` |

## Purpose

Read NetworkHeaderData as source records; approve the key-date population before posting.

## Keys

- `Network`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
