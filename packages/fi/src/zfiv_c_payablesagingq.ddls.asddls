// ZFIV FI VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZFIV_I_OpenItemWithSupplier: open and overdue amounts per supplier and aging
//   bucket.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// LINK VIEW (ships only when modules "open_items" AND "supplier" are selected).
// DESIGN NOTE: no DCL (transient query); the DCL of ZFIV_I_OpenItemWithSupplier applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Payables Aging by Supplier'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZFIV_C_PayablesAgingQ
  provider contract analytical_query
  as projection on ZFIV_I_OpenItemWithSupplier
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  Supplier,
  @AnalyticsDetails.query.axis: #ROWS
  AgingBucket,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCode,
  @AnalyticsDetails.query.axis: #FREE
  Country,
  @AnalyticsDetails.query.axis: #FREE
  SupplierAccountGroup,
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
