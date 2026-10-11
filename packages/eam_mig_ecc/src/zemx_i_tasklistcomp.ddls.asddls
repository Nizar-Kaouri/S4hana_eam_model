// ModuPorter EAM migration | Release 1.0.0
// Purpose: TaskListComp migration business data
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N4I'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'TaskListComp migration business data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_TaskListComp
  as select from ZEMX_I_TaskListCompData as b
    inner join ZEMX_I_TaskListCompLatest as v on v.TaskListType = b.TaskListType and v.TaskListGroup = b.TaskListGroup and v.TaskListGroupCounter = b.TaskListGroupCounter and v.OperationInternalID = b.OperationInternalID and v.AllocationNumber = b.AllocationNumber and v.VersionCounter = b.VersionCounter
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
      @EndUserText.label: 'Allocation Number'
  key b.AllocationNumber as AllocationNumber,
      @EndUserText.label: 'B O M Category'
      b.BOMCategory as BOMCategory,
      @EndUserText.label: 'Bill Of Material'
      b.BillOfMaterial as BillOfMaterial,
      @EndUserText.label: 'B O M Alternative'
      b.BOMAlternative as BOMAlternative,
      @EndUserText.label: 'B O M Item Node'
      b.BOMItemNode as BOMItemNode,
      @EndUserText.label: 'Is Marked For Deletion'
      b.IsMarkedForDeletion as IsMarkedForDeletion
}
