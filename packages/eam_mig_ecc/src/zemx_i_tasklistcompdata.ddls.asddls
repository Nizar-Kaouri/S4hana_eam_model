// ZEMX EAM migration - status: draft-unverified (no SAP system; never activated)
// Purpose: TaskListComp source data
// Example: Export the selected migration scope; validate keys and row counts before loading.
// TODO-VERIFY[H] XADD-4: Confirm PLMZ keys, all selected fields and meanings on the source release; posting-interface targets are provisional.
@AbapCatalog.sqlViewName: 'ZEMX_N4B'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'TaskListComp source data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_TaskListCompData
  as select from plmz as t
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
      @EndUserText.label: 'Allocation Number'
  key t.zuonr as AllocationNumber,
      @EndUserText.label: 'B O M Category'
      t.stlty as BOMCategory,
      @EndUserText.label: 'Bill Of Material'
      t.stlnr as BillOfMaterial,
      @EndUserText.label: 'B O M Alternative'
      t.stlal as BOMAlternative,
      @EndUserText.label: 'B O M Item Node'
      t.stlkn as BOMItemNode,
      @EndUserText.label: 'Is Marked For Deletion'
      t.loekz as IsMarkedForDeletion
}
