// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Measuring point cube with counters for all, counter-type and inactive measuring points.
// Example: Coverage of condition monitoring: measuring points per category and reference object type.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Measuring Point - Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZEAM_R_MeasPoint
  as select from ZEAM_I_MeasPoint
  association [1..1] to ZEAM_I_MeasPoint as _MeasuringPoint on $projection.MeasuringPoint = _MeasuringPoint.MeasuringPoint
{
      @ObjectModel.foreignKey.association: '_MeasuringPoint'
  key MeasuringPoint,
      MeasuringPointCategory,
      TechObjIsEquipOrFuncnlLoc,
      Equipment,
      FunctionalLocation,
      MeasurementRangeUnit,
      MeasuringPointIsCounter,
      MeasuringPointIsInactive,
      AuthorizationGroup,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Measuring Points'
      cast( 1 as abap.int4 ) as NumberOfMeasuringPoints,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Counters'
      cast( case when MeasuringPointIsCounter = 'X' then 1 else 0 end as abap.int4 ) as NumberOfCounters,

      /* Associations */
      _MeasuringPoint
}
