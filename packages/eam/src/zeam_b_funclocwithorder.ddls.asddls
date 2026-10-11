// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Functional location with a to-many association to the maintenance orders that reference it.
// Example: Order history of a functional location.
// LINK VIEW (ships only when modules "functional_location" AND "maintenance_order" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Functional Location with Maintenance Orders'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'FunctionalLocation'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZEAM_B_FuncLocWithOrder
  as select from ZEAM_B_FuncLoc
  association [0..*] to ZEAM_B_MaintOrder as _MaintenanceOrder on $projection.FunctionalLocation = _MaintenanceOrder.FunctionalLocation
{
  key FunctionalLocation,
      FunctionalLocationLabelName,
      FunctionalLocationCategory,
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
