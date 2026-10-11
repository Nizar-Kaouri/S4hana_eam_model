// ModuPorter EAM migration | Release 1.0.0
// Purpose: Record count of maintenance notifications on S/4HANA per NotificationType, MaintenancePlanningPlant; same structure as the ECC count view.
// Example: Export after the load: python3 tools/mig_reconcile.py counts --module maintenance_notification --source <ECC export> --target <this export>.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Maintenance notification count (reconciliation)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.supportedCapabilities: [ #SQL_DATA_SOURCE, #EXTRACTION_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #D,
  sizeCategory: #S,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZEMT_I_MaintNotifCount
  as select from I_MaintenanceNotification
{
  key NotificationType         as NotificationType,
  key MaintenancePlanningPlant as MaintenancePlanningPlant,
      count( * )               as RecordCount
}
group by NotificationType, MaintenancePlanningPlant
