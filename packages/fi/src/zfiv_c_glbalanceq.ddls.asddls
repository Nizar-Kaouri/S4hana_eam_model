// ZFIV FI VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZFIV_I_GLJournalItem: debit, credit and balance per company code and G/L account
//   (trial balance).
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZFIV_I_GLJournalItem applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'G/L Balance Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZFIV_C_GLBalanceQ
  provider contract analytical_query
  as projection on ZFIV_I_GLJournalItem
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  CompanyCode,
  @AnalyticsDetails.query.axis: #ROWS
  GLAccount,
  @AnalyticsDetails.query.axis: #FREE
  FiscalYear,
  @AnalyticsDetails.query.axis: #FREE
  FiscalPeriod,
  @AnalyticsDetails.query.axis: #FREE
  Ledger,
  @AnalyticsDetails.query.axis: #FREE
  ChartOfAccounts,
  @AnalyticsDetails.query.axis: #FREE
  AccountingDocumentType,
  @AnalyticsDetails.query.axis: #FREE
  FinancialAccountType,
  @AnalyticsDetails.query.axis: #FREE
  ProfitCenter,
  @AnalyticsDetails.query.axis: #FREE
  Segment,
  @AnalyticsDetails.query.axis: #FREE
  BusinessArea,
  @AnalyticsDetails.query.axis: #FREE
  FunctionalArea,
  @AnalyticsDetails.query.axis: #FREE
  CostCenter,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCodeCurrency,
  @AnalyticsDetails.query.axis: #FREE
  GlobalCurrency,
  @AnalyticsDetails.query.axis: #COLUMNS
  DebitAmount,
  @AnalyticsDetails.query.axis: #COLUMNS
  CreditAmount,
  @AnalyticsDetails.query.axis: #COLUMNS
  AmountInCompanyCodeCurrency
}
