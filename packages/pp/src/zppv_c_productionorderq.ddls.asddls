// ZPPV PP VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZPPV_I_ProductionOrder: orders and quantities per plant and month.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZPPV_I_ProductionOrder applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Production Order Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZPPV_C_ProductionOrderQ
  provider contract analytical_query
  as projection on ZPPV_I_ProductionOrder
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  ProductionPlant,
  @AnalyticsDetails.query.axis: #ROWS
  PlannedEndYearMonth,
  @AnalyticsDetails.query.axis: #FREE
  ManufacturingOrderType,
  @AnalyticsDetails.query.axis: #FREE
  Material,
  @AnalyticsDetails.query.axis: #FREE
  MRPController,
  @AnalyticsDetails.query.axis: #FREE
  ProductionSupervisor,
  @AnalyticsDetails.query.axis: #FREE
  ProductionOrderIsOpen,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCode,
  @AnalyticsDetails.query.axis: #FREE
  ProductionUnit,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfProductionOrders,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfOpenOrders,
  @AnalyticsDetails.query.axis: #COLUMNS
  MfgOrderPlannedTotalQty,
  @AnalyticsDetails.query.axis: #COLUMNS
  MfgOrderConfirmedYieldQty,
  @AnalyticsDetails.query.axis: #COLUMNS
  MfgOrderPlannedScrapQty,
  @AnalyticsDetails.query.axis: #COLUMNS
  ActualDeliveredQuantity
}
