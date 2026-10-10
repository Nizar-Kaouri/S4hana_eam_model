// ZEMX EAM migration - status: draft-unverified (no SAP system; never activated)
// Purpose: TaskListPackage migration business data
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N6I'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'TaskListPackage migration business data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_TaskListPackage
  as select from ZEMX_I_TaskListPackageData as b
    inner join ZEMX_I_TaskListPackageLatest as v on v.TaskListType = b.TaskListType and v.TaskListGroup = b.TaskListGroup and v.TaskListGroupCounter = b.TaskListGroupCounter and v.OperationInternalID = b.OperationInternalID and v.MaintenancePackage = b.MaintenancePackage and v.VersionCounter = b.VersionCounter
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
      @EndUserText.label: 'Maintenance Package'
  key b.MaintenancePackage as MaintenancePackage,
      @EndUserText.label: 'Is Marked For Deletion'
      b.IsMarkedForDeletion as IsMarkedForDeletion
}
