// ZEMX EAM migration - status: draft-unverified (no SAP system; never activated)
// Purpose: TaskListPRT migration business data
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N5I'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'TaskListPRT migration business data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_TaskListPRT
  as select from ZEMX_I_TaskListPRTData as b
    inner join ZEMX_I_TaskListPRTLatest as v on v.TaskListType = b.TaskListType and v.TaskListGroup = b.TaskListGroup and v.TaskListGroupCounter = b.TaskListGroupCounter and v.OperationInternalID = b.OperationInternalID and v.PRTItem = b.PRTItem and v.VersionCounter = b.VersionCounter
{
      @EndUserText.label: 'Task List Type'
  key b.TaskListType as TaskListType,
      @EndUserText.label: 'Task List Group'
  key b.TaskListGroup as TaskListGroup,
      @EndUserText.label: 'Task List Group Counter'
  key b.TaskListGroupCounter as TaskListGroupCounter,
      @EndUserText.label: 'Operation Internal I D'
  key b.OperationInternalID as OperationInternalID,
      @EndUserText.label: 'Version Counter'
  key b.VersionCounter as VersionCounter,
      @EndUserText.label: 'P R T Item'
  key b.PRTItem as PRTItem,
      @EndUserText.label: 'P R T Object Type'
      b.PRTObjectType as PRTObjectType,
      @EndUserText.label: 'P R T Internal I D'
      b.PRTInternalID as PRTInternalID,
      @EndUserText.label: 'P R T Control Key'
      b.PRTControlKey as PRTControlKey,
      @EndUserText.label: 'Is Marked For Deletion'
      b.IsMarkedForDeletion as IsMarkedForDeletion
}
