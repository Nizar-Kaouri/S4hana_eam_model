// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Fleet MTBF / MTTR query over the whole equipment population for a reporting period.
// Example: MTBF per equipment category and plant, including equipment that never broke down.
// LINK VIEW (ships only when modules "rpt_reliability" AND "equipment" are selected).
// DESIGN NOTE: no DCL (transient query); the DCL of ZEAM_R_EquipmentReliability applies (see GEN-Q01, RPT-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Fleet Reliability Analysis (MTBF / MTTR)'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZEAM_C_EquipReliabilityQ
  provider contract analytical_query
  with parameters
    P_StartDate : abap.dats,
    P_EndDate   : abap.dats
  as projection on ZEAM_R_EquipmentReliability( P_StartDate: $parameters.P_StartDate, P_EndDate: $parameters.P_EndDate )
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  MaintenancePlanningPlant,
  @AnalyticsDetails.query.axis: #ROWS
  EquipmentCategory,
  @AnalyticsDetails.query.axis: #FREE
  Equipment,
  @AnalyticsDetails.query.axis: #FREE
  TechnicalObjectType,
  @AnalyticsDetails.query.axis: #FREE
  ABCIndicator,
  @AnalyticsDetails.query.axis: #FREE
  AssetManufacturerName,
  @AnalyticsDetails.query.axis: #FREE
  MaintenancePlant,
  @AnalyticsDetails.query.axis: #FREE
  PlantSection,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfEquipments,
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
