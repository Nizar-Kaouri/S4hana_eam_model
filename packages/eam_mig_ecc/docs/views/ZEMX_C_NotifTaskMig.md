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

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Export the selected migration scope; validate keys and row counts before loading.

## Open verification items

none
