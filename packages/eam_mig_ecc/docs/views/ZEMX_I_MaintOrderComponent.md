# ZEMX_I_MaintOrderComponent

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance order component (migration extract) |
| Module | `maintenance_order` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `resb`, join `afih` |
| Source file | `src/zemx_i_maintordercomponent.ddls.asddls` |

## Purpose

Material components (reservation items) of maintenance orders with operation link, requirement and withdrawn quantity.

## Keys

- `rsnum`
- `rspos`
- `rsart`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Extract the open components: filter IsMarkedForDeletion = '' and IsFinalIssue = '' for the orders in scope.

## Open verification items

`XOR-005` - see `BATCH_REPORT.md`.
