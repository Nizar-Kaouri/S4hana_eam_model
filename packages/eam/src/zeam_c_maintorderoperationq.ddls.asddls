// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZEAM_I_MaintOrderOperation. Planned vs. actual work per work center and order type.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZEAM_I_MaintOrderOperation applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Maintenance Order Operation Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZEAM_C_MaintOrderOperationQ
  provider contract analytical_query
  as projection on ZEAM_I_MaintOrderOperation
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  WorkCenter,
  @AnalyticsDetails.query.axis: #ROWS
  MaintenanceOrderType,
  @AnalyticsDetails.query.axis: #FREE
  MaintenancePlanningPlant,
  @AnalyticsDetails.query.axis: #FREE
  MaintenancePlannerGroup,
  @AnalyticsDetails.query.axis: #FREE
  MaintenancePlant,
  @AnalyticsDetails.query.axis: #FREE
  MaintenanceActivityType,
  @AnalyticsDetails.query.axis: #FREE
  OperationControlKey,
  @AnalyticsDetails.query.axis: #FREE
  MaintOrderIsOpen,
  @AnalyticsDetails.query.axis: #FREE
  MaintOrdBasicStartDate,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCode,
  @AnalyticsDetails.query.axis: #FREE
  CostCenter,
  @AnalyticsDetails.query.axis: #FREE
  PlannedWorkQuantityUnit,
  @AnalyticsDetails.query.axis: #FREE
  ActualWorkQuantityUnit,
  @AnalyticsDetails.query.axis: #COLUMNS
  PlannedWorkQuantity,
  @AnalyticsDetails.query.axis: #COLUMNS
  ActualWorkQuantity,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfOperations
}
