// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZMMV_R_POItemWithProduct: purchase volume per purchasing organization and product
//   group.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// LINK VIEW (ships only when modules "product" AND "purchase_order" are selected).
// DESIGN NOTE: no DCL (transient query); the DCL of ZMMV_R_POItemWithProduct applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Purchasing by Product Group'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZMMV_C_POItemProductQ
  provider contract analytical_query
  as projection on ZMMV_R_POItemWithProduct
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  PurchasingOrganization,
  @AnalyticsDetails.query.axis: #ROWS
  ProductGroup,
  @AnalyticsDetails.query.axis: #FREE
  Supplier,
  @AnalyticsDetails.query.axis: #FREE
  PurchasingGroup,
  @AnalyticsDetails.query.axis: #FREE
  Plant,
  @AnalyticsDetails.query.axis: #FREE
  Material,
  @AnalyticsDetails.query.axis: #FREE
  ProductType,
  @AnalyticsDetails.query.axis: #FREE
  PurchaseOrderItemIsOpen,
  @AnalyticsDetails.query.axis: #FREE
  DocumentCurrency,
  @AnalyticsDetails.query.axis: #FREE
  PurchaseOrderQuantityUnit,
  @AnalyticsDetails.query.axis: #COLUMNS
  NetAmount,
  @AnalyticsDetails.query.axis: #COLUMNS
  OrderQuantity,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfItems,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfOpenItems
}
