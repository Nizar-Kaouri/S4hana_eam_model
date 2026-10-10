// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Equipment / functional location allocation of the task lists in scope with all keys translated.
// Example: The load program assigns each equipment task list to the translated equipment.
@AbapCatalog.sqlViewName: 'ZEMX_CTLA'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Task list allocation (migration)'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_TaskListAllocationMig
  as select from ZEMX_I_TaskListObjectAssgmt as src
    inner join ZEMX_I_TaskListCurrent as obj on obj.TaskListType = src.TaskListType and obj.TaskListGroup = src.TaskListGroup and obj.TaskListGroupCounter = src.TaskListGroupCounter
    left outer join ZEMX_I_MigrationMap as map01 on map01.MapName = 'TASK_LIST_GROUP' and map01.SourceValue = src.TaskListGroup
    left outer join ZEMX_I_MigrationMap as map02 on map02.MapName = 'EQUIPMENT' and map02.SourceValue = src.Equipment
    left outer join ZEMX_I_MigrationMap as map03 on map03.MapName = 'FUNCTIONAL_LOCATION' and map03.SourceValue = src.FunctionalLocation
{
  key src.TaskListGroup              as LegacyTaskListGroup,
  key src.TaskListType               as TaskListType,
  key src.TaskListGroupCounter       as TaskListGroupCounter,
      coalesce( map01.TargetValue, src.TaskListGroup ) as TaskListGroup,
      coalesce( map02.TargetValue, src.Equipment ) as Equipment,
      coalesce( map03.TargetValue, src.FunctionalLocation ) as FunctionalLocation
}
where obj.IsMarkedForDeletion = ''
