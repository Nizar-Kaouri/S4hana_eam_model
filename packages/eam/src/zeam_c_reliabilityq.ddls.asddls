// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: MTBF / MTTR query for a reporting period: breakdowns, downtime, observation time and the
//   formulas MTTR = downtime / breakdowns and MTBF = (observation time - downtime) / breakdowns.
// Example: Reliability ranking of equipment in a plant for the last 12 months (enter start and end date).
// DESIGN NOTE: no DCL (transient query); the DCL of ZEAM_R_ReliabilityKPI applies (see GEN-Q01).
// Formula semantics: see RPT-Q01. Division by zero (no breakdowns) is left to the analytical engine.
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Reliability Analysis (MTBF / MTTR)'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZEAM_C_ReliabilityQ
  provider contract analytical_query
  with parameters
    P_StartDate : abap.dats,
    P_EndDate   : abap.dats
  as projection on ZEAM_R_ReliabilityKPI( P_StartDate: $parameters.P_StartDate, P_EndDate: $parameters.P_EndDate )
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  MaintenancePlanningPlant,
  @AnalyticsDetails.query.axis: #ROWS
  Equipment,
  @AnalyticsDetails.query.axis: #FREE
  FunctionalLocation,
  @AnalyticsDetails.query.axis: #FREE
  MaintenancePlant,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfBreakdowns,
  @AnalyticsDetails.query.axis: #COLUMNS
  TotalDowntimeInHours,
  @AnalyticsDetails.query.axis: #COLUMNS
  ObservationTimeInHours,
  @Aggregation.default: #FORMULA
  @AnalyticsDetails.query.axis: #COLUMNS
  @EndUserText.label: 'MTTR (h)'
  $projection.TotalDowntimeInHours / $projection.NumberOfBreakdowns as MeanTimeToRepair,
  @Aggregation.default: #FORMULA
  @AnalyticsDetails.query.axis: #COLUMNS
  @EndUserText.label: 'MTBF (h)'
  ( $projection.ObservationTimeInHours - $projection.TotalDowntimeInHours ) / $projection.NumberOfBreakdowns as MeanTimeBetweenFailures
}
