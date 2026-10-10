// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Operations of the task lists in scope (not deleted) with work center, control key and units translated.
// Example: The load program adds the operations to the task list created from ZEMX_C_TaskListMig.
@AbapCatalog.sqlViewName: 'ZEMX_CTLO'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Task list operation (migration)'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_TaskListOperationMig
  as select from ZEMX_I_TaskListOperation as src
    inner join ZEMX_I_TaskListCurrent as obj on obj.TaskListType = src.TaskListType and obj.TaskListGroup = src.TaskListGroup and obj.TaskListGroupCounter = src.TaskListGroupCounter
    left outer join ZEMX_I_MigrationMap as map01 on map01.MapName = 'TASK_LIST_GROUP' and map01.SourceValue = src.TaskListGroup
    left outer join ZEMX_I_MigrationMap as map02 on map02.MapName = 'CONTROL_KEY' and map02.SourceValue = src.OperationControlKey
    left outer join ZEMX_I_MigrationMap as map03 on map03.MapName = 'WORK_CENTER' and map03.SourceValue = src.WorkCenter
    left outer join ZEMX_I_MigrationMap as map04 on map04.MapName = 'PLANT' and map04.SourceValue = src.WorkCenterPlant
    left outer join ZEMX_I_MigrationMap as map05 on map05.MapName = 'PLANT' and map05.SourceValue = src.Plant
    left outer join ZEMX_I_MigrationMap as map06 on map06.MapName = 'ACTIVITY_TYPE' and map06.SourceValue = src.ActivityType
{
  key src.TaskListGroup              as LegacyTaskListGroup,
  key src.TaskListType               as TaskListType,
  key src.TaskListGroupCounter       as TaskListGroupCounter,
  key src.TaskListSequence           as TaskListSequence,
  key src.TaskListOperation          as TaskListOperation,
      coalesce( map01.TargetValue, src.TaskListGroup ) as TaskListGroup,
      src.TaskListSubOperation       as TaskListSubOperation,
      coalesce( map02.TargetValue, src.OperationControlKey ) as OperationControlKey,
      src.OperationText              as OperationText,
      coalesce( map03.TargetValue, src.WorkCenter ) as WorkCenter,
      coalesce( map04.TargetValue, src.WorkCenterPlant ) as WorkCenterPlant,
      coalesce( map05.TargetValue, src.Plant ) as Plant,
      coalesce( map06.TargetValue, src.ActivityType ) as ActivityType,
      @Semantics.quantity.unitOfMeasure: 'PlannedWorkQuantityUnit'
      src.PlannedWorkQuantity        as PlannedWorkQuantity,
      @Semantics.unitOfMeasure: true
      src.PlannedWorkQuantityUnit    as PlannedWorkQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'OperationDurationUnit'
      src.OperationDuration          as OperationDuration,
      @Semantics.unitOfMeasure: true
      src.OperationDurationUnit      as OperationDurationUnit,
      src.NumberOfCapacities         as NumberOfCapacities
}
where src.IsMarkedForDeletion = '' and src.OpAssignmentIsDeleted = '' and obj.IsMarkedForDeletion = ''
