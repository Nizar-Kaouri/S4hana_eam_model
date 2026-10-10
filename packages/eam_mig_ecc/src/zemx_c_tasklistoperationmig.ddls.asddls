// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
  key src.TaskListType            as TaskListType,
  key src.TaskListGroup           as TaskListGroup,
  key src.TaskListGroupCounter    as TaskListGroupCounter,
  key src.TaskListSequence        as TaskListSequence,
  key src.TaskListOperation       as TaskListOperation,
      src.TaskListSubOperation    as TaskListSubOperation,
      src.OperationControlKey     as OperationControlKey,
      src.OperationText           as OperationText,
      src.WorkCenter              as WorkCenter,
      src.WorkCenterPlant         as WorkCenterPlant,
      src.Plant                   as Plant,
      src.ActivityType            as ActivityType,
      @Semantics.quantity.unitOfMeasure: 'PlannedWorkQuantityUnit'
      src.PlannedWorkQuantity     as PlannedWorkQuantity,
      @Semantics.unitOfMeasure: true
      src.PlannedWorkQuantityUnit as PlannedWorkQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'OperationDurationUnit'
      src.OperationDuration       as OperationDuration,
      @Semantics.unitOfMeasure: true
      src.OperationDurationUnit   as OperationDurationUnit,
      src.NumberOfCapacities      as NumberOfCapacities
}
where src.IsMarkedForDeletion = '' and src.OpAssignmentIsDeleted = '' and _TaskListCurrent.IsMarkedForDeletion = ''
