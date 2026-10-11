// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZMMV_I_StockWithProduct: stock per plant and product group.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// LINK VIEW (ships only when modules "product" AND "material_stock" are selected).
// DESIGN NOTE: no DCL (transient query); the DCL of ZMMV_I_StockWithProduct applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Stock by Product Group'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZMMV_C_StockProductQ
  provider contract analytical_query
  as projection on ZMMV_I_StockWithProduct
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  Plant,
  @AnalyticsDetails.query.axis: #ROWS
  ProductGroup,
  @AnalyticsDetails.query.axis: #FREE
  Product,
  @AnalyticsDetails.query.axis: #FREE
  ProductType,
  @AnalyticsDetails.query.axis: #FREE
  CrossPlantStatus,
  @AnalyticsDetails.query.axis: #FREE
  StorageLocation,
  @AnalyticsDetails.query.axis: #FREE
  InventoryStockType,
  @AnalyticsDetails.query.axis: #FREE
  MaterialBaseUnit,
  @AnalyticsDetails.query.axis: #COLUMNS
  MatlWrhsStkQtyInMatlBaseUnit,
  @AnalyticsDetails.query.axis: #COLUMNS
  UnrestrictedStockQuantity
}
