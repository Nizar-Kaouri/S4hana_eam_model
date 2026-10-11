// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZEAM_I_NotifDowntime: malfunctions, breakdowns and downtime hours per
//   planning plant and malfunction month, with average downtime per breakdown as a formula.
// Example: Monthly downtime dashboard per plant; drill down to equipment and notification.
// DESIGN NOTE: no DCL (transient query); the DCL of ZEAM_I_NotifDowntime applies (see GEN-Q01).
// TODO-VERIFY[H] RPT-Q01: formula elements ($projection.A / $projection.B with @Aggregation.default: #FORMULA) in a transient analytical query
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Downtime and Breakdown Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZEAM_C_DowntimeQ
  provider contract analytical_query
  as projection on ZEAM_I_NotifDowntime
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  MaintenancePlanningPlant,
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #INTERVAL, multipleSelections: false, mandatory: false }
  MalfunctionStartYearMonth,
  @AnalyticsDetails.query.axis: #FREE
  NotificationType,
  @AnalyticsDetails.query.axis: #FREE
  MaintPriority,
  @AnalyticsDetails.query.axis: #FREE
  MaintenanceObjectIsDown,
  @AnalyticsDetails.query.axis: #FREE
  MalfunctionIsClosed,
  @AnalyticsDetails.query.axis: #FREE
  Equipment,
  @AnalyticsDetails.query.axis: #FREE
  FunctionalLocation,
  @AnalyticsDetails.query.axis: #FREE
  MaintenancePlant,
  @AnalyticsDetails.query.axis: #FREE
  PlantSection,
  @AnalyticsDetails.query.axis: #FREE
  MainWorkCenter,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfMalfunctions,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfBreakdowns,
  @AnalyticsDetails.query.axis: #COLUMNS
  DowntimeInHours,
  @AnalyticsDetails.query.axis: #COLUMNS
  BreakdownDowntimeInHours,
  @Aggregation.default: #FORMULA
  @AnalyticsDetails.query.axis: #COLUMNS
  @EndUserText.label: 'Avg. Downtime per Breakdown (h)'
  $projection.BreakdownDowntimeInHours / $projection.NumberOfBreakdowns as AvgDowntimePerBreakdown
}
