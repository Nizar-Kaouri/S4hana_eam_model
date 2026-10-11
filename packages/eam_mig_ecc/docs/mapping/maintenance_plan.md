# Migration interface: maintenance_plan

> Version **1.0.0**

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** `equipment`, `functional_location`, `task_list`, `measuring_point`, `measurement_document`
- **Business key:** `MaintenancePlan` · numbering **new**
- **Key rule:** Plans and items are usually renumbered: the load program keeps the old -> new numbers.

> Compatibility note: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEMX_C_MaintenancePlanMig`

- Source: `ZEMX_I_MaintenancePlan`
- Keys: `MaintenancePlan`
- Scope: `src.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `MaintenancePlan` | MPLA-WARPL | MPLA-WARPL | copy | yes |
| `MaintenancePlanDesc` | MPLA-WPTXT | MPLA-WPTXT | copy | yes |
| `MaintenancePlanCategory` | MPLA-MPTYP | MPLA-MPTYP | copy | yes |
| `MaintenanceStrategy` | MPLA-STRAT | MPLA-STRAT | copy | yes |
| `AuthorizationGroup` | MPLA-BEGRU | MPLA-BEGRU | copy |  |
| `SchedulingPeriod` | MPLA-ABRHO | MPLA-ABRHO | copy |  |
| `SchedulingPeriodUnit` | MPLA-HUNIT | MPLA-HUNIT | copy |  |
| `CallHorizonPercent` | MPLA-HORIZ | MPLA-HORIZ | copy |  |
| `CycleModificationFactor` | MPLA-SFAKT | MPLA-SFAKT | copy |  |
| `SchedulingIndicator` | MPLA-STICH | MPLA-STICH | copy |  |
| `LateCompletionShiftFactor` | MPLA-VSPOS | MPLA-VSPOS | copy |  |
| `LateCompletionTolerance` | MPLA-TOPOS | MPLA-TOPOS | copy |  |
| `EarlyCompletionShiftFactor` | MPLA-VSNEG | MPLA-VSNEG | copy |  |
| `EarlyCompletionTolerance` | MPLA-TONEG | MPLA-TONEG | copy |  |
| `FactoryCalendar` | MPLA-FABKL | MPLA-FABKL | copy |  |
| `LastCompletionDate` | derived: max( cal.CompletionDate ) from MHIS-LRMDT | - | copy |  |
| `LastChangeDate` | MPLA-AEDAT | - | information only |  |

## `ZEMX_C_MaintenanceItemMig`

- Source: `ZEMX_I_MaintenanceItem`
- Keys: `MaintenanceItem`
- Scope: `_MaintenancePlan.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `MaintenanceItem` | MPOS-WAPOS | MPOS-WAPOS | copy |  |
| `MaintenancePlan` | MPOS-WARPL | MPOS-WARPL | copy |  |
| `MaintenanceItemDescription` | MPOS-PSTXT | MPOS-PSTXT | copy |  |
| `Equipment` | MPOS-EQUNR | MPOS-EQUNR | copy |  |
| `FunctionalLocation` | MPOS-TPLNR | MPOS-TPLNR | copy |  |
| `MaintenancePlanningPlant` | MPOS-IWERK | MPOS-IWERK | copy |  |
| `MaintenancePlannerGroup` | MPOS-WPGRP | MPOS-WPGRP | copy |  |
| `MainWorkCenter` | CRHD-ARBPL | CRHD-ARBPL | copy |  |
| `MainWorkCenterPlant` | CRHD-WERKS | CRHD-WERKS | copy |  |
| `MaintenanceOrderType` | MPOS-AUART | MPOS-AUART | copy |  |
| `NotificationType` | MPOS-QMART | MPOS-QMART | copy |  |
| `MaintenanceActivityType` | MPOS-ILART | MPOS-ILART | copy |  |
| `MaintPriority` | MPOS-PRIOK | MPOS-PRIOK | copy |  |
| `TaskListType` | MPOS-PLNTY | MPOS-PLNTY | copy |  |
| `TaskListGroup` | MPOS-PLNNR | MPOS-PLNNR | copy |  |
| `TaskListGroupCounter` | MPOS-PLNAL | MPOS-PLNAL | copy |  |
| `BusinessArea` | ILOA-GSBER | ILOA-GSBER | copy |  |
| `LastChangeDate` | MPOS-AEDAT | - | information only |  |

## `ZEMX_C_MaintPlanCycleMig`

- Source: `ZEMX_I_MaintPlanCycle`
- Keys: `MaintenancePlan`, `MaintenancePlanCycle`
- Scope: `_MaintenancePlan.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `MaintenancePlan` | MMPT-WARPL | MMPT-WARPL | copy |  |
| `MaintenancePlanCycle` | MMPT-NUMMER | MMPT-NUMMER | copy |  |
| `CycleValue` | MMPT-ZYKL1 | MMPT-ZYKL1 | convert (load program): float_si_to_unit |  |
| `CycleUnit` | MMPT-ZEIEH | MMPT-ZEIEH | copy |  |
| `CycleText` | MMPT-PAK_TEXT | MMPT-PAK_TEXT | copy |  |
| `MeasuringPoint` | MMPT-POINT | MMPT-POINT | copy |  |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZEMX_I_MaintenancePlan` | `ObjectNumber` | MPLA-OBJNR | not migrated: status object number - regenerated on S/4HANA |
| `ZEMX_I_MaintenancePlan` | `IsMarkedForDeletion` | derived: case pl._DeletionFlag.StatusCode when 'I0076' then 'X' else '' end from JEST-STAT | scope flag |
| `ZEMX_I_MaintenancePlan` | `CreationDate` | MPLA-ERSDT | information only |
| `ZEMX_I_MaintenancePlan` | `CreatedByUser` | MPLA-ERNAM | information only |
| `ZEMX_I_MaintenancePlan` | `LastCallNumber` | derived: max( cal.MaintPlanCallNumber ) from MHIS-ABNUM | information only |
| `ZEMX_I_MaintenanceItem` | `MainWorkCenterInternalID` | MPOS-GEWRK | not migrated: internal object ID - replaced by MainWorkCenter |
| `ZEMX_I_MaintenanceItem` | `LocAcctAssignment` | MPOS-ILOAN | not migrated: internal location record - regenerated on S/4HANA |
| `ZEMX_I_MaintenanceItem` | `CreationDate` | MPOS-ERSDT | information only |

## Reconciliation

- Counts: `ZEMX_C_MaintPlanMigCount` (ECC) vs `ZEMT_I_MaintPlanCount` (S/4HANA) per `MaintenancePlanCategory`, `MaintenanceStrategy`
- Records and fields: `ZEMX_C_MaintenancePlanMig` vs `ZEMT_I_MaintPlanCompare` on `MaintenancePlan`; compared: `MaintenancePlanDesc`, `MaintenancePlanCategory`, `MaintenanceStrategy`

```bash
python3 tools/mig_reconcile.py counts --product eam_mig_ecc --module maintenance_plan --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product eam_mig_ecc --module maintenance_plan --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Compatibility note: open calls (orders / notifications created by scheduling) must be completed or migrated as open orders before the plan is restarted, otherwise calls are duplicated
