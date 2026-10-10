// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Functional location with a to-many association to its measuring points.
// Example: Condition monitoring overview of a production line.
// LINK VIEW (ships only when modules "functional_location" AND "measuring_point" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Functional Location with Measuring Points'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'FunctionalLocation'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZEAM_I_FuncLocWithMeasPoint
  as select from ZEAM_I_FuncLoc
  association [0..*] to ZEAM_I_MeasPoint as _MeasuringPoint on $projection.FunctionalLocation = _MeasuringPoint.FunctionalLocation
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
      _MeasuringPoint
}
