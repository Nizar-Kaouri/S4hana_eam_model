// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Maintenance items of the plans in scope with reference objects, work center, types and task list translated.
// Example: The load program adds the items to the plan created from ZEMX_C_MaintenancePlanMig.
@AbapCatalog.sqlViewName: 'ZEMX_CPLI'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@Analytics.dataExtraction.delta.byElement.name: 'LastChangeDate'
@EndUserText.label: 'Maintenance item (migration)'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_MaintenanceItemMig
  as select from ZEMX_I_MaintenanceItem as src
    inner join ZEMX_I_MaintenancePlan as obj on obj.MaintenancePlan = src.MaintenancePlan
    left outer join ZEMX_I_MigrationMap as map01 on map01.MapName = 'MAINTENANCE_ITEM' and map01.SourceValue = src.MaintenanceItem
    left outer join ZEMX_I_MigrationMap as map02 on map02.MapName = 'MAINTENANCE_PLAN' and map02.SourceValue = src.MaintenancePlan
    left outer join ZEMX_I_MigrationMap as map03 on map03.MapName = 'EQUIPMENT' and map03.SourceValue = src.Equipment
    left outer join ZEMX_I_MigrationMap as map04 on map04.MapName = 'FUNCTIONAL_LOCATION' and map04.SourceValue = src.FunctionalLocation
    left outer join ZEMX_I_MigrationMap as map05 on map05.MapName = 'PLANT' and map05.SourceValue = src.MaintenancePlanningPlant
    left outer join ZEMX_I_MigrationMap as map06 on map06.MapName = 'PLANNER_GROUP' and map06.SourceValue = src.MaintenancePlannerGroup
    left outer join ZEMX_I_MigrationMap as map07 on map07.MapName = 'WORK_CENTER' and map07.SourceValue = src.MainWorkCenter
    left outer join ZEMX_I_MigrationMap as map08 on map08.MapName = 'PLANT' and map08.SourceValue = src.MainWorkCenterPlant
    left outer join ZEMX_I_MigrationMap as map09 on map09.MapName = 'ORDER_TYPE' and map09.SourceValue = src.MaintenanceOrderType
    left outer join ZEMX_I_MigrationMap as map10 on map10.MapName = 'NOTIFICATION_TYPE' and map10.SourceValue = src.NotificationType
    left outer join ZEMX_I_MigrationMap as map11 on map11.MapName = 'ACTIVITY_TYPE_PM' and map11.SourceValue = src.MaintenanceActivityType
    left outer join ZEMX_I_MigrationMap as map12 on map12.MapName = 'PRIORITY' and map12.SourceValue = src.MaintPriority
    left outer join ZEMX_I_MigrationMap as map13 on map13.MapName = 'TASK_LIST_GROUP' and map13.SourceValue = src.TaskListGroup
    left outer join ZEMX_I_MigrationMap as map14 on map14.MapName = 'BUSINESS_AREA' and map14.SourceValue = src.BusinessArea
{
  key src.MaintenanceItem            as LegacyMaintenanceItem,
      coalesce( map01.TargetValue, src.MaintenanceItem ) as MaintenanceItem,
      coalesce( map02.TargetValue, src.MaintenancePlan ) as MaintenancePlan,
      src.MaintenanceItemDescription as MaintenanceItemDescription,
      coalesce( map03.TargetValue, src.Equipment ) as Equipment,
      coalesce( map04.TargetValue, src.FunctionalLocation ) as FunctionalLocation,
      coalesce( map05.TargetValue, src.MaintenancePlanningPlant ) as MaintenancePlanningPlant,
      coalesce( map06.TargetValue, src.MaintenancePlannerGroup ) as MaintenancePlannerGroup,
      coalesce( map07.TargetValue, src.MainWorkCenter ) as MainWorkCenter,
      coalesce( map08.TargetValue, src.MainWorkCenterPlant ) as MainWorkCenterPlant,
      coalesce( map09.TargetValue, src.MaintenanceOrderType ) as MaintenanceOrderType,
      coalesce( map10.TargetValue, src.NotificationType ) as NotificationType,
      coalesce( map11.TargetValue, src.MaintenanceActivityType ) as MaintenanceActivityType,
      coalesce( map12.TargetValue, src.MaintPriority ) as MaintPriority,
      src.TaskListType               as TaskListType,
      coalesce( map13.TargetValue, src.TaskListGroup ) as TaskListGroup,
      src.TaskListGroupCounter       as TaskListGroupCounter,
      coalesce( map14.TargetValue, src.BusinessArea ) as BusinessArea,
      src.LastChangeDate             as LastChangeDate
}
where obj.IsMarkedForDeletion = ''
