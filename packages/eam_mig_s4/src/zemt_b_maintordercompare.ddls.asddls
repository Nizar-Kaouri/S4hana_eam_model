// ModuPorter EAM migration | Release 1.0.0
// Purpose: Maintenance order on S/4HANA with the business key and the fields compared after the load; element names equal the ECC extract so that tools/mig_reconcile.py compares them by name.
// Example: Export this view after the load and compare it with the ECC extract: python3 tools/mig_reconcile.py fields --module maintenance_order ...
// Compatibility note: I_MaintenanceOrder elements as in packages/eam (OR items); orders created on S/4HANA after the load must be excluded
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Maintenance order compare (reconciliation)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'MaintenanceOrder'
@ObjectModel.supportedCapabilities: [ #SQL_DATA_SOURCE, #EXTRACTION_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #D,
  sizeCategory: #L,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZEMT_B_MaintOrderCompare
  as select from I_MaintenanceOrder
{
  key MaintenanceOrder         as MaintenanceOrder,
      MaintenanceOrderType     as MaintenanceOrderType,
      MaintenanceActivityType  as MaintenanceActivityType,
      MaintPriority            as MaintPriority,
      MaintOrdBasicStartDate   as MaintOrdBasicStartDate,
      MaintOrdBasicEndDate     as MaintOrdBasicEndDate,
      MaintenancePlanningPlant as MaintenancePlanningPlant,
      MainWorkCenter           as MainWorkCenter,
      CostCenter               as CostCenter,
      Equipment                as Equipment,
      FunctionalLocation       as FunctionalLocation
}
