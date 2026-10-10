# Mapping: maintenance_notification

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Target:** SAP S/4HANA Migration Cockpit - migration object *Maintenance notification*
- **Load after:** `equipment`, `functional_location`, `work_center`
- **Business key:** `MaintenanceNotification` · numbering **new**
- **Key rule:** Notifications get new numbers on S/4HANA unless external numbering is set up; keep the key map 'maintenance_notification' (old,new). Put the old number into a reference field if users need it.
- **Scope filter:** `IsCompleted = '' and IsMarkedForDeletion = ''` - Only open notifications are migrated; completed history stays in the archive / old system.

> TODO-VERIFY[H] XNO-M01: Migration Cockpit object for 'Maintenance notification' (name, approach staging tables / direct transfer) and its structure field names; targets below are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance

## Fields

| View | Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|---|
| `ZEMX_I_MaintNotification` | `MaintenanceNotification` | QMEL-QMNUM | QMEL-QMNUM | key map: `maintenance_notification` | yes |
| `ZEMX_I_MaintNotification` | `NotificationType` | QMEL-QMART | QMEL-QMART | value map: `notification_type` | yes |
| `ZEMX_I_MaintNotification` | `NotificationText` | QMEL-QMTXT | QMEL-QMTXT | copy |  |
| `ZEMX_I_MaintNotification` | `MaintPriority` | QMEL-PRIOK | QMEL-PRIOK | value map: `priority` | yes |
| `ZEMX_I_MaintNotification` | `MaintPriorityType` | QMEL-ARTPR | QMEL-ARTPR | value map: `priority_type` |  |
| `ZEMX_I_MaintNotification` | `NotificationDate` | QMEL-QMDAT | QMEL-QMDAT | copy |  |
| `ZEMX_I_MaintNotification` | `NotificationTime` | QMEL-MZEIT | QMEL-MZEIT | copy |  |
| `ZEMX_I_MaintNotification` | `ReportedByUser` | QMEL-QMNAM | QMEL-QMNAM | copy |  |
| `ZEMX_I_MaintNotification` | `RequiredStartDate` | QMEL-STRMN | QMEL-STRMN | copy | yes |
| `ZEMX_I_MaintNotification` | `RequiredEndDate` | QMEL-LTRMN | QMEL-LTRMN | copy | yes |
| `ZEMX_I_MaintNotification` | `NotificationCatalog` | QMEL-QMKAT | QMEL-QMKAT | copy |  |
| `ZEMX_I_MaintNotification` | `NotificationCodeGroup` | QMEL-QMGRP | QMEL-QMGRP | value map: `code_group` |  |
| `ZEMX_I_MaintNotification` | `NotificationCode` | QMEL-QMCOD | QMEL-QMCOD | value map: `code` |  |
| `ZEMX_I_MaintNotification` | `MaintenanceOrder` | QMEL-AUFNR | QMEL-AUFNR | derive: set by the order load - the migrated order references the notification |  |
| `ZEMX_I_MaintNotification` | `Equipment` | QMIH-EQUNR | QMIH-EQUNR | key map: `equipment` | yes |
| `ZEMX_I_MaintNotification` | `FunctionalLocation` | ILOA-TPLNR | ILOA-TPLNR | key map: `functional_location` | yes |
| `ZEMX_I_MaintNotification` | `MaintenancePlanningPlant` | QMIH-IWERK | QMIH-IWERK | value map: `plant` | yes |
| `ZEMX_I_MaintNotification` | `MaintenancePlannerGroup` | QMIH-INGRP | QMIH-INGRP | value map: `planner_group` |  |
| `ZEMX_I_MaintNotification` | `MainWorkCenter` | CRHD-ARBPL | QMEL-ARBPL (via work center) | key map: `work_center` |  |
| `ZEMX_I_MaintNotification` | `MainWorkCenterPlant` | CRHD-WERKS | QMEL-ARBPL (via work center) | value map: `plant` |  |
| `ZEMX_I_MaintNotification` | `MaintenancePlant` | ILOA-SWERK | ILOA-SWERK | value map: `plant` |  |
| `ZEMX_I_MaintNotification` | `PlantSection` | ILOA-BEBER | ILOA-BEBER | value map: `plant_section` |  |
| `ZEMX_I_MaintNotification` | `MaintenanceObjectIsDown` | QMIH-MSAUS | QMIH-MSAUS | copy |  |
| `ZEMX_I_MaintNotification` | `MalfunctionStartDate` | QMIH-AUSVN | QMIH-AUSVN | copy |  |
| `ZEMX_I_MaintNotification` | `MalfunctionStartTime` | QMIH-AUZTV | QMIH-AUZTV | copy |  |
| `ZEMX_I_MaintNotification` | `MalfunctionEndDate` | QMIH-AUSBS | QMIH-AUSBS | copy |  |
| `ZEMX_I_MaintNotification` | `MalfunctionEndTime` | QMIH-AUZTB | QMIH-AUZTB | copy |  |
| `ZEMX_I_MaintNotification` | `ObjectNumber` | QMEL-OBJNR | - | not migrated: status object number - regenerated on S/4HANA |  |
| `ZEMX_I_MaintNotification` | `IsCompleted` | case noco.stat when 'I0072' then 'X' else '' end | - | scope filter |  |
| `ZEMX_I_MaintNotification` | `IsMarkedForDeletion` | case dlfl.stat when 'I0076' then 'X' else '' end | - | scope filter |  |
| `ZEMX_I_MaintNotification` | `CreationDate` | QMEL-ERDAT | - | information only |  |
| `ZEMX_I_MaintNotification` | `CreatedByUser` | QMEL-ERNAM | - | information only |  |
| `ZEMX_I_MaintNotification` | `LastChangeDate` | QMEL-AEDAT | - | information only |  |
| `ZEMX_I_MaintNotifItem` | `MaintenanceNotification` | QMFE-QMNUM | QMFE-QMNUM | key map: `maintenance_notification` |  |
| `ZEMX_I_MaintNotifItem` | `MaintNotificationItem` | QMFE-FENUM | QMFE-FENUM | copy |  |
| `ZEMX_I_MaintNotifItem` | `ObjectPartCodeGroup` | QMFE-OTGRP | QMFE-OTGRP | value map: `code_group` |  |
| `ZEMX_I_MaintNotifItem` | `ObjectPartCode` | QMFE-OTEIL | QMFE-OTEIL | value map: `code` |  |
| `ZEMX_I_MaintNotifItem` | `DamageCodeGroup` | QMFE-FEGRP | QMFE-FEGRP | value map: `code_group` |  |
| `ZEMX_I_MaintNotifItem` | `DamageCode` | QMFE-FECOD | QMFE-FECOD | value map: `code` |  |
| `ZEMX_I_MaintNotifItem` | `MaintNotifItemText` | QMFE-FETXT | QMFE-FETXT | copy |  |
| `ZEMX_I_MaintNotifItem` | `IsMarkedForDeletion` | QMFE-KZLOESCH | - | scope filter |  |

