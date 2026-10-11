// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Equipment with a to-many association to the measuring points / counters defined for it.
// Example: Show all counters of an equipment with their latest readings (via the measurement document module).
// LINK VIEW (ships only when modules "equipment" AND "measuring_point" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Equipment with Measuring Points'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Equipment'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZEAM_B_EquipmentWithMeasPoint
  as select from ZEAM_B_Equipment
  association [0..*] to ZEAM_B_MeasPoint as _MeasuringPoint on $projection.Equipment = _MeasuringPoint.Equipment
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
      _MeasuringPoint
}
