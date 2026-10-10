// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Assignment of operations to task list sequences (PLAS) for maintenance task lists.
// Example: Read the operation nodes of task list group 4711, group counter 01.
@AbapCatalog.sqlViewName: 'ZEMX_PLAS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Task list operation assignment'
@ObjectModel.representativeKey: 'TaskListOpAssgmtVersion'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_TaskListOpAssignment
  as select from plas
{
  key plas.plnty as TaskListType,
  key plas.plnnr as TaskListGroup,
  key plas.plnal as TaskListGroupCounter,
  key plas.plnfl as TaskListSequence,
  key plas.plnkn as TaskListOperationInternalId,
      // TODO-VERIFY[H] XTL-004: PLAS and PLPO both carry change-number versions (ZAEHL); the join returns one row per combination, only the latest non-deleted versions are migrated
  key plas.zaehl as TaskListOpAssgmtVersion,
      plas.loekz as IsMarkedForDeletion
}
where plas.plnty = 'A' or plas.plnty = 'E' or plas.plnty = 'T'
