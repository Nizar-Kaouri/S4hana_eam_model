// ModuPorter EAM migration | Release 1.0.0
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
define view ZEMX_B_TaskListOpAssignment
  as select from plas
{
      @EndUserText.label: 'Task List Type'
  key plas.plnty as TaskListType,
      @EndUserText.label: 'Task List Group'
  key plas.plnnr as TaskListGroup,
      @EndUserText.label: 'Task List Group Counter'
  key plas.plnal as TaskListGroupCounter,
      @EndUserText.label: 'Task List Sequence'
  key plas.plnfl as TaskListSequence,
      @EndUserText.label: 'Task List Operation Internal Id'
  key plas.plnkn as TaskListOperationInternalId,
      // Compatibility note: PLAS and PLPO both carry change-number versions (ZAEHL); the highest recorded counter is selected independently per assignment/detail identity before deletion filtering; confirm validity-date and change-number semantics for the cutover snapshot
      @EndUserText.label: 'Task List Op Assgmt Version'
  key plas.zaehl as TaskListOpAssgmtVersion,
      @EndUserText.label: 'Is Marked For Deletion'
      plas.loekz as IsMarkedForDeletion
}
where plas.plnty = 'A' or plas.plnty = 'E' or plas.plnty = 'T'
