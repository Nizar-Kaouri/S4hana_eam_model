// ZFIV FI VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: G/L cube enriched with G/L account master data (account type, group, balance-sheet flag, texts via
//   the dimension).
// Example: Balance sheet vs. P&L totals per company code; balances per account group.
// LINK VIEW (ships only when modules "gl_account" AND "gl_line_item" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'G/L Line Item with G/L Account'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #C,
  sizeCategory: #XXL,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZFIV_R_GLItemWithAccount
  as select from ZFIV_R_GLJournalItem
  association [0..1] to ZFIV_I_GLAccount as _GLAccount on $projection.ChartOfAccounts = _GLAccount.ChartOfAccounts
    and $projection.GLAccount = _GLAccount.GLAccount
{
  key SourceLedger,
  key CompanyCode,
  key FiscalYear,
  key AccountingDocument,
  key LedgerGLLineItem,
  key Ledger,
      ChartOfAccounts,
      @ObjectModel.foreignKey.association: '_GLAccount'
      GLAccount,
      FiscalPeriod,
      ProfitCenter,
      Segment,
      CompanyCodeCurrency,

      /* Measures */
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      DebitAmount,
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      CreditAmount,
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      AmountInCompanyCodeCurrency,

      /* Attributes via associations (path expressions) */
      _GLAccount.GLAccountType,
      _GLAccount.GLAccountGroup,
      _GLAccount.IsBalanceSheetAccount,

      /* Associations */
      _GLAccount
}
