// ZEMX EAM migration - status: draft-unverified (no SAP system; never activated)
// Purpose: TaskListPRT source data
// Example: Export the selected migration scope; validate keys and row counts before loading.
// TODO-VERIFY[H] XADD-5: Confirm PLFH keys, all selected fields and meanings on the source release; posting-interface targets are provisional.
@AbapCatalog.sqlViewName: 'ZEMX_N5B'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'TaskListPRT source data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_TaskListPRTData
  as select from plfh as t
{
      @EndUserText.label: 'Task List Type'
  key t.plnty as TaskListType,
      @EndUserText.label: 'Task List Group'
  key t.plnnr as TaskListGroup,
      @EndUserText.label: 'Task List Group Counter'
  key t.plnal as TaskListGroupCounter,
      @EndUserText.label: 'Operation Internal I D'
  key t.plnkn as OperationInternalID,
      @EndUserText.label: 'Version Counter'
  key t.zaehl as VersionCounter,
      @EndUserText.label: 'P R T Item'
  key t.psnfh as PRTItem,
      @EndUserText.label: 'P R T Object Type'
      t.objty as PRTObjectType,
      @EndUserText.label: 'P R T Internal I D'
      t.objid as PRTInternalID,
      @EndUserText.label: 'P R T Control Key'
      t.steuf as PRTControlKey,
      @EndUserText.label: 'Is Marked For Deletion'
      t.loekz as IsMarkedForDeletion
}
