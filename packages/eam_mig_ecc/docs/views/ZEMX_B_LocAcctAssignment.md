# ZEMX_B_LocAcctAssignment

> Version **1.0.0**

| | |
|---|---|
| Description | Location and account assignment |
| Module | `core` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #DIMENSION |
| Data source | `iloa` |
| Source file | `src/zemx_b_locacctassignment.ddls.asddls` |

## Purpose

Location and account assignment data (ILOA) shared by functional locations, equipment, notifications, orders and maintenance items.

## Keys

- `LocAcctAssignment`

## Associations defined here

- none

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Read the plant section and cost center of location record 0000123456.
