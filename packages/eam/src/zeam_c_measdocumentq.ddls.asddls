// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZEAM_R_MeasDocument. Reading statistics per measuring point and day (unit = MeasurementRangeUnit).
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZEAM_R_MeasDocument applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Measurement Reading Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZEAM_C_MeasDocumentQ
  provider contract analytical_query
  as projection on ZEAM_R_MeasDocument
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  MeasuringPoint,
  @AnalyticsDetails.query.axis: #ROWS
  MsmtRdngDate,
  @AnalyticsDetails.query.axis: #FREE
  MeasuringPointCategory,
  @AnalyticsDetails.query.axis: #FREE
  MeasurementRangeUnit,
  @AnalyticsDetails.query.axis: #FREE
  MsmtValuationCode,
  @AnalyticsDetails.query.axis: #FREE
  Equipment,
  @AnalyticsDetails.query.axis: #FREE
  FunctionalLocation,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfReadings,
  @AnalyticsDetails.query.axis: #COLUMNS
  MinimumReading,
  @AnalyticsDetails.query.axis: #COLUMNS
  MaximumReading,
  @AnalyticsDetails.query.axis: #COLUMNS
  MaximumCounterReading
}
