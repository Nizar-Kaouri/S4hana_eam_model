// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Task-list object allocation change states; customer resolves validity at cutover.
// Example: Find the task lists of equipment 10000001.
@AbapCatalog.sqlViewName: 'ZEMX_TPLA'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Task list assignment change states'
@ObjectModel.representativeKey: 'TaskListGroupCounter'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #BASIC
define view ZEMX_I_FuncTaskListAsgmt
  as select from tapl as src
{
      // TODO-VERIFY[H] XTL-A02: Verify TAPL fields and complete keys (including ZKRIZ/ZAEHL) in source DDIC.
      @EndUserText.label: 'Task list type'
  key src.plnty as TaskListType,
      @EndUserText.label: 'Task list group'
  key src.plnnr as TaskListGroup,
      @EndUserText.label: 'Group counter'
  key src.plnal as TaskListGroupCounter,
      @EndUserText.label: 'FunctionalLocation'
  key src.tplnr as FunctionalLocation,
      @EndUserText.label: 'Additional criteria counter'
  key src.zkriz as AdditionalCriteriaCounter,
      @EndUserText.label: 'Assignment state counter'
  key src.zaehl as AssignmentCounter,
      @EndUserText.label: 'Equipment'
      cast( '' as abap.char(18) ) as Equipment,
      @EndUserText.label: 'Marked for deletion'
      src.loekz as IsMarkedForDeletion
}
