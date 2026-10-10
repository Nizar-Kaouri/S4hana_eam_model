# ZEMX_C_NotifTaskMig

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | NotifTask migration extract |
| Module | `maintenance_notification` |
| Batch | 2 |
| Layer | consumption (`@VDM.viewType: #CONSUMPTION`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_I_NotifTask` |
| Source file | `src/zemx_c_notiftaskmig.ddls.asddls` |

## Purpose

NotifTask migration extract

## Keys

- `MaintenanceNotification`
- `TaskNumber`

## Associations defined here

- `_Parent` → `ZEMX_I_MaintNotification` [0..1]

## Access control

No DCL by design: Migration reads intentionally have no DCL. Restrict access through the actual extraction channel and verify its authorization checks with permitted and restricted identities. Do not assume table authorizations protect every SQL/RFC consumer.

## Example use case

Export the selected migration scope; validate keys and row counts before loading.

## Open verification items

none
