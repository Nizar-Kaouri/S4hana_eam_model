# ZEMX_I_OrderMasterData

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Order master data |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `aufk` |
| Source file | `src/zemx_i_ordermasterdata.ddls.asddls` |

## Purpose

Order master data (AUFK) of maintenance orders (order category 30).

## Keys

- `aufnr`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the maintenance orders of company code 1000.

## Open verification items

`XOR-003` - see `BATCH_REPORT.md`.
