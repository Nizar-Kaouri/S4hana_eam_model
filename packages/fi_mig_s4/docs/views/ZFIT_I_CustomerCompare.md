# ZFIT_I_CustomerCompare

> Version **1.0.0**

| | |
|---|---|
| Description | CustomerCompare |
| Module | `customer` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view entity |
| Data category | - |
| Data source | `I_Customer` |
| Source file | `src/zfit_i_customercompare.ddls.asddls` |

## Purpose

Read CustomerCompare as target comparison records.

## Keys

- `Customer`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
