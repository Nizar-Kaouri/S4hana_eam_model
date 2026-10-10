// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Operations of maintenance task lists (sequence assignment joined with operation detail) with the work center as business key.
// Example: Read the operations of task list group 4711, counter 01.
@AbapCatalog.sqlViewName: 'ZEMX_TLO'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Task list operation'
@ObjectModel.representativeKey: 'TaskListOperationInternalId'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_TaskListOperation
  as select from ZEMX_I_TaskListOpAssignment as asg
    inner join ZEMX_I_TaskListOpDetail as op on op.TaskListType = asg.TaskListType and op.TaskListGroup = asg.TaskListGroup and op.TaskListOperationInternalId = asg.TaskListOperationInternalId
{
  key asg.TaskListType               as TaskListType,
  key asg.TaskListGroup              as TaskListGroup,
  key asg.TaskListGroupCounter       as TaskListGroupCounter,
  key asg.TaskListSequence           as TaskListSequence,
  key asg.TaskListOperationInternalId as TaskListOperationInternalId,
  key asg.TaskListOpAssgmtVersion    as TaskListOpAssgmtVersion,
  key op.TaskListOpVersionCounter    as TaskListOpVersionCounter,
      op.TaskListOperation           as TaskListOperation,
      op.TaskListSubOperation        as TaskListSubOperation,
      op.OperationControlKey         as OperationControlKey,
      op.OperationText               as OperationText,
      op._WorkCenter.WorkCenter      as WorkCenter,
      op._WorkCenter.Plant           as WorkCenterPlant,
      op.Plant                       as Plant,
      op.ActivityType                as ActivityType,
      @Semantics.quantity.unitOfMeasure: 'PlannedWorkQuantityUnit'
      op.PlannedWorkQuantity         as PlannedWorkQuantity,
      @Semantics.unitOfMeasure: true
      op.PlannedWorkQuantityUnit     as PlannedWorkQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'OperationDurationUnit'
      op.OperationDuration           as OperationDuration,
      @Semantics.unitOfMeasure: true
      op.OperationDurationUnit       as OperationDurationUnit,
      op.NumberOfCapacities          as NumberOfCapacities,
      op.WorkCenterInternalID        as WorkCenterInternalID,
      asg.IsMarkedForDeletion        as OpAssignmentIsDeleted,
      op.IsMarkedForDeletion         as IsMarkedForDeletion
}
