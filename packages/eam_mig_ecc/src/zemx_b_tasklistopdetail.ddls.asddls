// ModuPorter EAM migration | Release 1.0.0
// Purpose: Operation details of task lists (PLPO): operation number, control key, work center, work, duration.
// Example: Read the operations of task list group 4711.
@AbapCatalog.sqlViewName: 'ZEMX_PLPO'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Task list operation detail'
@ObjectModel.representativeKey: 'TaskListOpVersionCounter'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_B_TaskListOpDetail
  as select from plpo
  association [0..1] to ZEMX_B_WorkCenterHeader as _WorkCenter on $projection.WorkCenterInternalID = _WorkCenter.WorkCenterInternalID
{
      @EndUserText.label: 'Task List Type'
  key plpo.plnty as TaskListType,
      @EndUserText.label: 'Task List Group'
  key plpo.plnnr as TaskListGroup,
      @EndUserText.label: 'Task List Operation Internal Id'
  key plpo.plnkn as TaskListOperationInternalId,
      @EndUserText.label: 'Task List Op Version Counter'
  key plpo.zaehl as TaskListOpVersionCounter,
      @EndUserText.label: 'Task List Operation'
      plpo.vornr as TaskListOperation,
      // Compatibility note: PLPO field names UVORN, LARNT, ANZZL, DAUNO, DAUNE
      @EndUserText.label: 'Task List Sub Operation'
      plpo.uvorn as TaskListSubOperation,
      @EndUserText.label: 'Operation Control Key'
      plpo.steus as OperationControlKey,
      @EndUserText.label: 'Operation Text'
      plpo.ltxa1 as OperationText,
      @EndUserText.label: 'Work Center Internal ID'
      plpo.arbid as WorkCenterInternalID,
      @EndUserText.label: 'Plant'
      plpo.werks as Plant,
      @EndUserText.label: 'Activity Type'
      plpo.larnt as ActivityType,
      @Semantics.quantity.unitOfMeasure: 'PlannedWorkQuantityUnit'
      @EndUserText.label: 'Planned Work Quantity'
      plpo.arbei as PlannedWorkQuantity,
      @Semantics.unitOfMeasure: true
      @EndUserText.label: 'Planned Work Quantity Unit'
      plpo.arbeh as PlannedWorkQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'OperationDurationUnit'
      @EndUserText.label: 'Operation Duration'
      plpo.dauno as OperationDuration,
      @Semantics.unitOfMeasure: true
      @EndUserText.label: 'Operation Duration Unit'
      plpo.daune as OperationDurationUnit,
      @EndUserText.label: 'Number Of Capacities'
      plpo.anzzl as NumberOfCapacities,
      @EndUserText.label: 'Is Marked For Deletion'
      plpo.loekz as IsMarkedForDeletion,
      _WorkCenter
}
where plpo.plnty = 'A' or plpo.plnty = 'E' or plpo.plnty = 'T'
