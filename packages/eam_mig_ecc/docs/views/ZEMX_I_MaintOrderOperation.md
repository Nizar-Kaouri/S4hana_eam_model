# ZEMX_I_MaintOrderOperation

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance order operation (migration extract) |
| Module | `maintenance_order` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `afvc`, join `afvv`, join `afko`, join `afih`, join `crhd` |
| Source file | `src/zemx_i_maintorderoperation.ddls.asddls` |

## Purpose

Operations and sub-operations of maintenance orders with control key, work center, activity type, planned work and duration.

## Keys

- `aufnr`
- `aplzl`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Extract the operations of the open orders: join on MaintenanceOrder with ZEMX_I_MaintOrder.

## Open verification items

`XOR-004` - see `BATCH_REPORT.md`.
