# Mapping: maintenance_plan

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Target:** SAP S/4HANA Migration Cockpit - migration object *Maintenance plan*
- **Load after:** `equipment`, `functional_location`, `task_list`, `measuring_point`, `measurement_document`
- **Business key:** `MaintenancePlan` · numbering **new**
- **Key rule:** Plans and items are usually renumbered: keep the key maps 'maintenance_plan' and 'maintenance_item' (old,new).
- **Scope filter:** `IsMarkedForDeletion = '' (and not inactive, see object_status)` - Start the plans on S/4HANA from the last completion date in ZEMX_I_MaintPlanCallHistory; do not migrate open calls (they are recreated by scheduling).

> TODO-VERIFY[H] XPL-M01: Migration Cockpit object for 'Maintenance plan' (name, approach staging tables / direct transfer) and its structure field names; targets below are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance

## Fields

| View | Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|---|
| `ZEMX_I_MaintenancePlan` | `MaintenancePlan` | MPLA-WARPL | MPLA-WARPL | key map: `maintenance_plan` | yes |
| `ZEMX_I_MaintenancePlan` | `MaintenancePlanDesc` | MPLA-WPTXT | MPLA-WPTXT | copy | yes |
| `ZEMX_I_MaintenancePlan` | `MaintenancePlanCategory` | MPLA-MPTYP | MPLA-MPTYP | value map: `maintenance_plan_category` | yes |
| `ZEMX_I_MaintenancePlan` | `MaintenanceStrategy` | MPLA-STRAT | MPLA-STRAT | value map: `maintenance_strategy` | yes |
| `ZEMX_I_MaintenancePlan` | `AuthorizationGroup` | MPLA-BEGRU | MPLA-BEGRU | value map: `authorization_group` |  |
| `ZEMX_I_MaintenancePlan` | `SchedulingPeriod` | MPLA-ABRHO | MPLA-ABRHO | copy |  |
| `ZEMX_I_MaintenancePlan` | `SchedulingPeriodUnit` | MPLA-HUNIT | MPLA-HUNIT | value map: `unit_of_measure` |  |
| `ZEMX_I_MaintenancePlan` | `CallHorizonPercent` | MPLA-HORIZ | MPLA-HORIZ | copy |  |
| `ZEMX_I_MaintenancePlan` | `CycleModificationFactor` | MPLA-SFAKT | MPLA-SFAKT | copy |  |
| `ZEMX_I_MaintenancePlan` | `SchedulingIndicator` | MPLA-STICH | MPLA-STICH | copy |  |
| `ZEMX_I_MaintenancePlan` | `LateCompletionShiftFactor` | MPLA-VSPOS | MPLA-VSPOS | copy |  |
| `ZEMX_I_MaintenancePlan` | `LateCompletionTolerance` | MPLA-TOPOS | MPLA-TOPOS | copy |  |
| `ZEMX_I_MaintenancePlan` | `EarlyCompletionShiftFactor` | MPLA-VSNEG | MPLA-VSNEG | copy |  |
| `ZEMX_I_MaintenancePlan` | `EarlyCompletionTolerance` | MPLA-TONEG | MPLA-TONEG | copy |  |
| `ZEMX_I_MaintenancePlan` | `FactoryCalendar` | MPLA-FABKL | MPLA-FABKL | value map: `factory_calendar` |  |
| `ZEMX_I_MaintenancePlan` | `ObjectNumber` | MPLA-OBJNR | - | not migrated: status object number - regenerated on S/4HANA |  |
| `ZEMX_I_MaintenancePlan` | `IsMarkedForDeletion` | case dlfl.stat when 'I0076' then 'X' else '' end | - | scope filter |  |
| `ZEMX_I_MaintenancePlan` | `CreationDate` | MPLA-ERSDT | - | information only |  |
| `ZEMX_I_MaintenancePlan` | `CreatedByUser` | MPLA-ERNAM | - | information only |  |
| `ZEMX_I_MaintenancePlan` | `LastChangeDate` | MPLA-AEDAT | - | information only |  |
| `ZEMX_I_MaintenanceItem` | `MaintenanceItem` | MPOS-WAPOS | MPOS-WAPOS | key map: `maintenance_item` |  |
| `ZEMX_I_MaintenanceItem` | `MaintenancePlan` | MPOS-WARPL | MPOS-WARPL | key map: `maintenance_plan` |  |
| `ZEMX_I_MaintenanceItem` | `MaintenanceItemDescription` | MPOS-PSTXT | MPOS-PSTXT | copy |  |
| `ZEMX_I_MaintenanceItem` | `Equipment` | MPOS-EQUNR | MPOS-EQUNR | key map: `equipment` |  |
| `ZEMX_I_MaintenanceItem` | `FunctionalLocation` | MPOS-TPLNR | MPOS-TPLNR | key map: `functional_location` |  |
| `ZEMX_I_MaintenanceItem` | `MaintenancePlanningPlant` | MPOS-IWERK | MPOS-IWERK | value map: `plant` |  |
| `ZEMX_I_MaintenanceItem` | `MaintenancePlannerGroup` | MPOS-WPGRP | MPOS-WPGRP | value map: `planner_group` |  |
| `ZEMX_I_MaintenanceItem` | `MainWorkCenter` | CRHD-ARBPL | MPOS-GEWRK (via work center) | key map: `work_center` |  |
| `ZEMX_I_MaintenanceItem` | `MainWorkCenterPlant` | CRHD-WERKS | MPOS-GEWRK (via work center) | value map: `plant` |  |
| `ZEMX_I_MaintenanceItem` | `MaintenanceOrderType` | MPOS-AUART | MPOS-AUART | value map: `order_type` |  |
| `ZEMX_I_MaintenanceItem` | `NotificationType` | MPOS-QMART | MPOS-QMART | value map: `notification_type` |  |
| `ZEMX_I_MaintenanceItem` | `MaintenanceActivityType` | MPOS-ILART | MPOS-ILART | value map: `activity_type_pm` |  |
| `ZEMX_I_MaintenanceItem` | `MaintPriority` | MPOS-PRIOK | MPOS-PRIOK | value map: `priority` |  |
| `ZEMX_I_MaintenanceItem` | `TaskListType` | MPOS-PLNTY | MPOS-PLNTY | copy |  |
| `ZEMX_I_MaintenanceItem` | `TaskListGroup` | MPOS-PLNNR | MPOS-PLNNR | key map: `task_list_group` |  |
| `ZEMX_I_MaintenanceItem` | `TaskListGroupCounter` | MPOS-PLNAL | MPOS-PLNAL | copy |  |
| `ZEMX_I_MaintenanceItem` | `BusinessArea` | ILOA-GSBER | ILOA-GSBER | value map: `business_area` |  |
| `ZEMX_I_MaintenanceItem` | `CreationDate` | MPOS-ERSDT | - | information only |  |
| `ZEMX_I_MaintenanceItem` | `LastChangeDate` | MPOS-AEDAT | - | information only |  |
| `ZEMX_I_MaintPlanCycle` | `MaintenancePlan` | MMPT-WARPL | MMPT-WARPL | key map: `maintenance_plan` |  |
| `ZEMX_I_MaintPlanCycle` | `MaintenancePlanCycle` | MMPT-NUMMER | MMPT-NUMMER | copy |  |
| `ZEMX_I_MaintPlanCycle` | `CycleValue` | MMPT-ZYKL1 | MMPT-ZYKL1 | convert: `float_si_to_unit` |  |
| `ZEMX_I_MaintPlanCycle` | `CycleUnit` | MMPT-ZEIEH | MMPT-ZEIEH | value map: `unit_of_measure` |  |
| `ZEMX_I_MaintPlanCycle` | `CycleText` | MMPT-PAK_TEXT | MMPT-PAK_TEXT | copy |  |
| `ZEMX_I_MaintPlanCycle` | `MeasuringPoint` | MMPT-POINT | MMPT-POINT | key map: `measuring_point` |  |
| `ZEMX_I_MaintPlanCallHistory` | `MaintenancePlan` | MHIS-WARPL | MHIS-WARPL | key map: `maintenance_plan` |  |
| `ZEMX_I_MaintPlanCallHistory` | `MaintPlanCallNumber` | MHIS-ABNUM | MHIS-ABNUM | copy |  |
| `ZEMX_I_MaintPlanCallHistory` | `PlannedDate` | MHIS-NPLDA | MHIS-NPLDA | copy |  |
| `ZEMX_I_MaintPlanCallHistory` | `CallDate` | MHIS-HORDA | MHIS-HORDA | copy |  |
| `ZEMX_I_MaintPlanCallHistory` | `CompletionDate` | MHIS-LRMDT | MHIS-LRMDT | copy |  |

