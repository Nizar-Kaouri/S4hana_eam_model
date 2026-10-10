// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Operations of maintenance task lists (sequence assignment PLAS joined with operation PLPO) with work center, control key, work and duration.
// Example: Extract the operations of the task lists in scope: join on TaskListType / TaskListGroup / TaskListGroupCounter with ZEMX_R_TaskListCurrent.
@AbapCatalog.sqlViewName: 'ZEMX_TLO'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Task list operation (migration extract)'
@ObjectModel.representativeKey: 'TaskListOperationInternalId'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_TaskListOperation
  as select from plas
    inner join plpo on  plpo.plnty = plas.plnty
                    and plpo.plnnr = plas.plnnr
                    and plpo.plnkn = plas.plnkn
    left outer join crhd as wc on wc.objid = plpo.arbid and wc.objty = 'A'
{
  key plas.plnty as TaskListType,
  key plas.plnnr as TaskListGroup,
  key plas.plnal as TaskListGroupCounter,
  key plas.plnfl as TaskListSequence,
  key plas.plnkn as TaskListOperationInternalId,
      // TODO-VERIFY[H] XTL-004: PLAS and PLPO both carry change-number versions (ZAEHL); the join returns one row per combination, the mapping keeps only the latest non-deleted versions
  key plas.zaehl as TaskListOpAssgmtVersion,
  key plpo.zaehl as TaskListOpVersionCounter,
      plpo.vornr as TaskListOperation,
      // TODO-VERIFY[M] XTL-006: PLPO field names UVORN, LARNT, ANZZL, DAUNO, DAUNE
      plpo.uvorn as TaskListSubOperation,
      plpo.steus as OperationControlKey,
      plpo.ltxa1 as OperationText,
      wc.arbpl   as WorkCenter,
      wc.werks   as WorkCenterPlant,
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
      plas.loekz as OpAssignmentIsDeleted,
      plpo.loekz as IsMarkedForDeletion
}
where plas.plnty = 'A' or plas.plnty = 'E' or plas.plnty = 'T'
