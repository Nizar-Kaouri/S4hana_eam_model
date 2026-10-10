# Migration interface: maintenance_notification

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** `equipment`, `functional_location`, `work_center`
- **Business key:** `MaintenanceNotification` · numbering **new**
- **Key rule:** Notifications get new numbers on S/4HANA unless external numbering is set up; the load program keeps the old -> new numbers.

> TODO-VERIFY[M] XNO-M01: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEMX_C_MaintNotificationMig`

- Source: `ZEMX_I_MaintNotification`
- Keys: `MaintenanceNotification`
- Scope: `src.IsCompleted = '' and src.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `MaintenanceNotification` | QMEL-QMNUM | QMEL-QMNUM | copy | yes |
| `NotificationType` | QMEL-QMART | QMEL-QMART | copy | yes |
| `NotificationText` | QMEL-QMTXT | QMEL-QMTXT | copy |  |
| `MaintPriority` | QMEL-PRIOK | QMEL-PRIOK | copy | yes |
| `MaintPriorityType` | QMEL-ARTPR | QMEL-ARTPR | copy |  |
| `NotificationDate` | QMEL-QMDAT | QMEL-QMDAT | copy |  |
| `NotificationTime` | QMEL-MZEIT | QMEL-MZEIT | copy |  |
| `ReportedByUser` | QMEL-QMNAM | QMEL-QMNAM | copy |  |
| `RequiredStartDate` | QMEL-STRMN | QMEL-STRMN | copy | yes |
| `RequiredEndDate` | QMEL-LTRMN | QMEL-LTRMN | copy | yes |
| `NotificationCatalog` | QMEL-QMKAT | QMEL-QMKAT | copy |  |
| `NotificationCodeGroup` | QMEL-QMGRP | QMEL-QMGRP | copy |  |
| `NotificationCode` | QMEL-QMCOD | QMEL-QMCOD | copy |  |
| `Equipment` | QMIH-EQUNR | QMIH-EQUNR | copy | yes |
| `FunctionalLocation` | ILOA-TPLNR | ILOA-TPLNR | copy | yes |
| `MaintenancePlanningPlant` | QMIH-IWERK | QMIH-IWERK | copy | yes |
| `MaintenancePlannerGroup` | QMIH-INGRP | QMIH-INGRP | copy |  |
| `MainWorkCenter` | CRHD-ARBPL | CRHD-ARBPL | copy |  |
| `MainWorkCenterPlant` | CRHD-WERKS | CRHD-WERKS | copy |  |
| `MaintenancePlant` | ILOA-SWERK | ILOA-SWERK | copy |  |
| `PlantSection` | ILOA-BEBER | ILOA-BEBER | copy |  |
| `MaintenanceObjectIsDown` | QMIH-MSAUS | QMIH-MSAUS | copy |  |
| `MalfunctionStartDate` | QMIH-AUSVN | QMIH-AUSVN | copy |  |
| `MalfunctionStartTime` | QMIH-AUZTV | QMIH-AUZTV | copy |  |
| `MalfunctionEndDate` | QMIH-AUSBS | QMIH-AUSBS | copy |  |
| `MalfunctionEndTime` | QMIH-AUZTB | QMIH-AUZTB | copy |  |
| `LastChangeDate` | QMEL-AEDAT | - | information only |  |

## `ZEMX_C_MaintNotifItemMig`

- Source: `ZEMX_I_MaintNotifItem`
- Keys: `MaintenanceNotification`, `MaintNotificationItem`
- Scope: `src.IsMarkedForDeletion = '' and obj.IsCompleted = '' and obj.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `MaintenanceNotification` | QMFE-QMNUM | QMFE-QMNUM | copy |  |
| `MaintNotificationItem` | QMFE-FENUM | QMFE-FENUM | copy |  |
| `ObjectPartCodeGroup` | QMFE-OTGRP | QMFE-OTGRP | copy |  |
| `ObjectPartCode` | QMFE-OTEIL | QMFE-OTEIL | copy |  |
| `DamageCodeGroup` | QMFE-FEGRP | QMFE-FEGRP | copy |  |
| `DamageCode` | QMFE-FECOD | QMFE-FECOD | copy |  |
| `MaintNotifItemText` | QMFE-FETXT | QMFE-FETXT | copy |  |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZEMX_I_MaintNotification` | `MaintenanceOrder` | QMEL-AUFNR | not migrated: set by the order load - the migrated order references the notification |
| `ZEMX_I_MaintNotification` | `ObjectNumber` | QMEL-OBJNR | not migrated: status object number - regenerated on S/4HANA |
| `ZEMX_I_MaintNotification` | `IsCompleted` | derived: case noco.StatusCode when 'I0072' then 'X' else '' end from JEST-STAT | scope flag |
| `ZEMX_I_MaintNotification` | `IsMarkedForDeletion` | derived: case dlfl.StatusCode when 'I0076' then 'X' else '' end from JEST-STAT | scope flag |
| `ZEMX_I_MaintNotification` | `CreationDate` | QMEL-ERDAT | information only |
| `ZEMX_I_MaintNotification` | `CreatedByUser` | QMEL-ERNAM | information only |
| `ZEMX_I_MaintNotifItem` | `IsMarkedForDeletion` | QMFE-KZLOESCH | scope flag |

## Reconciliation

- Counts: `ZEMX_C_MaintNotifMigCount` (ECC) vs `ZEMT_I_MaintNotifCount` (S/4HANA) per `NotificationType`, `MaintenancePlanningPlant`
- Records and fields: `ZEMX_C_MaintNotificationMig` vs `ZEMT_I_MaintNotifCompare` on `MaintenanceNotification`; compared: `NotificationType`, `MaintPriority`, `RequiredStartDate`, `RequiredEndDate`, `Equipment`, `FunctionalLocation`, `MaintenancePlanningPlant`

```bash
python3 tools/mig_reconcile.py counts --module maintenance_notification --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --module maintenance_notification --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- TODO-VERIFY[M] XNO-G01: causes (QMUR), tasks (QMSM) and activities (QMMA) are not extracted in the pilot
