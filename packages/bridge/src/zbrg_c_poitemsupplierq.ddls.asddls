// ZBRG Bridge VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZBRG_R_POItemWithSupplier: purchase volume per supplier country and supplier.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// LINK VIEW (ships only when modules "fi:supplier" AND "mm:purchase_order" are selected).
// DESIGN NOTE: no DCL (transient query); the DCL of ZBRG_R_POItemWithSupplier applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Purchasing by Supplier Country'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZBRG_C_POItemSupplierQ
  provider contract analytical_query
  as projection on ZBRG_R_POItemWithSupplier
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  SupplierCountry,
  @AnalyticsDetails.query.axis: #ROWS
  Supplier,
  @AnalyticsDetails.query.axis: #FREE
  SupplierAccountGroup,
  @AnalyticsDetails.query.axis: #FREE
  PurchasingOrganization,
  @AnalyticsDetails.query.axis: #FREE
  PurchasingGroup,
  @AnalyticsDetails.query.axis: #FREE
  Plant,
  @AnalyticsDetails.query.axis: #FREE
  MaterialGroup,
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
