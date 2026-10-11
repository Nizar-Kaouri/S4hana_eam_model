// ZSDV SD VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZSDV_I_SalesOrderItem: order value per sales organization and sold-to party.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZSDV_I_SalesOrderItem applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Sales Order Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZSDV_C_SalesOrderQ
  provider contract analytical_query
  as projection on ZSDV_I_SalesOrderItem
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  SalesOrganization,
  @AnalyticsDetails.query.axis: #ROWS
  SoldToParty,
  @AnalyticsDetails.query.axis: #FREE
  SalesDocumentType,
  @AnalyticsDetails.query.axis: #FREE
  DistributionChannel,
  @AnalyticsDetails.query.axis: #FREE
  OrganizationDivision,
  @AnalyticsDetails.query.axis: #FREE
  Material,
  @AnalyticsDetails.query.axis: #FREE
  MaterialGroup,
  @AnalyticsDetails.query.axis: #FREE
  Plant,
  @AnalyticsDetails.query.axis: #FREE
  SalesOrderItemIsOpen,
  @AnalyticsDetails.query.axis: #FREE
  TransactionCurrency,
  @AnalyticsDetails.query.axis: #FREE
  OrderQuantityUnit,
  @AnalyticsDetails.query.axis: #COLUMNS
  NetAmount,
  @AnalyticsDetails.query.axis: #COLUMNS
  OrderQuantity,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfItems,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfOpenItems
}
