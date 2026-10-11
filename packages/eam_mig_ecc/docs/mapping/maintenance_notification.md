# Migration interface: maintenance_notification

> Version **1.0.0**

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** `equipment`, `functional_location`, `work_center`
- **Business key:** `MaintenanceNotification` · numbering **new**
- **Key rule:** Notifications get new numbers on S/4HANA unless external numbering is set up; the load program keeps the old -> new numbers.

> Compatibility note: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

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
- Scope: `src.IsMarkedForDeletion = '' and _MaintNotification.IsCompleted = '' and _MaintNotification.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `MaintenanceNotification` | QMFE-QMNUM | QMFE-QMNUM | copy |  |
| `MaintNotificationItem` | QMFE-FENUM | QMFE-FENUM | copy |  |
| `ObjectPartCodeGroup` | QMFE-OTGRP | QMFE-OTGRP | copy |  |
| `ObjectPartCode` | QMFE-OTEIL | QMFE-OTEIL | copy |  |
| `DamageCodeGroup` | QMFE-FEGRP | QMFE-FEGRP | copy |  |
| `DamageCode` | QMFE-FECOD | QMFE-FECOD | copy |  |
| `MaintNotifItemText` | QMFE-FETXT | QMFE-FETXT | copy |  |

## `ZEMX_C_NotifCauseMig`

- Source: `ZEMX_I_NotifCause`
- Keys: `MaintenanceNotification`, `MaintNotificationItem`, `CauseNumber`
- Scope: `src.IsMarkedForDeletion = '' and _Parent.IsCompleted = '' and _Parent.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `MaintenanceNotification` | QMUR-QMNUM | QMUR-QMNUM | copy |  |
| `MaintNotificationItem` | QMUR-FENUM | QMUR-FENUM | copy |  |
| `CauseNumber` | QMUR-URNUM | QMUR-URNUM | copy |  |
| `CauseCodeGroup` | QMUR-URGRP | QMUR-URGRP | copy |  |
| `CauseCode` | QMUR-URCOD | QMUR-URCOD | copy |  |
| `CauseText` | QMUR-URTXT | QMUR-URTXT | copy |  |

## `ZEMX_C_NotifTaskMig`

- Source: `ZEMX_I_NotifTask`
- Keys: `MaintenanceNotification`, `TaskNumber`
- Scope: `src.IsMarkedForDeletion = '' and _Parent.IsCompleted = '' and _Parent.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `MaintenanceNotification` | QMSM-QMNUM | QMSM-QMNUM | copy |  |
| `TaskNumber` | QMSM-MANUM | QMSM-MANUM | copy |  |
| `MaintNotificationItem` | QMSM-FENUM | QMSM-FENUM | copy |  |
| `TaskCodeGroup` | QMSM-MNGRP | QMSM-MNGRP | copy |  |
| `TaskCode` | QMSM-MNCOD | QMSM-MNCOD | copy |  |
| `TaskText` | QMSM-MATXT | QMSM-MATXT | copy |  |
| `PartnerFunction` | QMSM-PARVW | QMSM-PARVW | copy |  |
| `ResponsiblePartner` | QMSM-PARNR | QMSM-PARNR | copy |  |
| `PlannedStartDate` | QMSM-PSTER | QMSM-PSTER | copy |  |
| `PlannedEndDate` | QMSM-PETER | QMSM-PETER | copy |  |
| `CompletionDate` | QMSM-ERLDAT | QMSM-ERLDAT | copy |  |

## `ZEMX_C_NotifActivityMig`

- Source: `ZEMX_I_NotifActivity`
- Keys: `MaintenanceNotification`, `ActivityNumber`
- Scope: `src.IsMarkedForDeletion = '' and _Parent.IsCompleted = '' and _Parent.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `MaintenanceNotification` | QMMA-QMNUM | QMMA-QMNUM | copy |  |
| `ActivityNumber` | QMMA-MANUM | QMMA-MANUM | copy |  |
| `MaintNotificationItem` | QMMA-FENUM | QMMA-FENUM | copy |  |
| `ActivityCodeGroup` | QMMA-MNGRP | QMMA-MNGRP | copy |  |
| `ActivityCode` | QMMA-MNCOD | QMMA-MNCOD | copy |  |
| `ActivityText` | QMMA-MATXT | QMMA-MATXT | copy |  |
| `ActivityStartDate` | QMMA-STARTDAT | QMMA-STARTDAT | copy |  |
| `ActivityEndDate` | QMMA-ENDDAT | QMMA-ENDDAT | copy |  |

## `ZEMX_C_MaintNotifPartnerMig`

