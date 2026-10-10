# ZEMX_I_OrderOperationData

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Order operation |
| Module | `maintenance_order` |
| Batch | 2 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `afvc` |
| Source file | `src/zemx_i_orderoperationdata.ddls.asddls` |

## Purpose

Order operations (AFVC): number, control key, text, work center, plant, activity type.

## Keys

- `aufpl`
- `aplzl`

## Associations defined here

- `_WorkCenter` → `ZEMX_I_WorkCenterHeader` [0..1]

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the operations of routing number 1000001.

## Open verification items

`XOR-004` - see `BATCH_REPORT.md`.
