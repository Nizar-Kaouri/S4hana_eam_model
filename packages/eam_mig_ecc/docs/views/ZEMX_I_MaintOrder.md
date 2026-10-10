# ZEMX_I_MaintOrder

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance order (migration extract) |
| Module | `maintenance_order` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `aufk`, join `afih`, join `afko`, join `iloa`, join `crhd`, join `jest`, join `jest`, join `jest` |
| Source file | `src/zemx_i_maintorder.ddls.asddls` |

## Purpose

One row per maintenance order (order category 30) with planning data, reference object, account assignment and the status flags that decide the migration scope.

## Keys

- `aufnr`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Extract the open orders: filter IsTechnicallyCompleted = '', IsClosed = '' and IsMarkedForDeletion = ''.

## Open verification items

`XOR-001`, `XOR-002`, `XOR-003` - see `BATCH_REPORT.md`.
