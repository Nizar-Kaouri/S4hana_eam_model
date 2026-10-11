# ZCOX_I_OrderSettlemenData

> Version **1.0.0**

| | |
|---|---|
| Description | OrderSettlemenData |
| Module | `internal_order` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `cobrb` |
| Source file | `src/zcox_i_ordersettlemendata.ddls.asddls` |

## Purpose

Read OrderSettlemenData as source records; approve the key-date population before posting.

## Keys

- `ObjectNumber`
- `DistributionRuleGroup`
- `DistributionRule`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
