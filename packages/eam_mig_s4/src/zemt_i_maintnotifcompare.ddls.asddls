// ModuPorter EAM migration | Release 1.0.0
// Purpose: Maintenance notification on S/4HANA with the business key and the fields compared after the load; element names equal the ECC extract so that tools/mig_reconcile.py compares them by name.
// Example: Export this view after the load and compare it with the ECC extract: python3 tools/mig_reconcile.py fields --module maintenance_notification ...
// Compatibility note: I_MaintenanceNotification elements as in packages/eam (NO items); notifications created on S/4HANA after the load must be excluded (filter by CreationDate or the migration user)
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Maintenance notification compare (reconciliation)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'MaintenanceNotification'
@ObjectModel.supportedCapabilities: [ #SQL_DATA_SOURCE, #EXTRACTION_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #D,
  sizeCategory: #L,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZEMT_I_MaintNotifCompare
  as select from I_MaintenanceNotification
{
  key MaintenanceNotification  as MaintenanceNotification,
      NotificationType         as NotificationType,
      MaintPriority            as MaintPriority,
      RequiredStartDate        as RequiredStartDate,
      RequiredEndDate          as RequiredEndDate,
      Equipment                as Equipment,
      FunctionalLocation       as FunctionalLocation,
      MaintenancePlanningPlant as MaintenancePlanningPlant
}
