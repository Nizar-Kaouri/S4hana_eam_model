// ModuPorter EAM migration | Release 1.0.0
// Purpose: Maintenance plan on S/4HANA with the business key and the fields compared after the load; element names equal the ECC extract so that tools/mig_reconcile.py compares them by name.
// Example: Export this view after the load and compare it with the ECC extract: python3 tools/mig_reconcile.py fields --module maintenance_plan ...
// Compatibility note: I_MaintenancePlan elements MaintenancePlanDesc, MaintenancePlanCategory, MaintenanceStrategy (same as packages/eam PL items)
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Maintenance plan compare (reconciliation)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'MaintenancePlan'
@ObjectModel.supportedCapabilities: [ #SQL_DATA_SOURCE, #EXTRACTION_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #D,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZEMT_I_MaintPlanCompare
  as select from I_MaintenancePlan
{
  key MaintenancePlan         as MaintenancePlan,
      MaintenancePlanDesc     as MaintenancePlanDesc,
      MaintenancePlanCategory as MaintenancePlanCategory,
      MaintenanceStrategy     as MaintenanceStrategy
}
