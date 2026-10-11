// ModuPorter EAM migration | Release 1.0.0
// Purpose: TaskListPRT migration extract
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N5C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'TaskListPRT migration extract'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_TaskListPRTMig
  as select from ZEMX_I_TaskListPRT as src
  association [0..1] to ZEMX_I_TaskListCurrent as _Parent on _Parent.TaskListType = $projection.TaskListType and _Parent.TaskListGroup = $projection.TaskListGroup and _Parent.TaskListGroupCounter = $projection.TaskListGroupCounter
{
      @EndUserText.label: 'Task List Type'
  key src.TaskListType as TaskListType,
      @EndUserText.label: 'Task List Group'
  key src.TaskListGroup as TaskListGroup,
      @EndUserText.label: 'Task List Group Counter'
  key src.TaskListGroupCounter as TaskListGroupCounter,
      @EndUserText.label: 'Operation Internal I D'
  key src.OperationInternalID as OperationInternalID,
      @EndUserText.label: 'Version Counter'
  key src.VersionCounter as VersionCounter,
      @EndUserText.label: 'P R T Item'
  key src.PRTItem as PRTItem,
      @EndUserText.label: 'P R T Object Type'
      src.PRTObjectType as PRTObjectType,
      @EndUserText.label: 'P R T Internal I D'
      src.PRTInternalID as PRTInternalID,
      @EndUserText.label: 'P R T Control Key'
      src.PRTControlKey as PRTControlKey
}
where src.IsMarkedForDeletion = '' and _Parent.IsMarkedForDeletion = ''
