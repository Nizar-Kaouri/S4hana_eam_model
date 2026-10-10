// ZEMT EAM migration - S/4HANA reconciliation - status: draft-unverified (no SAP system available, never activated)
// Purpose: Record count of equipments on S/4HANA per MaintenancePlanningPlant, EquipmentCategory; same structure as the ECC count view.
// Example: Export after the load: python3 tools/mig_reconcile.py counts --module equipment --source <ECC export> --target <this export>.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Equipment count (reconciliation)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.supportedCapabilities: [ #SQL_DATA_SOURCE, #EXTRACTION_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #D,
  sizeCategory: #S,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZEMT_I_EquipmentCount
  as select from I_Equipment
{
  key MaintenancePlanningPlant as MaintenancePlanningPlant,
  key EquipmentCategory        as EquipmentCategory,
      count( * )               as RecordCount
}
where ValidityEndDate = '99991231'
group by MaintenancePlanningPlant, EquipmentCategory
