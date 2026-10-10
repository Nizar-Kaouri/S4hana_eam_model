# Mapping: task_list

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Target:** SAP S/4HANA Migration Cockpit - migration object *Maintenance task list*
- **Load after:** `work_center`, `equipment`, `functional_location`
- **Business key:** `TaskListType`, `TaskListGroup`, `TaskListGroupCounter` · numbering **new**
- **Key rule:** Task list groups are usually renumbered: keep the key map 'task_list_group' (old,new); maintenance plan items refer to it.
- **Scope filter:** `extract ZEMX_R_TaskListCurrent; operations of the current version only` - Historical change-number states are not migrated.

> TODO-VERIFY[H] XTL-M01: Migration Cockpit object for 'Maintenance task list' (name, approach staging tables / direct transfer) and its structure field names; targets below are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance

## Fields

| View | Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|---|
| `ZEMX_I_TaskList` | `TaskListType` | PLKO-PLNTY | PLKO-PLNTY | copy | yes |
| `ZEMX_I_TaskList` | `TaskListGroup` | PLKO-PLNNR | PLKO-PLNNR | key map: `task_list_group` | yes |
| `ZEMX_I_TaskList` | `TaskListGroupCounter` | PLKO-PLNAL | PLKO-PLNAL | copy | yes |
| `ZEMX_I_TaskList` | `TaskListVersionCounter` | PLKO-ZAEHL | - | not migrated: only the latest version is migrated |  |
| `ZEMX_I_TaskList` | `ValidityStartDate` | PLKO-DATUV | PLKO-DATUV | copy |  |
| `ZEMX_I_TaskList` | `TaskListDesc` | PLKO-KTEXT | PLKO-KTEXT | copy | yes |
| `ZEMX_I_TaskList` | `Plant` | PLKO-WERKS | PLKO-WERKS | value map: `plant` | yes |
| `ZEMX_I_TaskList` | `TaskListUsage` | PLKO-VERWE | PLKO-VERWE | value map: `task_list_usage` | yes |
| `ZEMX_I_TaskList` | `TaskListStatus` | PLKO-STATU | PLKO-STATU | copy | yes |
| `ZEMX_I_TaskList` | `MaintenancePlannerGroup` | PLKO-VAGRP | PLKO-VAGRP | value map: `planner_group` | yes |
| `ZEMX_I_TaskList` | `MainWorkCenter` | CRHD-ARBPL | PLKO-ARBID (via work center) | key map: `work_center` |  |
| `ZEMX_I_TaskList` | `MainWorkCenterPlant` | CRHD-WERKS | PLKO-ARBID (via work center) | value map: `plant` |  |
| `ZEMX_I_TaskList` | `MaintenanceStrategy` | PLKO-STRAT | PLKO-STRAT | value map: `maintenance_strategy` | yes |
| `ZEMX_I_TaskList` | `MaintObjectSystemCondition` | PLKO-ANLZU | PLKO-ANLZU | copy |  |
| `ZEMX_I_TaskList` | `IsMarkedForDeletion` | PLKO-LOEKZ | - | scope filter |  |
| `ZEMX_I_TaskList` | `CreationDate` | PLKO-ANDAT | - | information only |  |
| `ZEMX_I_TaskList` | `CreatedByUser` | PLKO-ANNAM | - | information only |  |
| `ZEMX_I_TaskList` | `LastChangeDate` | PLKO-AEDAT | - | information only |  |
| `ZEMX_I_TaskListOperation` | `TaskListType` | PLAS-PLNTY | PLAS-PLNTY | copy |  |
| `ZEMX_I_TaskListOperation` | `TaskListGroup` | PLAS-PLNNR | PLAS-PLNNR | key map: `task_list_group` |  |
| `ZEMX_I_TaskListOperation` | `TaskListGroupCounter` | PLAS-PLNAL | PLAS-PLNAL | copy |  |
| `ZEMX_I_TaskListOperation` | `TaskListSequence` | PLAS-PLNFL | PLAS-PLNFL | copy |  |
| `ZEMX_I_TaskListOperation` | `TaskListOperationInternalId` | PLAS-PLNKN | - | not migrated: internal node number - regenerated on S/4HANA |  |
| `ZEMX_I_TaskListOperation` | `TaskListOpAssgmtVersion` | PLAS-ZAEHL | - | not migrated: only the latest version is migrated |  |
| `ZEMX_I_TaskListOperation` | `TaskListOpVersionCounter` | PLPO-ZAEHL | - | not migrated: only the latest version is migrated |  |
| `ZEMX_I_TaskListOperation` | `TaskListOperation` | PLPO-VORNR | PLPO-VORNR | copy |  |
| `ZEMX_I_TaskListOperation` | `TaskListSubOperation` | PLPO-UVORN | PLPO-UVORN | copy |  |
| `ZEMX_I_TaskListOperation` | `OperationControlKey` | PLPO-STEUS | PLPO-STEUS | value map: `control_key` |  |
| `ZEMX_I_TaskListOperation` | `OperationText` | PLPO-LTXA1 | PLPO-LTXA1 | copy |  |
| `ZEMX_I_TaskListOperation` | `WorkCenter` | CRHD-ARBPL | PLPO-ARBID (via work center) | key map: `work_center` |  |
| `ZEMX_I_TaskListOperation` | `WorkCenterPlant` | CRHD-WERKS | PLPO-ARBID (via work center) | value map: `plant` |  |
| `ZEMX_I_TaskListOperation` | `Plant` | PLPO-WERKS | PLPO-WERKS | value map: `plant` |  |
| `ZEMX_I_TaskListOperation` | `ActivityType` | PLPO-LARNT | PLPO-LARNT | value map: `activity_type` |  |
| `ZEMX_I_TaskListOperation` | `PlannedWorkQuantity` | PLPO-ARBEI | PLPO-ARBEI | copy |  |
| `ZEMX_I_TaskListOperation` | `PlannedWorkQuantityUnit` | PLPO-ARBEH | PLPO-ARBEH | value map: `unit_of_measure` |  |
| `ZEMX_I_TaskListOperation` | `OperationDuration` | PLPO-DAUNO | PLPO-DAUNO | copy |  |
| `ZEMX_I_TaskListOperation` | `OperationDurationUnit` | PLPO-DAUNE | PLPO-DAUNE | value map: `unit_of_measure` |  |
| `ZEMX_I_TaskListOperation` | `NumberOfCapacities` | PLPO-ANZZL | PLPO-ANZZL | copy |  |
| `ZEMX_I_TaskListOperation` | `OpAssignmentIsDeleted` | PLAS-LOEKZ | - | scope filter |  |
| `ZEMX_I_TaskListOperation` | `IsMarkedForDeletion` | PLPO-LOEKZ | - | scope filter |  |
| `ZEMX_I_TaskListAllocation` | `TaskListType` | EAPL-PLNTY | EAPL-PLNTY | copy |  |
| `ZEMX_I_TaskListAllocation` | `TaskListGroup` | EAPL-PLNNR | EAPL-PLNNR | key map: `task_list_group` |  |
| `ZEMX_I_TaskListAllocation` | `TaskListGroupCounter` | EAPL-PLNAL | EAPL-PLNAL | copy |  |
| `ZEMX_I_TaskListAllocation` | `Equipment` | EAPL-EQUNR | EAPL-EQUNR | key map: `equipment` |  |
| `ZEMX_I_TaskListAllocation` | `FunctionalLocation` | EAPL-TPLNR | EAPL-TPLNR | key map: `functional_location` |  |