## Value maps and key maps

Templates: `docs/mapping/templates/` (columns `source,target,comment`). An empty map means "same value on S/4HANA".

- value map `activity_type_pm`
- value map `authorization_group`
- value map `business_area`
- value map `factory_calendar`
- value map `maintenance_plan_category`
- value map `maintenance_strategy`
- value map `notification_type`
- value map `order_type`
- value map `planner_group`
- value map `plant`
- value map `priority`
- value map `unit_of_measure`
- key map `equipment`
- key map `functional_location`
- key map `maintenance_item`
- key map `maintenance_plan`
- key map `measuring_point`
- key map `task_list_group`
- key map `work_center`

This object's load provides the key map(s) `maintenance_plan`, `maintenance_item` (old key, new key from the load log).

## Reconciliation

- Counts: `ZEMX_R_MaintPlanCount` (ECC) vs `ZEMT_R_MaintPlanCount` (S/4HANA) per `MaintenancePlanCategory` (value map `maintenance_plan_category`), `MaintenanceStrategy` (value map `maintenance_strategy`)
- Records and fields: `ZEMX_I_MaintenancePlan` vs `ZEMT_I_MaintPlanCompare` on `MaintenancePlan` (key map `maintenance_plan`); compared fields: `MaintenancePlanDesc`, `MaintenancePlanCategory`, `MaintenanceStrategy`

```bash
python3 tools/mig_reconcile.py counts --module maintenance_plan --source ecc_counts.csv --target s4_counts.csv --maps <folder>
python3 tools/mig_reconcile.py records --module maintenance_plan --source ecc_extract.csv --target s4_compare.csv --maps <folder>
```

## Open gaps

- TODO-VERIFY[H] XPL-G01: open calls (orders / notifications created by scheduling) must be completed or migrated as open orders before the plan is restarted, otherwise calls are duplicated
