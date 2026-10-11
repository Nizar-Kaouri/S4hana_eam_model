// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Equipment with a to-many association to the maintenance orders that reference it (order header reference object).
// Example: Order history of an equipment; open orders per equipment in an object page.
// LINK VIEW (ships only when modules "equipment" AND "maintenance_order" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Equipment with Maintenance Orders'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Equipment'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZEAM_B_EquipmentWithOrder
  as select from ZEAM_B_Equipment
  association [0..*] to ZEAM_B_MaintOrder as _MaintenanceOrder on $projection.Equipment = _MaintenanceOrder.Equipment
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
      _MaintenanceOrder
}
