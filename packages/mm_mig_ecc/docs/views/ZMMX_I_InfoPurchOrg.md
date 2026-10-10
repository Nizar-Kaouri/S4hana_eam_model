# ZMMX_I_InfoPurchOrg

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | InfoPurchOrg |
| Module | `purchasing_info_record` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZMMX_I_InfoPurchOrgData` |
| Source file | `src/zmmx_i_infopurchorg.ddls.asddls` |

## Purpose

Read InfoPurchOrg as source candidates; approve the key-date population before posting.

## Keys

- `PurchasingInfoRecord`
- `PurchasingOrganization`
- `InfoRecordCategory`
- `Plant`

## Associations defined here

- none

## Access control

No DCL by design: Read-only migration extraction without DCL. Verify the extraction channel with permitted and restricted users. Table authorization does not protect every CDS consumer.

## Example use case

Export a small approved cohort, preserve internal keys, and compare with the mapped target population.

## Open verification items

none
