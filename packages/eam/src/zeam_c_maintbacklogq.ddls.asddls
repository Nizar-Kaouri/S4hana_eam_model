// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZEAM_I_MaintBacklog. Open orders, open operations and remaining work per work center and age bucket.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZEAM_I_MaintBacklog applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Maintenance Backlog Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZEAM_C_MaintBacklogQ
  provider contract analytical_query
  as projection on ZEAM_I_MaintBacklog
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  WorkCenter,
  @AnalyticsDetails.query.axis: #ROWS
  OrderAgeBucket,
  @AnalyticsDetails.query.axis: #FREE
  Plant,
  @AnalyticsDetails.query.axis: #FREE
  MaintenanceOrderType,
  @AnalyticsDetails.query.axis: #FREE
  MaintenanceActivityType,
  @AnalyticsDetails.query.axis: #FREE
  MaintPriority,
  @AnalyticsDetails.query.axis: #FREE
  MaintenancePlanningPlant,
  @AnalyticsDetails.query.axis: #FREE
  MaintenancePlannerGroup,
  @AnalyticsDetails.query.axis: #FREE
  OperationControlKey,
  @AnalyticsDetails.query.axis: #FREE
  PlannedWorkQuantityUnit,
  @AnalyticsDetails.query.axis: #FREE
  CostCenter,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfOpenOrders,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfOpenOperations,
  @AnalyticsDetails.query.axis: #COLUMNS
  PlannedWorkQuantity,
  @AnalyticsDetails.query.axis: #COLUMNS
  RemainingWorkQuantity,
  @AnalyticsDetails.query.axis: #COLUMNS
  OrderAgeInDays
}
