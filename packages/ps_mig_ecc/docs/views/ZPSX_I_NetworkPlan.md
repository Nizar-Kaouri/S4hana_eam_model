# ZPSX_I_NetworkPlan

> Version **1.0.0**

| | |
|---|---|
| Description | NetworkPlan |
| Module | `network` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZPSX_B_NetworkPlanData` |
| Source file | `src/zpsx_i_networkplan.ddls.asddls` |

## Purpose

Read NetworkPlan as source records; approve the key-date population before posting.

## Keys

- `Network`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