## Value maps and key maps

Templates: `docs/mapping/templates/` (columns `source,target,comment`). An empty map means "same value on S/4HANA".

- value map `code`
- value map `code_group`
- value map `notification_type`
- value map `planner_group`
- value map `plant`
- value map `plant_section`
- value map `priority`
- value map `priority_type`
- key map `equipment`
- key map `functional_location`
- key map `maintenance_notification`
- key map `work_center`

This object's load provides the key map(s) `maintenance_notification` (old key, new key from the load log).

## Reconciliation

- Counts: `ZEMX_R_MaintNotifCount` (ECC) vs `ZEMT_R_MaintNotifCount` (S/4HANA) per `NotificationType` (value map `notification_type`), `MaintenancePlanningPlant` (value map `plant`)
- Records and fields: `ZEMX_I_MaintNotification` vs `ZEMT_I_MaintNotifCompare` on `MaintenanceNotification` (key map `maintenance_notification`); compared fields: `NotificationType`, `MaintPriority`, `RequiredStartDate`, `RequiredEndDate`, `Equipment`, `FunctionalLocation`, `MaintenancePlanningPlant`

```bash
python3 tools/mig_reconcile.py counts --module maintenance_notification --source ecc_counts.csv --target s4_counts.csv --maps <folder>
python3 tools/mig_reconcile.py records --module maintenance_notification --source ecc_extract.csv --target s4_compare.csv --maps <folder>
```

## Open gaps

- TODO-VERIFY[M] XNO-G01: causes (QMUR), tasks (QMSM) and activities (QMMA) are not extracted in the pilot
