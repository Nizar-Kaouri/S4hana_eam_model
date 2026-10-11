// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZEAM_I_MeasPoint. Measuring points and counters per category and reference object type.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZEAM_I_MeasPoint applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Measuring Point Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZEAM_C_MeasPointQ
  provider contract analytical_query
  as projection on ZEAM_I_MeasPoint
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  MeasuringPointCategory,
  @AnalyticsDetails.query.axis: #ROWS
  TechObjIsEquipOrFuncnlLoc,
  @AnalyticsDetails.query.axis: #FREE
  MeasurementRangeUnit,
  @AnalyticsDetails.query.axis: #FREE
  MeasuringPointIsCounter,
  @AnalyticsDetails.query.axis: #FREE
  MeasuringPointIsInactive,
  @AnalyticsDetails.query.axis: #FREE
  Equipment,
  @AnalyticsDetails.query.axis: #FREE
  FunctionalLocation,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfMeasuringPoints,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfCounters
}
