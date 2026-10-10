// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZEAM_R_DowntimeWithTechObj. Downtime and breakdowns per planning plant and equipment category.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// LINK VIEW (ships only when the modules of its provider cube are selected).
// DESIGN NOTE: no DCL (transient query); the DCL of ZEAM_R_DowntimeWithTechObj applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Downtime Analysis by Technical Object'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZEAM_C_DowntimeTechObjQ
  provider contract analytical_query
  as projection on ZEAM_R_DowntimeWithTechObj
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  MaintenancePlanningPlant,
  @AnalyticsDetails.query.axis: #ROWS
  EquipmentCategory,
  @AnalyticsDetails.query.axis: #FREE
  MalfunctionStartYearMonth,
  @AnalyticsDetails.query.axis: #FREE
  NotificationType,
  @AnalyticsDetails.query.axis: #FREE
  MaintenanceObjectIsDown,
  @AnalyticsDetails.query.axis: #FREE
  TechnicalObjectType,
  @AnalyticsDetails.query.axis: #FREE
  ABCIndicator,
  @AnalyticsDetails.query.axis: #FREE
  AssetManufacturerName,
  @AnalyticsDetails.query.axis: #FREE
  FunctionalLocationCategory,
  @AnalyticsDetails.query.axis: #FREE
  Equipment,
  @AnalyticsDetails.query.axis: #FREE
  FunctionalLocation,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfMalfunctions,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfBreakdowns,
  @AnalyticsDetails.query.axis: #COLUMNS
  DowntimeInHours,
  @AnalyticsDetails.query.axis: #COLUMNS
  BreakdownDowntimeInHours
}
