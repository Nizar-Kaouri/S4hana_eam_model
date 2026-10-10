# ZEMX_I_OrderMaintData

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Order maintenance data |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `afih` |
| Source file | `src/zemx_i_ordermaintdata.ddls.asddls` |

## Purpose

Maintenance data of orders (AFIH): reference object, planning data, notification, maintenance plan.

## Keys

- `aufnr`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the orders created from maintenance plan 100.

## Open verification items

`XOR-001`, `XOR-002` - see `BATCH_REPORT.md`.
