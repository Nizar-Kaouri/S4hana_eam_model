// ModuPorter EAM migration | Release 1.0.0
// Purpose: Maintenance task list on S/4HANA with the business key and the fields compared after the load; element names equal the ECC extract so that tools/mig_reconcile.py compares them by name.
// Example: Export this view after the load and compare it with the ECC extract: python3 tools/mig_reconcile.py fields --module task_list ...
// Compatibility note: I_MaintenanceTaskList returns one row per version (TaskListVersionCounter); after a fresh load each task list has one version, otherwise reduce to the latest
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Maintenance task list compare (reconciliation)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'TaskListGroupCounter'
@ObjectModel.supportedCapabilities: [ #SQL_DATA_SOURCE, #EXTRACTION_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #D,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZEMT_I_TaskListCompare
  as select from I_MaintenanceTaskList
{
  key TaskListType            as TaskListType,
  key TaskListGroup           as TaskListGroup,
  key TaskListGroupCounter    as TaskListGroupCounter,
      TaskListDesc            as TaskListDesc,
      Plant                   as Plant,
      TaskListUsage           as TaskListUsage,
      TaskListStatus          as TaskListStatus,
      MaintenancePlannerGroup as MaintenancePlannerGroup,
      MaintenanceStrategy     as MaintenanceStrategy
}
