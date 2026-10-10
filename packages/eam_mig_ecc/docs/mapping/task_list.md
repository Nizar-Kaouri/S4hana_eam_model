# Migration interface: task_list

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** `work_center`, `equipment`, `functional_location`
- **Business key:** `TaskListType`, `TaskListGroup`, `TaskListGroupCounter` · numbering **new**
- **Key rule:** Task list groups are usually renumbered: the load program writes old -> new into the key map 'TASK_LIST_GROUP'; maintenance plan items use it.

> TODO-VERIFY[M] XTL-M01: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

Values are delivered **translated**: every field marked *value map* / *key map* is looked up in the mapping table `ZEMX_MAP` (map name in capitals); without an entry the old value is delivered. `Legacy*` key fields carry the old key of the record.

## `ZEMX_C_TaskListMig`

- Source: `ZEMX_I_TaskListCurrent`
- Keys: `LegacyTaskListGroup`, `TaskListType`, `TaskListGroupCounter`
- Scope: `src.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `TaskListType` | PLKO-PLNTY | PLKO-PLNTY | copy | yes |
| `TaskListGroupCounter` | PLKO-PLNAL | PLKO-PLNAL | copy | yes |
| `TaskListGroup` | PLKO-PLNNR | PLKO-PLNNR | key map: `TASK_LIST_GROUP` | yes |
| `ValidityStartDate` | PLKO-DATUV | PLKO-DATUV | copy |  |
| `TaskListDesc` | PLKO-KTEXT | PLKO-KTEXT | copy | yes |
| `Plant` | PLKO-WERKS | PLKO-WERKS | value map: `PLANT` | yes |
| `TaskListUsage` | PLKO-VERWE | PLKO-VERWE | value map: `TASK_LIST_USAGE` | yes |
| `TaskListStatus` | PLKO-STATU | PLKO-STATU | value map: `TASK_LIST_STATUS` | yes |
| `MaintenancePlannerGroup` | PLKO-VAGRP | PLKO-VAGRP | value map: `PLANNER_GROUP` | yes |
| `MainWorkCenter` | CRHD-ARBPL | CRHD-ARBPL | key map: `WORK_CENTER` |  |
| `MainWorkCenterPlant` | CRHD-WERKS | CRHD-WERKS | value map: `PLANT` |  |
| `MaintenanceStrategy` | PLKO-STRAT | PLKO-STRAT | value map: `MAINTENANCE_STRATEGY` | yes |
| `MaintObjectSystemCondition` | PLKO-ANLZU | PLKO-ANLZU | copy |  |
| `LastChangeDate` | PLKO-AEDAT | - | information only |  |

## `ZEMX_C_TaskListOperationMig`

- Source: `ZEMX_I_TaskListOperation`
- Keys: `LegacyTaskListGroup`, `TaskListType`, `TaskListGroupCounter`, `TaskListSequence`, `TaskListOperation`
- Scope: `src.IsMarkedForDeletion = '' and src.OpAssignmentIsDeleted = '' and obj.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `TaskListType` | PLAS-PLNTY | PLAS-PLNTY | copy |  |
| `TaskListGroupCounter` | PLAS-PLNAL | PLAS-PLNAL | copy |  |
| `TaskListSequence` | PLAS-PLNFL | PLAS-PLNFL | copy |  |
| `TaskListOperation` | PLPO-VORNR | PLPO-VORNR | copy |  |
| `TaskListGroup` | PLAS-PLNNR | PLAS-PLNNR | key map: `TASK_LIST_GROUP` |  |
| `TaskListSubOperation` | PLPO-UVORN | PLPO-UVORN | copy |  |
| `OperationControlKey` | PLPO-STEUS | PLPO-STEUS | value map: `CONTROL_KEY` |  |
| `OperationText` | PLPO-LTXA1 | PLPO-LTXA1 | copy |  |
| `WorkCenter` | CRHD-ARBPL | CRHD-ARBPL | key map: `WORK_CENTER` |  |
| `WorkCenterPlant` | CRHD-WERKS | CRHD-WERKS | value map: `PLANT` |  |
| `Plant` | PLPO-WERKS | PLPO-WERKS | value map: `PLANT` |  |
| `ActivityType` | PLPO-LARNT | PLPO-LARNT | value map: `ACTIVITY_TYPE` |  |
| `PlannedWorkQuantity` | PLPO-ARBEI | PLPO-ARBEI | copy |  |
| `PlannedWorkQuantityUnit` | PLPO-ARBEH | PLPO-ARBEH | copy: reference unit of a quantity - unit of measure customizing is transported, not mapped |  |
| `OperationDuration` | PLPO-DAUNO | PLPO-DAUNO | copy |  |
| `OperationDurationUnit` | PLPO-DAUNE | PLPO-DAUNE | copy: reference unit of a quantity - unit of measure customizing is transported, not mapped |  |
| `NumberOfCapacities` | PLPO-ANZZL | PLPO-ANZZL | copy |  |

