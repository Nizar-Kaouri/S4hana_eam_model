// ZFIV FI VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZFIV_R_OpenItemAging: open and overdue amounts per account type and aging bucket.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZFIV_R_OpenItemAging applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Payables and Receivables Aging'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZFIV_C_OpenItemAgingQ
  provider contract analytical_query
  as projection on ZFIV_R_OpenItemAging
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  FinancialAccountType,
  @AnalyticsDetails.query.axis: #ROWS
  AgingBucket,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCode,
  @AnalyticsDetails.query.axis: #FREE
  Supplier,
  @AnalyticsDetails.query.axis: #FREE
  Customer,
  @AnalyticsDetails.query.axis: #FREE
  GLAccount,
  @AnalyticsDetails.query.axis: #FREE
  SpecialGLCode,
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
