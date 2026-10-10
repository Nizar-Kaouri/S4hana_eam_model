// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
define view ZEMX_I_TaskListOpDetail
  as select from plpo
{
  key plpo.plnty as TaskListType,
  key plpo.plnnr as TaskListGroup,
  key plpo.plnkn as TaskListOperationInternalId,
  key plpo.zaehl as TaskListOpVersionCounter,
      plpo.vornr as TaskListOperation,
      // TODO-VERIFY[M] XTL-006: PLPO field names UVORN, LARNT, ANZZL, DAUNO, DAUNE
      plpo.uvorn as TaskListSubOperation,
      plpo.steus as OperationControlKey,
      plpo.ltxa1 as OperationText,
      plpo.arbid as WorkCenterInternalID,
      plpo.werks as Plant,
      plpo.larnt as ActivityType,
      @Semantics.quantity.unitOfMeasure: 'PlannedWorkQuantityUnit'
      plpo.arbei as PlannedWorkQuantity,
      @Semantics.unitOfMeasure: true
      plpo.arbeh as PlannedWorkQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'OperationDurationUnit'
      plpo.dauno as OperationDuration,
      @Semantics.unitOfMeasure: true
      plpo.daune as OperationDurationUnit,
      plpo.anzzl as NumberOfCapacities,
      plpo.loekz as IsMarkedForDeletion
}
where plpo.plnty = 'A' or plpo.plnty = 'E' or plpo.plnty = 'T'
