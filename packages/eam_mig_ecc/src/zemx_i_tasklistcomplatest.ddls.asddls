// ModuPorter EAM migration | Release 1.0.0
// Purpose: TaskListComp latest recorded counter
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N4L'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'TaskListComp latest recorded counter'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_TaskListCompLatest
  as select from ZEMX_I_TaskListCompData as b
{
      @EndUserText.label: 'Task List Type'
  key b.TaskListType as TaskListType,
      @EndUserText.label: 'Task List Group'
  key b.TaskListGroup as TaskListGroup,
      @EndUserText.label: 'Task List Group Counter'
  key b.TaskListGroupCounter as TaskListGroupCounter,
      @EndUserText.label: 'Operation Internal I D'
  key b.OperationInternalID as OperationInternalID,
      @EndUserText.label: 'Allocation Number'
  key b.AllocationNumber as AllocationNumber,
      @EndUserText.label: 'Version Counter'
      max( b.VersionCounter ) as VersionCounter
}
group by b.TaskListType, b.TaskListGroup, b.TaskListGroupCounter, b.OperationInternalID, b.AllocationNumber
