// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZMMV_R_ConsumptionWithProduct: consumption per plant and product group.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// LINK VIEW (ships only when modules "product" AND "rpt_material_consumption" are selected).
// DESIGN NOTE: no DCL (transient query); the DCL of ZMMV_R_ConsumptionWithProduct applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Consumption by Product Group'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZMMV_C_ConsumptionProductQ
  provider contract analytical_query
  as projection on ZMMV_R_ConsumptionWithProduct
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  Plant,
  @AnalyticsDetails.query.axis: #ROWS
  ProductGroup,
  @AnalyticsDetails.query.axis: #FREE
  PostingYearMonth,
  @AnalyticsDetails.query.axis: #FREE
  Material,
  @AnalyticsDetails.query.axis: #FREE
  ProductType,
  @AnalyticsDetails.query.axis: #FREE
  GoodsMovementType,
  @AnalyticsDetails.query.axis: #FREE
  CostCenter,
  @AnalyticsDetails.query.axis: #FREE
  OrderID,
  @AnalyticsDetails.query.axis: #FREE
  MaterialBaseUnit,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCodeCurrency,
  @AnalyticsDetails.query.axis: #COLUMNS
  ConsumptionQuantity,
  @AnalyticsDetails.query.axis: #COLUMNS
  ConsumptionReversalQuantity,
  @AnalyticsDetails.query.axis: #COLUMNS
  ConsumptionAmount
}
