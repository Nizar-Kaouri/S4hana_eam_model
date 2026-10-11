# ZFIX_I_CustomerCompanData

> Version **1.0.0**

| | |
|---|---|
| Description | CustomerCompanData |
| Module | `customer` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `knb1` |
| Source file | `src/zfix_i_customercompandata.ddls.asddls` |

## Purpose

Read CustomerCompanData as source records; approve the key-date population before posting.

## Keys

- `Customer`
- `CompanyCode`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