## Value maps and key maps

Templates: `docs/mapping/templates/` (columns `source,target,comment`). An empty map means "same value on S/4HANA".

- value map `activity_type`
- value map `control_key`
- value map `maintenance_strategy`
- value map `planner_group`
- value map `plant`
- value map `task_list_usage`
- value map `unit_of_measure`
- key map `equipment`
- key map `functional_location`
- key map `task_list_group`
- key map `work_center`

This object's load provides the key map(s) `task_list_group` (old key, new key from the load log).

## Reconciliation

- Counts: `ZEMX_R_TaskListCount` (ECC) vs `ZEMT_R_TaskListCount` (S/4HANA) per `TaskListType`, `Plant` (value map `plant`)
- Records and fields: `ZEMX_I_TaskList` vs `ZEMT_I_TaskListCompare` on `TaskListType`, `TaskListGroup`, `TaskListGroupCounter` (key map `task_list_group`); compared fields: `TaskListDesc`, `Plant`, `TaskListUsage`, `TaskListStatus`, `MaintenancePlannerGroup`, `MaintenanceStrategy`

```bash
python3 tools/mig_reconcile.py counts --module task_list --source ecc_counts.csv --target s4_counts.csv --maps <folder>
python3 tools/mig_reconcile.py records --module task_list --source ecc_extract.csv --target s4_compare.csv --maps <folder>
```

## Open gaps

- TODO-VERIFY[M] XTL-G01: component allocation (PLMZ), production resources/tools (PLFH) and maintenance packages per operation (PLWP) are not extracted in the pilot
