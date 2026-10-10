// ZEMT EAM migration - S/4HANA reconciliation - status: draft-unverified (no SAP system available, never activated)
// Purpose: Record count of maintenance task lists on S/4HANA per TaskListType, Plant; same structure as the ECC count view.
// Example: Export after the load: python3 tools/mig_reconcile.py counts --module task_list --source <ECC export> --target <this export>.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Maintenance task list count (reconciliation)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.supportedCapabilities: [ #SQL_DATA_SOURCE, #EXTRACTION_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #D,
  sizeCategory: #S,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZEMT_I_TaskListCount
  as select from I_MaintenanceTaskList
{
  key TaskListType as TaskListType,
  key Plant        as Plant,
      count( * )   as RecordCount
}
group by TaskListType, Plant
