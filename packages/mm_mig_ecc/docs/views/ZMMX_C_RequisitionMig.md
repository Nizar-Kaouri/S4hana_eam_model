# ZMMX_C_RequisitionMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | RequisitionMig |
| Module | `purchase_requisition` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZMMX_I_Requisition` |
| Source file | `src/zmmx_c_requisitionmig.ddls.asddls` |

## Purpose

Read RequisitionMig as source candidates; approve the key-date population before posting.

## Keys

- `PurchaseRequisition`
- `PurchaseRequisitionItem`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

none
