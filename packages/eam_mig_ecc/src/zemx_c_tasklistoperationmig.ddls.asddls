// ModuPorter EAM migration | Release 1.0.0
// Purpose: Operations of the task lists in scope (not deleted) with work center, control key and units.
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
  association [0..1] to ZEMX_I_TaskListCurrent as _TaskListCurrent on _TaskListCurrent.TaskListType = $projection.TaskListType and _TaskListCurrent.TaskListGroup = $projection.TaskListGroup and _TaskListCurrent.TaskListGroupCounter = $projection.TaskListGroupCounter
{
      @EndUserText.label: 'Task List Type'
  key src.TaskListType            as TaskListType,
      @EndUserText.label: 'Task List Group'
  key src.TaskListGroup           as TaskListGroup,
      @EndUserText.label: 'Task List Group Counter'
  key src.TaskListGroupCounter    as TaskListGroupCounter,
      @EndUserText.label: 'Task List Sequence'
  key src.TaskListSequence        as TaskListSequence,
      @EndUserText.label: 'Task List Operation'
  key src.TaskListOperation       as TaskListOperation,
      @EndUserText.label: 'Task List Sub Operation'
      src.TaskListSubOperation    as TaskListSubOperation,
      @EndUserText.label: 'Operation Control Key'
      src.OperationControlKey     as OperationControlKey,
      @EndUserText.label: 'Operation Text'
      src.OperationText           as OperationText,
      @EndUserText.label: 'Work Center'
      src.WorkCenter              as WorkCenter,
      @EndUserText.label: 'Work Center Plant'
      src.WorkCenterPlant         as WorkCenterPlant,
      @EndUserText.label: 'Plant'
      src.Plant                   as Plant,
      @EndUserText.label: 'Activity Type'
      src.ActivityType            as ActivityType,
      @Semantics.quantity.unitOfMeasure: 'PlannedWorkQuantityUnit'
      @EndUserText.label: 'Planned Work Quantity'
      src.PlannedWorkQuantity     as PlannedWorkQuantity,
      @Semantics.unitOfMeasure: true
      @EndUserText.label: 'Planned Work Quantity Unit'
      src.PlannedWorkQuantityUnit as PlannedWorkQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'OperationDurationUnit'
      @EndUserText.label: 'Operation Duration'
      src.OperationDuration       as OperationDuration,
      @Semantics.unitOfMeasure: true
      @EndUserText.label: 'Operation Duration Unit'
      src.OperationDurationUnit   as OperationDurationUnit,
      @EndUserText.label: 'Number Of Capacities'
      src.NumberOfCapacities      as NumberOfCapacities
}
where src.IsMarkedForDeletion = '' and src.OpAssignmentIsDeleted = '' and _TaskListCurrent.IsMarkedForDeletion = ''
