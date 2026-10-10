// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per measuring point with description, category, reference object (equipment or
//   functional location as plain fields), characteristic unit, counter indicator and status.
// Example: List all counters (operating hours) of a plant; dimension for measurement reading analysis.
// TODO-VERIFY[M] MP-001: I_MeasuringPoint exists, is released (C1) and its key element is MeasuringPoint
// TODO-VERIFY[M] MP-002: elements MeasuringPointDescription, MeasuringPointCategory, MeasuringPointPositionNumber
// TODO-VERIFY[M] MP-003: reference elements TechObjIsEquipOrFuncnlLoc, Equipment, FunctionalLocation
// TODO-VERIFY[M] MP-004: elements MeasurementRangeUnit, MeasuringPointIsCounter, MeasuringPointDecimalPlaces
// TODO-VERIFY[H] MP-005: inactive indicator assumed MeasuringPointIsInactive; AuthorizationGroup element on measuring point
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Measuring Point'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'MeasuringPoint'
@ObjectModel.modelingPattern: #ANALYTICAL_DIMENSION
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZEAM_I_MeasPoint
  as select from I_MeasuringPoint
{
      @ObjectModel.text.element: [ 'MeasuringPointDescription' ]
  key MeasuringPoint,
      @Semantics.text: true
      MeasuringPointDescription,
      MeasuringPointCategory,
      MeasuringPointPositionNumber,
      TechObjIsEquipOrFuncnlLoc,
      Equipment,
      FunctionalLocation,
      MeasurementRangeUnit,
      MeasuringPointIsCounter,
      MeasuringPointDecimalPlaces,
      MeasuringPointIsInactive,
      AuthorizationGroup
}
