// ZBRG Bridge VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZBRG_I_ProdOrderWithProduct: production orders and quantities per plant and
//   product group.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// LINK VIEW (ships only when modules "mm:product" AND "pp:production_order" are selected).
// DESIGN NOTE: no DCL (transient query); the DCL of ZBRG_I_ProdOrderWithProduct applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Production by Product Group'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZBRG_C_ProdOrderProductQ
  provider contract analytical_query
  as projection on ZBRG_I_ProdOrderWithProduct
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  ProductionPlant,
  @AnalyticsDetails.query.axis: #ROWS
  ProductGroup,
  @AnalyticsDetails.query.axis: #FREE
  PlannedEndYearMonth,
  @AnalyticsDetails.query.axis: #FREE
  Material,
  @AnalyticsDetails.query.axis: #FREE
  ProductType,
  @AnalyticsDetails.query.axis: #FREE
  MRPController,
  @AnalyticsDetails.query.axis: #FREE
  ProductionOrderIsOpen,
  @AnalyticsDetails.query.axis: #FREE
  ProductionUnit,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfProductionOrders,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfOpenOrders,
  @AnalyticsDetails.query.axis: #COLUMNS
  MfgOrderPlannedTotalQty,
  @AnalyticsDetails.query.axis: #COLUMNS
  MfgOrderConfirmedYieldQty
}
