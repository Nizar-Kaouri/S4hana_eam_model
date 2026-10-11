// ModuPorter EAM migration | Release 1.0.0
// Purpose: Equipment on S/4HANA with the business key and the fields compared after the load; element names equal the ECC extract so that tools/mig_reconcile.py compares them by name.
// Example: Export this view after the load and compare it with the ECC extract: python3 tools/mig_reconcile.py fields --module equipment ...
// Compatibility note: I_Equipment elements as in packages/eam (EQ items); SerialNumber, Material, ManufacturerSerialNumber, ConstructionYear and InventoryNumber are direct elements
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Equipment compare (reconciliation)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Equipment'
@ObjectModel.supportedCapabilities: [ #SQL_DATA_SOURCE, #EXTRACTION_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #D,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZEMT_I_EquipmentCompare
  as select from I_Equipment
{
  key Equipment                as Equipment,
      EquipmentCategory        as EquipmentCategory,
      TechnicalObjectType      as TechnicalObjectType,
      MaintenancePlanningPlant as MaintenancePlanningPlant,
      FunctionalLocation       as FunctionalLocation,
      SuperordinateEquipment   as SuperordinateEquipment,
      MaintenancePlant         as MaintenancePlant,
      CompanyCode              as CompanyCode,
      CostCenter               as CostCenter,
      Material                 as Material,
      SerialNumber             as SerialNumber,
      ManufacturerSerialNumber as ManufacturerSerialNumber,
      ConstructionYear         as ConstructionYear,
      InventoryNumber          as InventoryNumber
}
where ValidityEndDate = '99991231'
