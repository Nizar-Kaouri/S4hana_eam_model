// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Open maintenance orders (not technically completed, not closed, not deleted) with codes and keys translated.
// Example: The load program creates one order per row and writes old -> new numbers into the key map 'MAINTENANCE_ORDER'.
@AbapCatalog.sqlViewName: 'ZEMX_COR'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@Analytics.dataExtraction.delta.byElement.name: 'LastChangeDate'
@EndUserText.label: 'Maintenance order (migration)'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_MaintOrderMig
  as select from ZEMX_I_MaintOrder as src
    left outer join ZEMX_I_MigrationMap as map01 on map01.MapName = 'MAINTENANCE_ORDER' and map01.SourceValue = src.MaintenanceOrder
    left outer join ZEMX_I_MigrationMap as map02 on map02.MapName = 'ORDER_TYPE' and map02.SourceValue = src.MaintenanceOrderType
    left outer join ZEMX_I_MigrationMap as map03 on map03.MapName = 'ACTIVITY_TYPE_PM' and map03.SourceValue = src.MaintenanceActivityType
    left outer join ZEMX_I_MigrationMap as map04 on map04.MapName = 'PRIORITY' and map04.SourceValue = src.MaintPriority
    left outer join ZEMX_I_MigrationMap as map05 on map05.MapName = 'PLANT' and map05.SourceValue = src.MaintenancePlanningPlant
    left outer join ZEMX_I_MigrationMap as map06 on map06.MapName = 'PLANNER_GROUP' and map06.SourceValue = src.MaintenancePlannerGroup
    left outer join ZEMX_I_MigrationMap as map07 on map07.MapName = 'WORK_CENTER' and map07.SourceValue = src.MainWorkCenter
    left outer join ZEMX_I_MigrationMap as map08 on map08.MapName = 'PLANT' and map08.SourceValue = src.MainWorkCenterPlant
    left outer join ZEMX_I_MigrationMap as map09 on map09.MapName = 'PLANT' and map09.SourceValue = src.MaintenancePlant
    left outer join ZEMX_I_MigrationMap as map10 on map10.MapName = 'COMPANY_CODE' and map10.SourceValue = src.CompanyCode
    left outer join ZEMX_I_MigrationMap as map11 on map11.MapName = 'BUSINESS_AREA' and map11.SourceValue = src.BusinessArea
    left outer join ZEMX_I_MigrationMap as map12 on map12.MapName = 'CONTROLLING_AREA' and map12.SourceValue = src.ControllingArea
    left outer join ZEMX_I_MigrationMap as map13 on map13.MapName = 'COST_CENTER' and map13.SourceValue = src.ResponsibleCostCenter
    left outer join ZEMX_I_MigrationMap as map14 on map14.MapName = 'COST_CENTER' and map14.SourceValue = src.CostCenter
    left outer join ZEMX_I_MigrationMap as map15 on map15.MapName = 'MAINTENANCE_NOTIFICATION' and map15.SourceValue = src.MaintenanceNotification
    left outer join ZEMX_I_MigrationMap as map16 on map16.MapName = 'EQUIPMENT' and map16.SourceValue = src.Equipment
    left outer join ZEMX_I_MigrationMap as map17 on map17.MapName = 'FUNCTIONAL_LOCATION' and map17.SourceValue = src.FunctionalLocation
    left outer join ZEMX_I_MigrationMap as map18 on map18.MapName = 'MAINTENANCE_PLAN' and map18.SourceValue = src.MaintenancePlan
    left outer join ZEMX_I_MigrationMap as map19 on map19.MapName = 'MAINTENANCE_ITEM' and map19.SourceValue = src.MaintenanceItem
    left outer join ZEMX_I_MigrationMap as map20 on map20.MapName = 'TASK_LIST_GROUP' and map20.SourceValue = src.TaskListGroup
{
  key src.MaintenanceOrder           as LegacyMaintenanceOrder,
      coalesce( map01.TargetValue, src.MaintenanceOrder ) as MaintenanceOrder,
      coalesce( map02.TargetValue, src.MaintenanceOrderType ) as MaintenanceOrderType,
      src.MaintenanceOrderDesc       as MaintenanceOrderDesc,
      coalesce( map03.TargetValue, src.MaintenanceActivityType ) as MaintenanceActivityType,
      coalesce( map04.TargetValue, src.MaintPriority ) as MaintPriority,
      src.MaintOrdBasicStartDate     as MaintOrdBasicStartDate,
      src.MaintOrdBasicEndDate       as MaintOrdBasicEndDate,
      coalesce( map05.TargetValue, src.MaintenancePlanningPlant ) as MaintenancePlanningPlant,
      coalesce( map06.TargetValue, src.MaintenancePlannerGroup ) as MaintenancePlannerGroup,
      coalesce( map07.TargetValue, src.MainWorkCenter ) as MainWorkCenter,
      coalesce( map08.TargetValue, src.MainWorkCenterPlant ) as MainWorkCenterPlant,
      coalesce( map09.TargetValue, src.MaintenancePlant ) as MaintenancePlant,
      coalesce( map10.TargetValue, src.CompanyCode ) as CompanyCode,
      coalesce( map11.TargetValue, src.BusinessArea ) as BusinessArea,
      coalesce( map12.TargetValue, src.ControllingArea ) as ControllingArea,
      coalesce( map13.TargetValue, src.ResponsibleCostCenter ) as ResponsibleCostCenter,
      coalesce( map14.TargetValue, src.CostCenter ) as CostCenter,
      coalesce( map15.TargetValue, src.MaintenanceNotification ) as MaintenanceNotification,
      coalesce( map16.TargetValue, src.Equipment ) as Equipment,
      coalesce( map17.TargetValue, src.FunctionalLocation ) as FunctionalLocation,
      coalesce( map18.TargetValue, src.MaintenancePlan ) as MaintenancePlan,
      coalesce( map19.TargetValue, src.MaintenanceItem ) as MaintenanceItem,
      src.MaintObjectSystemCondition as MaintObjectSystemCondition,
      src.TaskListType               as TaskListType,
      coalesce( map20.TargetValue, src.TaskListGroup ) as TaskListGroup,
      src.TaskListGroupCounter       as TaskListGroupCounter,
      src.Currency                   as Currency,
      src.LastChangeDate             as LastChangeDate
}
where src.IsTechnicallyCompleted = '' and src.IsClosed = '' and src.IsMarkedForDeletion = ''
