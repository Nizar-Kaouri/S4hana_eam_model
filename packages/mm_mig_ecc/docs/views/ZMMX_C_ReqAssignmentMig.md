# ZMMX_C_ReqAssignmentMig

> Version **1.0.0**

| | |
|---|---|
| Description | ReqAssignmentMig |
| Module | `purchase_requisition` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZMMX_I_ReqAssignment` |
| Source file | `src/zmmx_c_reqassignmentmig.ddls.asddls` |

## Purpose

Read ReqAssignmentMig as source records; approve the key-date population before posting.

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
