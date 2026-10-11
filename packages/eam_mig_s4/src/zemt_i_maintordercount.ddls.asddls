// ModuPorter EAM migration | Release 1.0.0
// Purpose: Record count of maintenance orders on S/4HANA per MaintenanceOrderType, MaintenancePlanningPlant; same structure as the ECC count view.
// Example: Export after the load: python3 tools/mig_reconcile.py counts --module maintenance_order --source <ECC export> --target <this export>.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Maintenance order count (reconciliation)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.supportedCapabilities: [ #SQL_DATA_SOURCE, #EXTRACTION_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #D,
  sizeCategory: #S,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZEMT_I_MaintOrderCount
  as select from I_MaintenanceOrder
{
  key MaintenanceOrderType     as MaintenanceOrderType,
  key MaintenancePlanningPlant as MaintenancePlanningPlant,
      count( * )               as RecordCount
}
group by MaintenanceOrderType, MaintenancePlanningPlant
