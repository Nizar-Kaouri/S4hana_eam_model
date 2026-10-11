// ModuPorter EAM migration | Release 1.0.0
// Purpose: TaskListPackage migration extract
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N6C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'TaskListPackage migration extract'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_TaskListPackageMig
  as select from ZEMX_I_TaskListPackage as src
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
      @EndUserText.label: 'Maintenance Package'
  key src.MaintenancePackage as MaintenancePackage
}
where src.IsMarkedForDeletion = '' and _Parent.IsMarkedForDeletion = ''
