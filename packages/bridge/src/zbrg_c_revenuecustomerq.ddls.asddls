// ZBRG Bridge VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZBRG_I_RevenueWithCustomer: revenue per customer country and sold-to party.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// LINK VIEW (ships only when modules "fi:customer" AND "sd:billing_document" are selected).
// DESIGN NOTE: no DCL (transient query); the DCL of ZBRG_I_RevenueWithCustomer applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Revenue by Customer Country'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZBRG_C_RevenueCustomerQ
  provider contract analytical_query
  as projection on ZBRG_I_RevenueWithCustomer
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  CustomerCountry,
  @AnalyticsDetails.query.axis: #ROWS
  SoldToParty,
  @AnalyticsDetails.query.axis: #FREE
  CustomerAccountGroup,
  @AnalyticsDetails.query.axis: #FREE
  SalesOrganization,
  @AnalyticsDetails.query.axis: #FREE
  DistributionChannel,
  @AnalyticsDetails.query.axis: #FREE
  MaterialGroup,
  @AnalyticsDetails.query.axis: #FREE
  BillingDocumentDate,
  @AnalyticsDetails.query.axis: #FREE
  TransactionCurrency,
  @AnalyticsDetails.query.axis: #COLUMNS
  RevenueAmount,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfBillingItems
}
