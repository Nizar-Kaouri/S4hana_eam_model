// ZEMX EAM migration - status: draft-unverified (no SAP system; never activated)
// Purpose: TaskListComp migration extract
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N4C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'TaskListComp migration extract'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_TaskListCompMig
  as select from ZEMX_I_TaskListComp as src
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
      @EndUserText.label: 'Allocation Number'
  key src.AllocationNumber as AllocationNumber,
      @EndUserText.label: 'B O M Category'
      src.BOMCategory as BOMCategory,
      @EndUserText.label: 'Bill Of Material'
      src.BillOfMaterial as BillOfMaterial,
      @EndUserText.label: 'B O M Alternative'
      src.BOMAlternative as BOMAlternative,
      @EndUserText.label: 'B O M Item Node'
      src.BOMItemNode as BOMItemNode
}
where src.IsMarkedForDeletion = '' and _Parent.IsMarkedForDeletion = ''
