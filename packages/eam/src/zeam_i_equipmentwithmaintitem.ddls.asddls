// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Equipment with a to-many association to the maintenance items that cover it.
// Example: Find equipment without preventive maintenance (no item) per equipment category.
// LINK VIEW (ships only when modules "equipment" AND "maintenance_plan" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Equipment with Maintenance Items'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Equipment'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZEAM_I_EquipmentWithMaintItem
  as select from ZEAM_I_Equipment
  association [0..*] to ZEAM_I_MaintItem as _MaintenanceItem on $projection.Equipment = _MaintenanceItem.Equipment
{
  key Equipment,
      EquipmentCategory,
      TechnicalObjectType,
      AuthorizationGroup,
      MaintenancePlant,
      MaintenancePlanningPlant,
      PlantSection,
      CompanyCode,
      BusinessArea,
      CostCenter,

      /* Associations */
      _MaintenanceItem
}
