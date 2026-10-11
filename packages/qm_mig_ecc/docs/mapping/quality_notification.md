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

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `QualityNotification` | QMEL-QMNUM | customer interface field: QualityNotification (unconfirmed) | information only | yes |
| `NotificationType` | QMEL-QMART | customer interface field: NotificationType (unconfirmed) | information only | yes |
| `NotificationText` | QMEL-QMTXT | customer interface field: NotificationText (unconfirmed) | information only | yes |
| `Material` | QMEL-MATNR | customer interface field: Material (unconfirmed) | information only | yes |
| `Plant` | QMEL-WERK | customer interface field: Plant (unconfirmed) | information only | yes |
| `ObjectNumber` | QMEL-OBJNR | customer interface field: ObjectNumber (unconfirmed) | information only | yes |

## `ZQMX_C_QualityItemMig`

- Source: `ZQMX_I_QualityItem`
- Keys: `QualityNotification`, `NotificationItem`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `QualityNotification` | QMFE-QMNUM | customer interface field: QualityNotification (unconfirmed) | information only | yes |
| `NotificationItem` | QMFE-FENUM | customer interface field: NotificationItem (unconfirmed) | information only | yes |
| `DefectCodeGroup` | QMFE-FEGRP | customer interface field: DefectCodeGroup (unconfirmed) | information only | yes |
| `DefectCode` | QMFE-FECOD | customer interface field: DefectCode (unconfirmed) | information only | yes |
| `DefectText` | QMFE-FETXT | customer interface field: DefectText (unconfirmed) | information only | yes |

## `ZQMX_C_QualityCauseMig`

- Source: `ZQMX_I_QualityCause`
- Keys: `QualityNotification`, `NotificationItem`, `CauseNumber`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `QualityNotification` | QMUR-QMNUM | customer interface field: QualityNotification (unconfirmed) | information only | yes |
| `NotificationItem` | QMUR-FENUM | customer interface field: NotificationItem (unconfirmed) | information only | yes |
| `CauseNumber` | QMUR-URNUM | customer interface field: CauseNumber (unconfirmed) | information only | yes |
| `CauseCodeGroup` | QMUR-URGRP | customer interface field: CauseCodeGroup (unconfirmed) | information only | yes |
| `CauseCode` | QMUR-URCOD | customer interface field: CauseCode (unconfirmed) | information only | yes |
| `CauseText` | QMUR-URTXT | customer interface field: CauseText (unconfirmed) | information only | yes |

## `ZQMX_C_QualityTaskMig`

- Source: `ZQMX_I_QualityTask`
- Keys: `QualityNotification`, `TaskNumber`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `QualityNotification` | QMSM-QMNUM | customer interface field: QualityNotification (unconfirmed) | information only | yes |
| `TaskNumber` | QMSM-MANUM | customer interface field: TaskNumber (unconfirmed) | information only | yes |
| `TaskCodeGroup` | QMSM-MNGRP | customer interface field: TaskCodeGroup (unconfirmed) | information only | yes |
| `TaskCode` | QMSM-MNCOD | customer interface field: TaskCode (unconfirmed) | information only | yes |
| `TaskText` | QMSM-MATXT | customer interface field: TaskText (unconfirmed) | information only | yes |

## `ZQMX_C_QualityActivitMig`

- Source: `ZQMX_I_QualityActivit`
- Keys: `QualityNotification`, `ActivityNumber`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `QualityNotification` | QMMA-QMNUM | customer interface field: QualityNotification (unconfirmed) | information only | yes |
| `ActivityNumber` | QMMA-MANUM | customer interface field: ActivityNumber (unconfirmed) | information only | yes |
| `ActivityCodeGroup` | QMMA-MNGRP | customer interface field: ActivityCodeGroup (unconfirmed) | information only | yes |
| `ActivityCode` | QMMA-MNCOD | customer interface field: ActivityCode (unconfirmed) | information only | yes |
| `ActivityText` | QMMA-MATXT | customer interface field: ActivityText (unconfirmed) | information only | yes |

## `ZQMX_C_NotifStatusMig`

- Source: `ZQMX_I_NotifStatus`
- Keys: `QualityNotification`, `StatusCode`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `QualityNotification` | QMEL-QMNUM | - | copy |  |
| `ObjectNumber` | JEST-OBJNR | - | information only |  |
| `StatusCode` | JEST-STAT | - | copy |  |
| `StatusKind` | derived: first character of JEST-STAT | - | copy |  |
| `StatusChangeNumber` | JEST-CHGNR | - | copy |  |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZQMX_B_NotifStatusData` | `StatusIsInactive` | JEST-INACT | Selection predicate retains only active source statuses. |

## Reconciliation

- Counts: `ZQMX_C_QualityNotificMigCount` (ECC) vs `ZQMT_I_QualityNotificCount` (S/4HANA) per `QualityNotification`
- Records and fields: `ZQMX_C_QualityNotificMig` vs `ZQMT_B_QualityNotificCompare` on `QualityNotification`; compared: `NotificationType`, `NotificationText`, `Material`

```bash
python3 tools/mig_reconcile.py counts --product qm_mig_ecc --module quality_notification --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product qm_mig_ecc --module quality_notification --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.
