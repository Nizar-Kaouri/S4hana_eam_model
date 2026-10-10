// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZMMV_R_PurchaseOrderItem: purchase volume per purchasing organization and
//   supplier.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZMMV_R_PurchaseOrderItem applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Purchase Order Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZMMV_C_PurchaseOrderQ
  provider contract analytical_query
  as projection on ZMMV_R_PurchaseOrderItem
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  PurchasingOrganization,
  @AnalyticsDetails.query.axis: #ROWS
  Supplier,
  @AnalyticsDetails.query.axis: #FREE
  PurchaseOrderType,
  @AnalyticsDetails.query.axis: #FREE
  PurchasingGroup,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCode,
  @AnalyticsDetails.query.axis: #FREE
  Plant,
  @AnalyticsDetails.query.axis: #FREE
  Material,
  @AnalyticsDetails.query.axis: #FREE
  MaterialGroup,
  @AnalyticsDetails.query.axis: #FREE
  PurchaseOrderItemIsOpen,
  @AnalyticsDetails.query.axis: #FREE
  AccountAssignmentCategory,
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
