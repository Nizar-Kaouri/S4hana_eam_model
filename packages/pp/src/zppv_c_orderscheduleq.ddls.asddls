// ZPPV PP VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZPPV_I_OrderSchedule: open and late orders per plant and delay bucket.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZPPV_I_OrderSchedule applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Production Schedule Adherence'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZPPV_C_OrderScheduleQ
  provider contract analytical_query
  as projection on ZPPV_I_OrderSchedule
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  ProductionPlant,
  @AnalyticsDetails.query.axis: #ROWS
  DelayBucket,
  @AnalyticsDetails.query.axis: #FREE
  MRPController,
  @AnalyticsDetails.query.axis: #FREE
  ProductionSupervisor,
  @AnalyticsDetails.query.axis: #FREE
  ManufacturingOrderType,
  @AnalyticsDetails.query.axis: #FREE
  Material,
  @AnalyticsDetails.query.axis: #FREE
  ProductionOrderIsLate,
  @AnalyticsDetails.query.axis: #FREE
  ProductionUnit,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfOpenOrders,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfLateOrders,
  @AnalyticsDetails.query.axis: #COLUMNS
  DaysLate,
  @AnalyticsDetails.query.axis: #COLUMNS
  OpenQuantity
}
