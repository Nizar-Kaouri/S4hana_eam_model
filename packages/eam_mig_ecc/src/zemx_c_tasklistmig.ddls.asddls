// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Current, not deleted maintenance task list headers with codes and keys translated.
// Example: The load program creates one task list per row and writes old -> new group numbers into the key map 'TASK_LIST_GROUP'.
@AbapCatalog.sqlViewName: 'ZEMX_CTL'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@Analytics.dataExtraction.delta.byElement.name: 'LastChangeDate'
@EndUserText.label: 'Maintenance task list (migration)'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_TaskListMig
  as select from ZEMX_I_TaskListCurrent as src
    left outer join ZEMX_I_MigrationMap as map01 on map01.MapName = 'TASK_LIST_GROUP' and map01.SourceValue = src.TaskListGroup
    left outer join ZEMX_I_MigrationMap as map02 on map02.MapName = 'PLANT' and map02.SourceValue = src.Plant
    left outer join ZEMX_I_MigrationMap as map03 on map03.MapName = 'TASK_LIST_USAGE' and map03.SourceValue = src.TaskListUsage
    left outer join ZEMX_I_MigrationMap as map04 on map04.MapName = 'TASK_LIST_STATUS' and map04.SourceValue = src.TaskListStatus
    left outer join ZEMX_I_MigrationMap as map05 on map05.MapName = 'PLANNER_GROUP' and map05.SourceValue = src.MaintenancePlannerGroup
    left outer join ZEMX_I_MigrationMap as map06 on map06.MapName = 'WORK_CENTER' and map06.SourceValue = src.MainWorkCenter
    left outer join ZEMX_I_MigrationMap as map07 on map07.MapName = 'PLANT' and map07.SourceValue = src.MainWorkCenterPlant
    left outer join ZEMX_I_MigrationMap as map08 on map08.MapName = 'MAINTENANCE_STRATEGY' and map08.SourceValue = src.MaintenanceStrategy
{
  key src.TaskListGroup              as LegacyTaskListGroup,
  key src.TaskListType               as TaskListType,
  key src.TaskListGroupCounter       as TaskListGroupCounter,
      coalesce( map01.TargetValue, src.TaskListGroup ) as TaskListGroup,
      src.ValidityStartDate          as ValidityStartDate,
      src.TaskListDesc               as TaskListDesc,
      coalesce( map02.TargetValue, src.Plant ) as Plant,
      coalesce( map03.TargetValue, src.TaskListUsage ) as TaskListUsage,
      coalesce( map04.TargetValue, src.TaskListStatus ) as TaskListStatus,
      coalesce( map05.TargetValue, src.MaintenancePlannerGroup ) as MaintenancePlannerGroup,
      coalesce( map06.TargetValue, src.MainWorkCenter ) as MainWorkCenter,
      coalesce( map07.TargetValue, src.MainWorkCenterPlant ) as MainWorkCenterPlant,
      coalesce( map08.TargetValue, src.MaintenanceStrategy ) as MaintenanceStrategy,
      src.MaintObjectSystemCondition as MaintObjectSystemCondition,
      src.LastChangeDate             as LastChangeDate
}
where src.IsMarkedForDeletion = ''
