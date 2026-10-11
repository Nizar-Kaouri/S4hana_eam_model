# ZFIT_I_CustomerCount

> Version **1.0.0**

| | |
|---|---|
| Description | CustomerCount |
| Module | `customer` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view entity |
| Data category | - |
| Data source | `ZFIT_I_CustomerCompare` |
| Source file | `src/zfit_i_customercount.ddls.asddls` |

## Purpose

Read CustomerCount as target comparison records.

## Keys

- `Customer`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
