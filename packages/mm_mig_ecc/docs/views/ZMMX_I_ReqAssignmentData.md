# ZMMX_I_ReqAssignmentData

> Version **1.0.0**

| | |
|---|---|
| Description | ReqAssignmentData |
| Module | `purchase_requisition` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | - |
| Data source | `ebkn` |
| Source file | `src/zmmx_i_reqassignmentdata.ddls.asddls` |

## Purpose

Read ReqAssignmentData as source records; approve the key-date population before posting.

## Keys

- `PurchaseRequisition`
- `PurchaseRequisitionItem`
- `AccountAssignmentNumber`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
