// ZSDV SD VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZSDV_I_Revenue: revenue per sales organization and sold-to party.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZSDV_I_Revenue applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Revenue Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZSDV_C_RevenueQ
  provider contract analytical_query
  as projection on ZSDV_I_Revenue
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  SalesOrganization,
  @AnalyticsDetails.query.axis: #ROWS
  SoldToParty,
  @AnalyticsDetails.query.axis: #FREE
  BillingDocumentDate,
  @AnalyticsDetails.query.axis: #FREE
  BillingDocumentType,
  @AnalyticsDetails.query.axis: #FREE
  SDDocumentCategory,
  @AnalyticsDetails.query.axis: #FREE
  PayerParty,
  @AnalyticsDetails.query.axis: #FREE
  DistributionChannel,
  @AnalyticsDetails.query.axis: #FREE
  Division,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCode,
  @AnalyticsDetails.query.axis: #FREE
  Material,
  @AnalyticsDetails.query.axis: #FREE
  MaterialGroup,
  @AnalyticsDetails.query.axis: #FREE
  Plant,
  @AnalyticsDetails.query.axis: #FREE
  ProfitCenter,
  @AnalyticsDetails.query.axis: #FREE
  TransactionCurrency,
  @AnalyticsDetails.query.axis: #FREE
  BillingQuantityUnit,
  @AnalyticsDetails.query.axis: #COLUMNS
  RevenueAmount,
  @AnalyticsDetails.query.axis: #COLUMNS
  BillingQuantity,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfBillingItems
}
