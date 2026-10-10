// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZEAM_R_MaintItem. Preventive maintenance coverage per planning plant and plan category.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZEAM_R_MaintItem applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Maintenance Item Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZEAM_C_MaintItemQ
  provider contract analytical_query
  as projection on ZEAM_R_MaintItem
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  MaintenancePlanningPlant,
  @AnalyticsDetails.query.axis: #ROWS
  MaintenancePlanCategory,
  @AnalyticsDetails.query.axis: #FREE
  MaintenancePlan,
  @AnalyticsDetails.query.axis: #FREE
  MaintenanceStrategy,
  @AnalyticsDetails.query.axis: #FREE
  MaintenancePlanIsInactive,
  @AnalyticsDetails.query.axis: #FREE
  MaintenancePlannerGroup,
  @AnalyticsDetails.query.axis: #FREE
  MainWorkCenter,
  @AnalyticsDetails.query.axis: #FREE
  MaintenanceOrderType,
  @AnalyticsDetails.query.axis: #FREE
  MaintenanceActivityType,
  @AnalyticsDetails.query.axis: #FREE
  Equipment,
  @AnalyticsDetails.query.axis: #FREE
  FunctionalLocation,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfMaintItems,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfItemsWithTaskList
}