- Source: `ZEMX_I_MaintNotifPartner`
- Keys: `MaintenanceNotification`, `PartnerFunction`, `PartnerCounter`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Resolve partner identities and language-independent partner functions through a supported business interface after the selected master. Preserve partner counters; deleted partner assignments are excluded.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `MaintenanceNotification` | QMEL-QMNUM | - | copy |  |
| `PartnerFunction` | IHPA-PARVW | - | copy |  |
| `PartnerCounter` | IHPA-COUNTER | - | copy |  |
| `Partner` | IHPA-PARNR | - | copy |  |

## `ZEMX_C_MaintNotifStatusMig`

- Source: `ZEMX_I_MaintNotifStatus`
- Keys: `MaintenanceNotification`, `StatusCode`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `MaintenanceNotification` | source: MaintenanceNotification | - | copy |  |
| `StatusCode` | JEST-STAT | - | copy |  |
| `StatusKind` | source: StatusKind | - | copy |  |
| `StatusProfile` | JSTO-STSMA | - | copy |  |
| `StatusChangeNumber` | JEST-CHGNR | - | copy |  |

## `ZEMX_C_NotifUserStatusMig`

- Source: `ZEMX_I_MaintNotifUserStatus`
- Keys: `MaintenanceNotification`, `StatusCode`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Map source profile and E* user status codes to configured target profiles/statuses. Apply through a supported post-load business operation; do not replay system statuses or write JEST/JSTO.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `MaintenanceNotification` | source: MaintenanceNotification | - | copy |  |
| `StatusCode` | JEST-STAT | - | copy |  |
| `StatusKind` | source: StatusKind | - | copy |  |
| `StatusProfile` | JSTO-STSMA | - | copy |  |
| `StatusChangeNumber` | JEST-CHGNR | - | copy |  |

## `ZEMX_C_NotifLongTextMig`

- Source: `ZEMX_I_NotifLongText`
- Keys: `TextObject`, `TextName`, `TextID`, `Language`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: SAPscript index only. Populate the explicit full text-key to business-owner link file from the source text editor/application metadata, run the text_scope preparation step against selected masters, then READ_TEXT to retrieve ordered formatted lines. Never infer the business owner from a TDNAME substring or post compressed STXL data.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `TextObject` | STXH-TDOBJECT | - | copy |  |
| `TextName` | STXH-TDNAME | - | copy |  |
| `TextID` | STXH-TDID | - | copy |  |
| `Language` | STXH-TDSPRAS | - | copy |  |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZEMX_I_MaintNotification` | `MaintenanceOrder` | QMEL-AUFNR | not migrated: set by the order load - the migrated order references the notification |
| `ZEMX_I_MaintNotification` | `ObjectNumber` | QMEL-OBJNR | not migrated: status object number - regenerated on S/4HANA |
| `ZEMX_I_MaintNotification` | `IsCompleted` | derived: case hdr._CompletedFlag.StatusCode when 'I0072' then 'X' else '' end from JEST-STAT | scope flag |
| `ZEMX_I_MaintNotification` | `IsMarkedForDeletion` | derived: case hdr._DeletionFlag.StatusCode when 'I0076' then 'X' else '' end from JEST-STAT | scope flag |
| `ZEMX_I_MaintNotification` | `CreationDate` | QMEL-ERDAT | information only |
| `ZEMX_I_MaintNotification` | `CreatedByUser` | QMEL-ERNAM | information only |
| `ZEMX_I_MaintNotifItem` | `IsMarkedForDeletion` | QMFE-KZLOESCH | scope flag |
| `ZEMX_I_NotifCause` | `IsMarkedForDeletion` | QMUR-KZLOESCH | scope flag |
| `ZEMX_I_NotifTask` | `IsMarkedForDeletion` | QMSM-KZLOESCH | scope flag |
| `ZEMX_I_NotifActivity` | `IsMarkedForDeletion` | QMMA-KZLOESCH | scope flag |

## Reconciliation

- Counts: `ZEMX_C_MaintNotifMigCount` (ECC) vs `ZEMT_I_MaintNotifCount` (S/4HANA) per `NotificationType`, `MaintenancePlanningPlant`
- Records and fields: `ZEMX_C_MaintNotificationMig` vs `ZEMT_B_MaintNotifCompare` on `MaintenanceNotification`; compared: `NotificationType`, `MaintPriority`, `RequiredStartDate`, `RequiredEndDate`, `Equipment`, `FunctionalLocation`, `MaintenancePlanningPlant`

```bash
python3 tools/mig_reconcile.py counts --product eam_mig_ecc --module maintenance_notification --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product eam_mig_ecc --module maintenance_notification --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Compatibility note: confirm notification child keys, deletion fields, task statuses and date fields before real-system activation.
