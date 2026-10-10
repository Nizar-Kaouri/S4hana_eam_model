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
    inner join ZEMX_I_TaskListAsgLatest as av on av.TaskListType = asg.TaskListType and av.TaskListGroup = asg.TaskListGroup and av.TaskListGroupCounter = asg.TaskListGroupCounter and av.TaskListSequence = asg.TaskListSequence and av.TaskListOperationInternalId = asg.TaskListOperationInternalId and av.TaskListOpAssgmtVersion = asg.TaskListOpAssgmtVersion
    inner join ZEMX_I_TaskListOpLatest as ov on ov.TaskListType = op.TaskListType and ov.TaskListGroup = op.TaskListGroup and ov.TaskListOperationInternalId = op.TaskListOperationInternalId and ov.TaskListOpVersionCounter = op.TaskListOpVersionCounter
{
      @EndUserText.label: 'Task List Type'
  key asg.TaskListType               as TaskListType,
      @EndUserText.label: 'Task List Group'
  key asg.TaskListGroup              as TaskListGroup,
      @EndUserText.label: 'Task List Group Counter'
  key asg.TaskListGroupCounter       as TaskListGroupCounter,
      @EndUserText.label: 'Task List Sequence'
  key asg.TaskListSequence           as TaskListSequence,
      @EndUserText.label: 'Task List Operation Internal Id'
  key asg.TaskListOperationInternalId as TaskListOperationInternalId,
      @EndUserText.label: 'Task List Op Assgmt Version'
  key asg.TaskListOpAssgmtVersion    as TaskListOpAssgmtVersion,
      @EndUserText.label: 'Task List Op Version Counter'
  key op.TaskListOpVersionCounter    as TaskListOpVersionCounter,
      @EndUserText.label: 'Task List Operation'
      op.TaskListOperation           as TaskListOperation,
      @EndUserText.label: 'Task List Sub Operation'
      op.TaskListSubOperation        as TaskListSubOperation,
      @EndUserText.label: 'Operation Control Key'
      op.OperationControlKey         as OperationControlKey,
      @EndUserText.label: 'Operation Text'
      op.OperationText               as OperationText,
      @EndUserText.label: 'Work Center'
      op._WorkCenter.WorkCenter      as WorkCenter,
      @EndUserText.label: 'Work Center Plant'
      op._WorkCenter.Plant           as WorkCenterPlant,
      @EndUserText.label: 'Plant'
      op.Plant                       as Plant,
      @EndUserText.label: 'Activity Type'
      op.ActivityType                as ActivityType,
      @Semantics.quantity.unitOfMeasure: 'PlannedWorkQuantityUnit'
      @EndUserText.label: 'Planned Work Quantity'
      op.PlannedWorkQuantity         as PlannedWorkQuantity,
      @Semantics.unitOfMeasure: true
      @EndUserText.label: 'Planned Work Quantity Unit'
      op.PlannedWorkQuantityUnit     as PlannedWorkQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'OperationDurationUnit'
      @EndUserText.label: 'Operation Duration'
      op.OperationDuration           as OperationDuration,
      @Semantics.unitOfMeasure: true
      @EndUserText.label: 'Operation Duration Unit'
      op.OperationDurationUnit       as OperationDurationUnit,
      @EndUserText.label: 'Number Of Capacities'
      op.NumberOfCapacities          as NumberOfCapacities,
      @EndUserText.label: 'Work Center Internal ID'
      op.WorkCenterInternalID        as WorkCenterInternalID,
      @EndUserText.label: 'Op Assignment Is Deleted'
      asg.IsMarkedForDeletion        as OpAssignmentIsDeleted,
      @EndUserText.label: 'Is Marked For Deletion'
      op.IsMarkedForDeletion         as IsMarkedForDeletion
}
