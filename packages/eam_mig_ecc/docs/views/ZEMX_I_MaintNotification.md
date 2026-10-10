# ZEMX_I_MaintNotification

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Maintenance notification (migration extract) |
| Module | `maintenance_notification` |
| Batch | 1 |
| Layer | basic (`@VDM.viewType: #BASIC`) |
| Kind | view |
| Data category | #FACT |
| Data source | `qmel`, join `qmih`, join `iloa`, join `crhd`, join `jest`, join `jest` |
| Source file | `src/zemx_i_maintnotification.ddls.asddls` |

## Purpose

One row per PM notification (QMEL with maintenance data QMIH) with reference object, planning data, malfunction data and completion / deletion flags for the migration scope.

## Keys

- `qmnum`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Extract the open notifications: filter IsCompleted = '' and IsMarkedForDeletion = ''.

## Open verification items

`XNO-001`, `XNO-002`, `XNO-003` - see `BATCH_REPORT.md`.
