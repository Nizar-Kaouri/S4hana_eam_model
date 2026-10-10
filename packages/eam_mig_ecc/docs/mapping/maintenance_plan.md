# Migration interface: maintenance_plan

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** `equipment`, `functional_location`, `task_list`, `measuring_point`, `measurement_document`
- **Business key:** `MaintenancePlan` · numbering **new**
- **Key rule:** Plans and items are usually renumbered: the load program writes old -> new into the key maps 'MAINTENANCE_PLAN' and 'MAINTENANCE_ITEM'.

> TODO-VERIFY[M] XPL-M01: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

Values are delivered **translated**: every field marked *value map* / *key map* is looked up in the mapping table `ZEMX_MAP` (map name in capitals); without an entry the old value is delivered. `Legacy*` key fields carry the old key of the record.

## `ZEMX_C_MaintenancePlanMig`

- Source: `ZEMX_I_MaintenancePlan`
- Keys: `LegacyMaintenancePlan`
- Scope: `src.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `MaintenancePlan` | MPLA-WARPL | MPLA-WARPL | key map: `MAINTENANCE_PLAN` | yes |
| `MaintenancePlanDesc` | MPLA-WPTXT | MPLA-WPTXT | copy | yes |
| `MaintenancePlanCategory` | MPLA-MPTYP | MPLA-MPTYP | value map: `MAINTENANCE_PLAN_CATEGORY` | yes |
| `MaintenanceStrategy` | MPLA-STRAT | MPLA-STRAT | value map: `MAINTENANCE_STRATEGY` | yes |
| `AuthorizationGroup` | MPLA-BEGRU | MPLA-BEGRU | value map: `AUTHORIZATION_GROUP` |  |
| `SchedulingPeriod` | MPLA-ABRHO | MPLA-ABRHO | copy |  |
| `SchedulingPeriodUnit` | MPLA-HUNIT | MPLA-HUNIT | value map: `UNIT_OF_MEASURE` |  |
| `CallHorizonPercent` | MPLA-HORIZ | MPLA-HORIZ | copy |  |
| `CycleModificationFactor` | MPLA-SFAKT | MPLA-SFAKT | copy |  |
| `SchedulingIndicator` | MPLA-STICH | MPLA-STICH | copy |  |
| `LateCompletionShiftFactor` | MPLA-VSPOS | MPLA-VSPOS | copy |  |
| `LateCompletionTolerance` | MPLA-TOPOS | MPLA-TOPOS | copy |  |
| `EarlyCompletionShiftFactor` | MPLA-VSNEG | MPLA-VSNEG | copy |  |
| `EarlyCompletionTolerance` | MPLA-TONEG | MPLA-TONEG | copy |  |
| `FactoryCalendar` | MPLA-FABKL | MPLA-FABKL | value map: `FACTORY_CALENDAR` |  |
| `LastCompletionDate` | derived: max( cal.CompletionDate ) from MHIS-LRMDT | - | copy |  |
| `LastChangeDate` | MPLA-AEDAT | - | information only |  |

## `ZEMX_C_MaintenanceItemMig`

- Source: `ZEMX_I_MaintenanceItem`
- Keys: `LegacyMaintenanceItem`
- Scope: `obj.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `MaintenanceItem` | MPOS-WAPOS | MPOS-WAPOS | key map: `MAINTENANCE_ITEM` |  |
| `MaintenancePlan` | MPOS-WARPL | MPOS-WARPL | key map: `MAINTENANCE_PLAN` |  |
| `MaintenanceItemDescription` | MPOS-PSTXT | MPOS-PSTXT | copy |  |
| `Equipment` | MPOS-EQUNR | MPOS-EQUNR | key map: `EQUIPMENT` |  |
| `FunctionalLocation` | MPOS-TPLNR | MPOS-TPLNR | key map: `FUNCTIONAL_LOCATION` |  |
| `MaintenancePlanningPlant` | MPOS-IWERK | MPOS-IWERK | value map: `PLANT` |  |
| `MaintenancePlannerGroup` | MPOS-WPGRP | MPOS-WPGRP | value map: `PLANNER_GROUP` |  |
| `MainWorkCenter` | CRHD-ARBPL | CRHD-ARBPL | key map: `WORK_CENTER` |  |
| `MainWorkCenterPlant` | CRHD-WERKS | CRHD-WERKS | value map: `PLANT` |  |
| `MaintenanceOrderType` | MPOS-AUART | MPOS-AUART | value map: `ORDER_TYPE` |  |
| `NotificationType` | MPOS-QMART | MPOS-QMART | value map: `NOTIFICATION_TYPE` |  |
| `MaintenanceActivityType` | MPOS-ILART | MPOS-ILART | value map: `ACTIVITY_TYPE_PM` |  |
| `MaintPriority` | MPOS-PRIOK | MPOS-PRIOK | value map: `PRIORITY` |  |
| `TaskListType` | MPOS-PLNTY | MPOS-PLNTY | copy |  |
| `TaskListGroup` | MPOS-PLNNR | MPOS-PLNNR | key map: `TASK_LIST_GROUP` |  |
| `TaskListGroupCounter` | MPOS-PLNAL | MPOS-PLNAL | copy |  |
| `BusinessArea` | ILOA-GSBER | ILOA-GSBER | value map: `BUSINESS_AREA` |  |
| `LastChangeDate` | MPOS-AEDAT | - | information only |  |

