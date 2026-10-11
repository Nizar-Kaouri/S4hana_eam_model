// ModuPorter EAM migration | Release 1.0.0
// Purpose: TaskListPackage source data
// Example: Export the selected migration scope; validate keys and row counts before loading.
// Compatibility note: Confirm PLWP keys, all selected fields and meanings on the source release; posting-interface targets are provisional.
@AbapCatalog.sqlViewName: 'ZEMX_N6B'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'TaskListPackage source data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_TaskListPackageData
  as select from plwp as t
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
      @EndUserText.label: 'Maintenance Package'
  key t.paket as MaintenancePackage,
      @EndUserText.label: 'Is Marked For Deletion'
      t.loekz as IsMarkedForDeletion
}
