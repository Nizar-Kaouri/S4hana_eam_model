// ZFIV FI VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZFIV_R_OpenItemWithCustomer: open and overdue amounts per customer and aging
//   bucket.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// LINK VIEW (ships only when modules "open_items" AND "customer" are selected).
// DESIGN NOTE: no DCL (transient query); the DCL of ZFIV_R_OpenItemWithCustomer applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Receivables Aging by Customer'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZFIV_C_ReceivablesAgingQ
  provider contract analytical_query
  as projection on ZFIV_R_OpenItemWithCustomer
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  Customer,
  @AnalyticsDetails.query.axis: #ROWS
  AgingBucket,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCode,
  @AnalyticsDetails.query.axis: #FREE
  Country,
  @AnalyticsDetails.query.axis: #FREE
  CustomerAccountGroup,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCodeCurrency,
  @AnalyticsDetails.query.axis: #COLUMNS
  AmountInCompanyCodeCurrency,
  @AnalyticsDetails.query.axis: #COLUMNS
  OverdueAmount,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfOpenItems,
  @AnalyticsDetails.query.axis: #COLUMNS
  DaysOverdue
}
