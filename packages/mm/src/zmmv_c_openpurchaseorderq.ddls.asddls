// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZMMV_R_OpenPurchaseOrder: open items per purchasing group and age bucket.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZMMV_R_OpenPurchaseOrder applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Open Purchase Order Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZMMV_C_OpenPurchaseOrderQ
  provider contract analytical_query
  as projection on ZMMV_R_OpenPurchaseOrder
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  PurchasingGroup,
  @AnalyticsDetails.query.axis: #ROWS
  OrderAgeBucket,
  @AnalyticsDetails.query.axis: #FREE
  Supplier,
  @AnalyticsDetails.query.axis: #FREE
  PurchasingOrganization,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCode,
  @AnalyticsDetails.query.axis: #FREE
  Plant,
  @AnalyticsDetails.query.axis: #FREE
  Material,
  @AnalyticsDetails.query.axis: #FREE
  MaterialGroup,
  @AnalyticsDetails.query.axis: #FREE
  AccountAssignmentCategory,
  @AnalyticsDetails.query.axis: #FREE
  DocumentCurrency,
  @AnalyticsDetails.query.axis: #FREE
  PurchaseOrderQuantityUnit,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfOpenItems,
  @AnalyticsDetails.query.axis: #COLUMNS
  NetAmount,
  @AnalyticsDetails.query.axis: #COLUMNS
  OrderQuantity,
  @AnalyticsDetails.query.axis: #COLUMNS
  OrderAgeInDays
}
