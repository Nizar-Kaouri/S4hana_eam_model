# Migration interface: quality_notification

> Version **1.0.0**

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** - (first level)
- **Business key:** `QualityNotification` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZQMX_C_QualityNotificMig`

- Source: `ZQMX_I_QualityNotific`
- Keys: `QualityNotification`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `QualityNotification` | QMEL-QMNUM | customer interface field: QualityNotification (unconfirmed) | information only |
| `NotificationType` | QMEL-QMART | customer interface field: NotificationType (unconfirmed) | information only |
| `NotificationText` | QMEL-QMTXT | customer interface field: NotificationText (unconfirmed) | information only |
| `Material` | QMEL-MATNR | customer interface field: Material (unconfirmed) | information only |
| `Plant` | QMEL-WERK | customer interface field: Plant (unconfirmed) | information only |
| `ObjectNumber` | QMEL-OBJNR | customer interface field: ObjectNumber (unconfirmed) | information only |

## `ZQMX_C_QualityItemMig`

- Source: `ZQMX_I_QualityItem`
- Keys: `QualityNotification`, `NotificationItem`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `QualityNotification` | QMFE-QMNUM | customer interface field: QualityNotification (unconfirmed) | information only |
| `NotificationItem` | QMFE-FENUM | customer interface field: NotificationItem (unconfirmed) | information only |
| `DefectCodeGroup` | QMFE-FEGRP | customer interface field: DefectCodeGroup (unconfirmed) | information only |
| `DefectCode` | QMFE-FECOD | customer interface field: DefectCode (unconfirmed) | information only |
| `DefectText` | QMFE-FETXT | customer interface field: DefectText (unconfirmed) | information only |

## `ZQMX_C_QualityCauseMig`

- Source: `ZQMX_I_QualityCause`
- Keys: `QualityNotification`, `NotificationItem`, `CauseNumber`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `QualityNotification` | QMUR-QMNUM | customer interface field: QualityNotification (unconfirmed) | information only |
| `NotificationItem` | QMUR-FENUM | customer interface field: NotificationItem (unconfirmed) | information only |
| `CauseNumber` | QMUR-URNUM | customer interface field: CauseNumber (unconfirmed) | information only |
| `CauseCodeGroup` | QMUR-URGRP | customer interface field: CauseCodeGroup (unconfirmed) | information only |
| `CauseCode` | QMUR-URCOD | customer interface field: CauseCode (unconfirmed) | information only |
| `CauseText` | QMUR-URTXT | customer interface field: CauseText (unconfirmed) | information only |

## `ZQMX_C_QualityTaskMig`

- Source: `ZQMX_I_QualityTask`
- Keys: `QualityNotification`, `TaskNumber`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `QualityNotification` | QMSM-QMNUM | customer interface field: QualityNotification (unconfirmed) | information only |
| `TaskNumber` | QMSM-MANUM | customer interface field: TaskNumber (unconfirmed) | information only |
| `TaskCodeGroup` | QMSM-MNGRP | customer interface field: TaskCodeGroup (unconfirmed) | information only |
| `TaskCode` | QMSM-MNCOD | customer interface field: TaskCode (unconfirmed) | information only |
| `TaskText` | QMSM-MATXT | customer interface field: TaskText (unconfirmed) | information only |

## `ZQMX_C_QualityActivitMig`

- Source: `ZQMX_I_QualityActivit`
- Keys: `QualityNotification`, `ActivityNumber`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `QualityNotification` | QMMA-QMNUM | customer interface field: QualityNotification (unconfirmed) | information only |
| `ActivityNumber` | QMMA-MANUM | customer interface field: ActivityNumber (unconfirmed) | information only |
| `ActivityCodeGroup` | QMMA-MNGRP | customer interface field: ActivityCodeGroup (unconfirmed) | information only |
| `ActivityCode` | QMMA-MNCOD | customer interface field: ActivityCode (unconfirmed) | information only |
| `ActivityText` | QMMA-MATXT | customer interface field: ActivityText (unconfirmed) | information only |

## `ZQMX_C_NotifStatusMig`

- Source: `ZQMX_I_NotifStatus`
- Keys: `QualityNotification`, `StatusCode`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `QualityNotification` | QMEL-QMNUM | - | copy |
| `ObjectNumber` | JEST-OBJNR | - | information only |
| `StatusCode` | JEST-STAT | - | copy |
| `StatusKind` | derived: first character of JEST-STAT | - | copy |
| `StatusChangeNumber` | JEST-CHGNR | - | copy |
| `StatusProfile` | JSTO-STSMA | - | copy |

## `ZQMX_C_NotifPartnerMig`

- Source: `ZQMX_I_NotifPartner`
- Keys: `QualityNotification`, `PartnerFunction`, `PartnerCounter`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Resolve partner identities and language-independent partner functions through a supported business interface after the selected master. Preserve partner counters; deleted partner assignments are excluded.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `QualityNotification` | QMEL-QMNUM | - | copy |
| `PartnerFunction` | IHPA-PARVW | - | copy |
| `PartnerCounter` | IHPA-COUNTER | - | copy |
| `Partner` | IHPA-PARNR | - | copy |

## `ZQMX_C_NotifUserStatusMig`

- Source: `ZQMX_I_NotifUserStatus`
- Keys: `QualityNotification`, `StatusCode`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Map source profile and E* user status codes to configured target profiles/statuses. Apply through a supported post-load business operation; do not replay system statuses or write JEST/JSTO.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `QualityNotification` | QMEL-QMNUM | - | copy |
| `StatusCode` | JEST-STAT | - | copy |
| `ObjectNumber` | JEST-OBJNR | - | information only |
| `StatusKind` | derived: first character of JEST-STAT | - | copy |
| `StatusChangeNumber` | JEST-CHGNR | - | copy |
| `StatusProfile` | JSTO-STSMA | - | copy |

## `ZQMX_C_NotifLongTextMig`

- Source: `ZQMX_I_NotifLongText`
- Keys: `TextObject`, `TextName`, `TextID`, `Language`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: SAPscript index only. Populate the explicit full text-key to business-owner link file from the source text editor/application metadata, run the text_scope preparation step against selected masters, then READ_TEXT to retrieve ordered formatted lines. Never infer the business owner from a TDNAME substring or post compressed STXL data.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `TextObject` | STXH-TDOBJECT | - | copy |
| `TextName` | STXH-TDNAME | - | copy |
| `TextID` | STXH-TDID | - | copy |
| `Language` | STXH-TDSPRAS | - | copy |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZQMX_B_NotifStatusData` | `StatusIsInactive` | JEST-INACT | Selection predicate retains only active source statuses. |

## Source controls

- Source count view: `ZQMX_C_QualityNotificMigCount`

## Open gaps

- Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.