## `ZEMX_C_MaintPlanCycleMig`

- Source: `ZEMX_I_MaintPlanCycle`
- Keys: `LegacyMaintenancePlan`, `MaintenancePlanCycle`
- Scope: `obj.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `MaintenancePlanCycle` | MMPT-NUMMER | MMPT-NUMMER | copy |  |
| `MaintenancePlan` | MMPT-WARPL | MMPT-WARPL | key map: `MAINTENANCE_PLAN` |  |
| `CycleValue` | MMPT-ZYKL1 | MMPT-ZYKL1 | convert (load program): float_si_to_unit |  |
| `CycleUnit` | MMPT-ZEIEH | MMPT-ZEIEH | value map: `UNIT_OF_MEASURE` |  |
| `CycleText` | MMPT-PAK_TEXT | MMPT-PAK_TEXT | copy |  |
| `MeasuringPoint` | MMPT-POINT | MMPT-POINT | key map: `MEASURING_POINT` |  |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZEMX_I_MaintenancePlan` | `LastCallNumber` | derived: max( cal.MaintPlanCallNumber ) from MHIS-ABNUM | information only |
| `ZEMX_I_MaintenancePlan` | `ObjectNumber` | MPLA-OBJNR | not migrated: status object number - regenerated on S/4HANA |
| `ZEMX_I_MaintenancePlan` | `IsMarkedForDeletion` | derived: case dlfl.StatusCode when 'I0076' then 'X' else '' end from JEST-STAT | scope flag |
| `ZEMX_I_MaintenancePlan` | `CreationDate` | MPLA-ERSDT | information only |
| `ZEMX_I_MaintenancePlan` | `CreatedByUser` | MPLA-ERNAM | information only |
| `ZEMX_I_MaintenanceItem` | `MainWorkCenterInternalID` | MPOS-GEWRK | not migrated: internal object ID - replaced by MainWorkCenter |
| `ZEMX_I_MaintenanceItem` | `LocAcctAssignment` | MPOS-ILOAN | not migrated: internal location record - regenerated on S/4HANA |
| `ZEMX_I_MaintenanceItem` | `CreationDate` | MPOS-ERSDT | information only |

## Maps

- value map `ACTIVITY_TYPE_PM`
- value map `AUTHORIZATION_GROUP`
- value map `BUSINESS_AREA`
- value map `FACTORY_CALENDAR`
- value map `MAINTENANCE_PLAN_CATEGORY`
- value map `MAINTENANCE_STRATEGY`
- value map `NOTIFICATION_TYPE`
- value map `ORDER_TYPE`
- value map `PLANNER_GROUP`
- value map `PLANT`
- value map `PRIORITY`
- value map `UNIT_OF_MEASURE`
- key map `EQUIPMENT`
- key map `FUNCTIONAL_LOCATION`
- key map `MAINTENANCE_ITEM`
- key map `MAINTENANCE_PLAN`
- key map `MEASURING_POINT`
- key map `TASK_LIST_GROUP`
- key map `WORK_CENTER`

After loading this object, the key map(s) `MAINTENANCE_PLAN`, `MAINTENANCE_ITEM` (old key, new key from the load log) must be written into `ZEMX_MAP` on the ECC system (by the load program via RFC or by uploading the load log) before the objects that use them are extracted.

## Reconciliation

- Counts: `ZEMX_C_MaintPlanMigCount` (ECC, translated values) vs `ZEMT_I_MaintPlanCount` (S/4HANA) per `MaintenancePlanCategory`, `MaintenanceStrategy`
- Records and fields: `ZEMX_C_MaintenancePlanMig` vs `ZEMT_I_MaintPlanCompare` on `MaintenancePlan`; compared: `MaintenancePlanDesc`, `MaintenancePlanCategory`, `MaintenanceStrategy`

```bash
python3 tools/mig_reconcile.py counts --module maintenance_plan --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --module maintenance_plan --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- TODO-VERIFY[H] XPL-G01: open calls (orders / notifications created by scheduling) must be completed or migrated as open orders before the plan is restarted, otherwise calls are duplicated
