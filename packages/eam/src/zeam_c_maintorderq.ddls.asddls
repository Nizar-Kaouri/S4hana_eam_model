// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZEAM_I_MaintOrder. Order intake and open orders per planning plant and order type.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZEAM_I_MaintOrder applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Maintenance Order Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZEAM_C_MaintOrderQ
  provider contract analytical_query
  as projection on ZEAM_I_MaintOrder
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  MaintenancePlanningPlant,
  @AnalyticsDetails.query.axis: #ROWS
  MaintenanceOrderType,
  @AnalyticsDetails.query.axis: #FREE
  MaintenanceActivityType,
  @AnalyticsDetails.query.axis: #FREE
  MaintPriority,
  @AnalyticsDetails.query.axis: #FREE
  MaintOrdProcessPhaseCode,
  @AnalyticsDetails.query.axis: #FREE
  MaintOrderIsOpen,
  @AnalyticsDetails.query.axis: #FREE
  MaintenancePlannerGroup,
  @AnalyticsDetails.query.axis: #FREE
  MaintenancePlant,
  @AnalyticsDetails.query.axis: #FREE
  MainWorkCenter,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCode,
  @AnalyticsDetails.query.axis: #FREE
  CostCenter,
  @AnalyticsDetails.query.axis: #FREE
  Equipment,
  @AnalyticsDetails.query.axis: #FREE
  FunctionalLocation,
  @AnalyticsDetails.query.axis: #FREE
  CreationDate,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfOrders,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfOpenOrders,
  @AnalyticsDetails.query.axis: #COLUMNS
  PlannedDurationInDays
}
