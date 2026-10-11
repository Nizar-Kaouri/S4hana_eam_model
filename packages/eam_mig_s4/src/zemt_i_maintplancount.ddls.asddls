// ModuPorter EAM migration | Release 1.0.0
// Purpose: Record count of maintenance plans on S/4HANA per MaintenancePlanCategory, MaintenanceStrategy; same structure as the ECC count view.
// Example: Export after the load: python3 tools/mig_reconcile.py counts --module maintenance_plan --source <ECC export> --target <this export>.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Maintenance plan count (reconciliation)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.supportedCapabilities: [ #SQL_DATA_SOURCE, #EXTRACTION_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #D,
  sizeCategory: #S,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZEMT_I_MaintPlanCount
  as select from I_MaintenancePlan
{
  key MaintenancePlanCategory as MaintenancePlanCategory,
  key MaintenanceStrategy     as MaintenanceStrategy,
      count( * )              as RecordCount
}
group by MaintenancePlanCategory, MaintenanceStrategy
