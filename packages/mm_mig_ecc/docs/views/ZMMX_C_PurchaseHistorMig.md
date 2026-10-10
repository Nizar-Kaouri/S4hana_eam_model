# ZMMX_C_PurchaseHistorMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | PurchaseHistorMig |
| Module | `purchase_order` |
| Batch | 1 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZMMX_I_PurchaseHistor` |
| Source file | `src/zmmx_c_purchasehistormig.ddls.asddls` |

## Purpose

Read PurchaseHistorMig as source candidates; approve the key-date population before posting.

## Keys

- `PurchaseOrder`
- `PurchaseOrderItem`
- `AccountAssignmentNumber`
- `HistoryCategory`
- `FiscalYear`
- `DocumentNumber`
- `DocumentItem`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

none
