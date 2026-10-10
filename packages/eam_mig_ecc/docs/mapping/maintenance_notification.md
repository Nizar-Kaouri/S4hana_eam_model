# Migration interface: maintenance_notification

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** `equipment`, `functional_location`, `work_center`
- **Business key:** `MaintenanceNotification` · numbering **new**
- **Key rule:** Notifications get new numbers on S/4HANA unless external numbering is set up; the load program writes old -> new into the key map 'MAINTENANCE_NOTIFICATION'.

> TODO-VERIFY[M] XNO-M01: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

Values are delivered **translated**: every field marked *value map* / *key map* is looked up in the mapping table `ZEMX_MAP` (map name in capitals); without an entry the old value is delivered. `Legacy*` key fields carry the old key of the record.

## `ZEMX_C_MaintNotificationMig`

- Source: `ZEMX_I_MaintNotification`
- Keys: `LegacyMaintenanceNotification`
- Scope: `src.IsCompleted = '' and src.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `MaintenanceNotification` | QMEL-QMNUM | QMEL-QMNUM | key map: `MAINTENANCE_NOTIFICATION` | yes |
| `NotificationType` | QMEL-QMART | QMEL-QMART | value map: `NOTIFICATION_TYPE` | yes |
| `NotificationText` | QMEL-QMTXT | QMEL-QMTXT | copy |  |
| `MaintPriority` | QMEL-PRIOK | QMEL-PRIOK | value map: `PRIORITY` | yes |
| `MaintPriorityType` | QMEL-ARTPR | QMEL-ARTPR | value map: `PRIORITY_TYPE` |  |
| `NotificationDate` | QMEL-QMDAT | QMEL-QMDAT | copy |  |
| `NotificationTime` | QMEL-MZEIT | QMEL-MZEIT | copy |  |
| `ReportedByUser` | QMEL-QMNAM | QMEL-QMNAM | copy |  |
| `RequiredStartDate` | QMEL-STRMN | QMEL-STRMN | copy | yes |
| `RequiredEndDate` | QMEL-LTRMN | QMEL-LTRMN | copy | yes |
| `NotificationCatalog` | QMEL-QMKAT | QMEL-QMKAT | copy |  |
| `NotificationCodeGroup` | QMEL-QMGRP | QMEL-QMGRP | value map: `CODE_GROUP` |  |
| `NotificationCode` | QMEL-QMCOD | QMEL-QMCOD | value map: `CODE` |  |
| `Equipment` | QMIH-EQUNR | QMIH-EQUNR | key map: `EQUIPMENT` | yes |
| `FunctionalLocation` | ILOA-TPLNR | ILOA-TPLNR | key map: `FUNCTIONAL_LOCATION` | yes |
| `MaintenancePlanningPlant` | QMIH-IWERK | QMIH-IWERK | value map: `PLANT` | yes |
| `MaintenancePlannerGroup` | QMIH-INGRP | QMIH-INGRP | value map: `PLANNER_GROUP` |  |
| `MainWorkCenter` | CRHD-ARBPL | CRHD-ARBPL | key map: `WORK_CENTER` |  |
| `MainWorkCenterPlant` | CRHD-WERKS | CRHD-WERKS | value map: `PLANT` |  |
| `MaintenancePlant` | ILOA-SWERK | ILOA-SWERK | value map: `PLANT` |  |
| `PlantSection` | ILOA-BEBER | ILOA-BEBER | value map: `PLANT_SECTION` |  |
| `MaintenanceObjectIsDown` | QMIH-MSAUS | QMIH-MSAUS | copy |  |
| `MalfunctionStartDate` | QMIH-AUSVN | QMIH-AUSVN | copy |  |
| `MalfunctionStartTime` | QMIH-AUZTV | QMIH-AUZTV | copy |  |
| `MalfunctionEndDate` | QMIH-AUSBS | QMIH-AUSBS | copy |  |
| `MalfunctionEndTime` | QMIH-AUZTB | QMIH-AUZTB | copy |  |
| `LastChangeDate` | QMEL-AEDAT | - | information only |  |

## `ZEMX_C_MaintNotifItemMig`

- Source: `ZEMX_I_MaintNotifItem`
- Keys: `LegacyMaintenanceNotification`, `MaintNotificationItem`
- Scope: `src.IsMarkedForDeletion = '' and obj.IsCompleted = '' and obj.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `MaintNotificationItem` | QMFE-FENUM | QMFE-FENUM | copy |  |
| `MaintenanceNotification` | QMFE-QMNUM | QMFE-QMNUM | key map: `MAINTENANCE_NOTIFICATION` |  |
| `ObjectPartCodeGroup` | QMFE-OTGRP | QMFE-OTGRP | value map: `CODE_GROUP` |  |
| `ObjectPartCode` | QMFE-OTEIL | QMFE-OTEIL | value map: `CODE` |  |
| `DamageCodeGroup` | QMFE-FEGRP | QMFE-FEGRP | value map: `CODE_GROUP` |  |
| `DamageCode` | QMFE-FECOD | QMFE-FECOD | value map: `CODE` |  |
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

## Maps

- value map `CODE`
- value map `CODE_GROUP`
- value map `NOTIFICATION_TYPE`
- value map `PLANNER_GROUP`
- value map `PLANT`
- value map `PLANT_SECTION`
- value map `PRIORITY`
- value map `PRIORITY_TYPE`
- key map `EQUIPMENT`
- key map `FUNCTIONAL_LOCATION`
- key map `MAINTENANCE_NOTIFICATION`
- key map `WORK_CENTER`

After loading this object, the key map(s) `MAINTENANCE_NOTIFICATION` (old key, new key from the load log) must be written into `ZEMX_MAP` on the ECC system (by the load program via RFC or by uploading the load log) before the objects that use them are extracted.

## Reconciliation

- Counts: `ZEMX_C_MaintNotifMigCount` (ECC, translated values) vs `ZEMT_I_MaintNotifCount` (S/4HANA) per `NotificationType`, `MaintenancePlanningPlant`
- Records and fields: `ZEMX_C_MaintNotificationMig` vs `ZEMT_I_MaintNotifCompare` on `MaintenanceNotification`; compared: `NotificationType`, `MaintPriority`, `RequiredStartDate`, `RequiredEndDate`, `Equipment`, `FunctionalLocation`, `MaintenancePlanningPlant`

```bash
python3 tools/mig_reconcile.py counts --module maintenance_notification --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --module maintenance_notification --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- TODO-VERIFY[M] XNO-G01: causes (QMUR), tasks (QMSM) and activities (QMMA) are not extracted in the pilot
