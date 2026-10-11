// ZSDV SD VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZSDV_I_OpenSalesOrder: order backlog per sales organization and age bucket.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZSDV_I_OpenSalesOrder applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Open Sales Order Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZSDV_C_OpenSalesOrderQ
  provider contract analytical_query
  as projection on ZSDV_I_OpenSalesOrder
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  SalesOrganization,
  @AnalyticsDetails.query.axis: #ROWS
  OrderAgeBucket,
  @AnalyticsDetails.query.axis: #FREE
  SoldToParty,
  @AnalyticsDetails.query.axis: #FREE
  SalesDocumentType,
  @AnalyticsDetails.query.axis: #FREE
  DistributionChannel,
  @AnalyticsDetails.query.axis: #FREE
  Material,
  @AnalyticsDetails.query.axis: #FREE
  MaterialGroup,
  @AnalyticsDetails.query.axis: #FREE
  Plant,
  @AnalyticsDetails.query.axis: #FREE
  TransactionCurrency,
  @AnalyticsDetails.query.axis: #FREE
  OrderQuantityUnit,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfOpenItems,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfOverdueItems,
  @AnalyticsDetails.query.axis: #COLUMNS
  NetAmount,
  @AnalyticsDetails.query.axis: #COLUMNS
  OrderQuantity,
  @AnalyticsDetails.query.axis: #COLUMNS
  OrderAgeInDays
}