## `ZEMX_C_TaskListAllocationMig`

- Source: `ZEMX_I_TaskListObjectAssgmt`
- Keys: `LegacyTaskListGroup`, `TaskListType`, `TaskListGroupCounter`
- Scope: `obj.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `TaskListType` | EAPL-PLNTY | EAPL-PLNTY | copy |  |
| `TaskListGroupCounter` | EAPL-PLNAL | EAPL-PLNAL | copy |  |
| `TaskListGroup` | EAPL-PLNNR | EAPL-PLNNR | key map: `TASK_LIST_GROUP` |  |
| `Equipment` | EAPL-EQUNR | EAPL-EQUNR | key map: `EQUIPMENT` |  |
| `FunctionalLocation` | EAPL-TPLNR | EAPL-TPLNR | key map: `FUNCTIONAL_LOCATION` |  |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZEMX_I_TaskListCurrent` | `TaskListVersionCounter` | PLKO-ZAEHL | information only |
| `ZEMX_I_TaskListCurrent` | `MainWorkCenterInternalID` | PLKO-ARBID | not migrated: internal object ID - replaced by MainWorkCenter |
| `ZEMX_I_TaskListCurrent` | `IsMarkedForDeletion` | PLKO-LOEKZ | scope flag |
| `ZEMX_I_TaskListCurrent` | `CreationDate` | PLKO-ANDAT | information only |
| `ZEMX_I_TaskListOperation` | `TaskListOperationInternalId` | PLAS-PLNKN | not migrated: internal node number - regenerated on S/4HANA |
| `ZEMX_I_TaskListOperation` | `TaskListOpAssgmtVersion` | PLAS-ZAEHL | information only |
| `ZEMX_I_TaskListOperation` | `TaskListOpVersionCounter` | PLPO-ZAEHL | information only |
| `ZEMX_I_TaskListOperation` | `WorkCenterInternalID` | PLPO-ARBID | not migrated: internal object ID - replaced by WorkCenter |
| `ZEMX_I_TaskListOperation` | `OpAssignmentIsDeleted` | PLAS-LOEKZ | scope flag |
| `ZEMX_I_TaskListOperation` | `IsMarkedForDeletion` | PLPO-LOEKZ | scope flag |

## Maps

- value map `ACTIVITY_TYPE`
- value map `CONTROL_KEY`
- value map `MAINTENANCE_STRATEGY`
- value map `PLANNER_GROUP`
- value map `PLANT`
- value map `TASK_LIST_STATUS`
- value map `TASK_LIST_USAGE`
- key map `EQUIPMENT`
- key map `FUNCTIONAL_LOCATION`
- key map `TASK_LIST_GROUP`
- key map `WORK_CENTER`

After loading this object, the key map(s) `TASK_LIST_GROUP` (old key, new key from the load log) must be written into `ZEMX_MAP` on the ECC system (by the load program via RFC or by uploading the load log) before the objects that use them are extracted.

## Reconciliation

- Counts: `ZEMX_C_TaskListMigCount` (ECC, translated values) vs `ZEMT_I_TaskListCount` (S/4HANA) per `TaskListType`, `Plant`
- Records and fields: `ZEMX_C_TaskListMig` vs `ZEMT_I_TaskListCompare` on `TaskListType`, `TaskListGroup`, `TaskListGroupCounter`; compared: `TaskListDesc`, `Plant`, `TaskListUsage`, `TaskListStatus`, `MaintenancePlannerGroup`, `MaintenanceStrategy`

```bash
python3 tools/mig_reconcile.py counts --module task_list --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --module task_list --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- TODO-VERIFY[M] XTL-G01: component allocation (PLMZ), production resources/tools (PLFH) and maintenance packages per operation (PLWP) are not extracted in the pilot
