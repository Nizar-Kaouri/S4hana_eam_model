// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZEAM_I_MaintOrderWithTechObj. Orders per planning plant and equipment category, with manufacturer and ABC indicator.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// LINK VIEW (ships only when the modules of its provider cube are selected).
// DESIGN NOTE: no DCL (transient query); the DCL of ZEAM_I_MaintOrderWithTechObj applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Order Analysis by Technical Object'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZEAM_C_MaintOrderTechObjQ
  provider contract analytical_query
  as projection on ZEAM_I_MaintOrderWithTechObj
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  MaintenancePlanningPlant,
  @AnalyticsDetails.query.axis: #ROWS
  EquipmentCategory,
  @AnalyticsDetails.query.axis: #FREE
  MaintenanceOrderType,
  @AnalyticsDetails.query.axis: #FREE
  MaintenanceActivityType,
  @AnalyticsDetails.query.axis: #FREE
  MaintPriority,
  @AnalyticsDetails.query.axis: #FREE
  MaintOrderIsOpen,
  @AnalyticsDetails.query.axis: #FREE
  TechnicalObjectType,
  @AnalyticsDetails.query.axis: #FREE
  ABCIndicator,
  @AnalyticsDetails.query.axis: #FREE
  AssetManufacturerName,
  @AnalyticsDetails.query.axis: #FREE
  ConstructionYear,
  @AnalyticsDetails.query.axis: #FREE
  FunctionalLocationCategory,
  @AnalyticsDetails.query.axis: #FREE
  Equipment,
  @AnalyticsDetails.query.axis: #FREE
  FunctionalLocation,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfOrders,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfOpenOrders,
  @AnalyticsDetails.query.axis: #COLUMNS
  PlannedDurationInDays
}
